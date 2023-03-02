import 'dart:io';

import 'package:animated_card/animated_card.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mobile/modules/login/login_controller.dart';
import 'package:mobile/providers/auth/auth_provider.dart';
import 'package:mobile/service/index.dart';
import 'package:mobile/shared/models/Error/error_response_model.dart';
import 'package:mobile/shared/models/User/user_model.dart';
import 'package:mobile/shared/themes/app_text_styles.dart';
import 'package:mobile/shared/widgets/label_button/label_button.dart';
import 'package:mobile/shared/widgets/snackbar/snackbar_widget.dart';
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

    Future<void> handleSignIn(BuildContext context) async {
      try {
        setState(() {
          loading = true;
        });

        final res = await controller.signIn();
        Map<String, dynamic> decodedAccessToken =
            JwtDecoder.decode(res.content.accessToken);

        UserModel userData = UserModel.fromMap(decodedAccessToken);

        if (!userData.permissions.contains('USER_TYPE_PROFESSIONAL')) {
          if (!mounted) return;
          GlobalSnackBar.show(context,
              "É preciso entrar com uma conta de profissional da clínica.");
          return;
        }

        dio.options.headers[HttpHeaders.authorizationHeader] =
            "bearer ${res.content.accessToken}";

        ref.read(authProvider).setUser(
            userData, res.content.refreshToken, res.content.accessToken);

        if (!mounted) return;
        Navigator.of(context)
            .pushReplacementNamed("/home", arguments: res.content);
      } catch (e) {
        if (e is DioError) {
          ErrorResponseModel response =
              ErrorResponseModel.fromJson(e.response?.data);

          GlobalSnackBar.show(
              context,
              response.message != ""
                  ? response.message
                  : "Ocorreu um erro ao entrar. Tente novamente.");
        }
      } finally {
        setState(() {
          loading = false;
        });
      }
    }

    return Scaffold(
        body: SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Image.asset(
                    'assets/images/PSIS-Logo-Invertido-Transparente.png',
                    height: 100,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "Acompanhe suas consultas no aplicativo para profissionais da clínica",
                    style: TextStyles.subtitleLogin,
                    textAlign: TextAlign.center,
                  ),
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
                              handleSignIn(context);
                            },
                          ))
                    ],
                  ),
                )
              ]),
        ),
      ),
    ));
  }
}
