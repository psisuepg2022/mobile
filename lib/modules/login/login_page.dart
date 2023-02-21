import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/modules/login/login_controller.dart';
import 'package:mobile/providers/auth/auth_provider.dart';
import 'package:mobile/shared/models/User/user_model.dart';
import 'package:mobile/shared/widgets/label_button/label_button.dart';
import 'package:mobile/shared/widgets/text_input/text_input.dart';

import '../../shared/models/Clinic/clinic_list.dart';
import '../../shared/models/Clinic/clinic_options.dart';
import '../../shared/widgets/dropdown_menu/dropdown_menu.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final controller = LoginController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    ClinicListModel clinics =
        ModalRoute.of(context)!.settings.arguments as ClinicListModel;

    List<ClinicOptions> clinicOptions = [
      ...clinics.items.map((e) {
        return ClinicOptions(name: e.name, value: e.code);
      })
    ];

    Future<void> handleSignIn() async {
      try {
        setState(() {
          loading = true;
        });

        ref
            .read(Auth.provider.notifier)
            .setUser(UserModel("userName", "name", 1000, "email", 60));
        Navigator.of(context).pushReplacementNamed("/home");
        // await controller.signIn().then((value) => {
        //       print(value),

        //       // Navigator.of(context)
        //       //     .pushReplacementNamed("/login", arguments: value.content),
        //     });
      } catch (e) {
        print(e);
      } finally {
        setState(() {
          loading = false;
        });
      }
    }

    return Scaffold(
        body: SafeArea(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/PSIS-Logo-Invertido-Transparente.png',
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  DropdownMenuWidget(
                    label: 'Clínica',
                    options: clinicOptions,
                    onChanged: (value) {
                      controller.onChange(accessCode: "$value");
                    },
                  ),
                  TextInputWidget(
                      label: "Usuário",
                      onChanged: (value) {
                        controller.onChange(userName: value);
                      }),
                  TextInputWidget(
                      passwordType: true,
                      label: "Senha",
                      onChanged: (value) {
                        controller.onChange(password: value);
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  AnimatedCard(
                      direction: AnimatedCardDirection.left,
                      child: LabelButtonWidget(
                        label: 'ENTRAR',
                        onLoading: loading,
                        onPressed: () {
                          handleSignIn();
                        },
                      ))
                ],
              ),
            )
          ]),
    ));
  }
}
