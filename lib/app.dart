import 'package:flutter/material.dart';
import 'package:mobile/modules/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "PSIS",
        theme: ThemeData(fontFamily: "Poppins"),
        initialRoute: "/splash",
        routes: {"/splash": (context) => const SplashPage()});
  }
}
