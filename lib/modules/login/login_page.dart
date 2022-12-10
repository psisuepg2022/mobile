import 'package:flutter/material.dart';
import 'package:mobile/shared/widgets/text_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
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
                  TextInputWidget(
                      label: "Usuário",
                      onChanged: (value) {
                        print(value);
                      }),
                  TextInputWidget(
                      label: "Senha",
                      onChanged: (value) {
                        print(value);
                      }),
                ],
              ),
            )
          ]),
    ));
  }
}
