import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:mobile/shared/models/Clinic/clinic_list.dart';
import 'package:mobile/shared/models/Clinic/clinic_options.dart';
import 'package:mobile/shared/widgets/dropdown_menu/dropdown_menu.dart';
import 'package:mobile/shared/widgets/label_button/label_button.dart';
import 'package:mobile/shared/widgets/text_input/text_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    ClinicListModel clinics =
        ModalRoute.of(context)!.settings.arguments as ClinicListModel;

    List<ClinicOptions> clinicOptions = [
      ...clinics.items.map((e) {
        return ClinicOptions(name: e.name, value: e.code);
      })
    ];

    print(clinicOptions);

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
                  DropdownMenuWidget(label: 'Clínica', options: clinicOptions),
                  TextInputWidget(
                      label: "Usuário",
                      onChanged: (value) {
                        print(value);
                      }),
                  TextInputWidget(
                      passwordType: true,
                      label: "Senha",
                      onChanged: (value) {
                        print(value);
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  AnimatedCard(
                      direction: AnimatedCardDirection.left,
                      child: LabelButtonWidget(
                        label: 'ENTRAR',
                        onPressed: () {},
                      ))
                ],
              ),
            )
          ]),
    ));
  }
}
