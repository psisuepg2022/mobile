import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/modules/home/home_page.dart';
import 'package:mobile/shared/themes/app_colors.dart';

import 'modules/splash/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "PSIS",
        theme: ThemeData(
            primarySwatch: Colors.green,
            primaryColor: AppColors.primary,
            textTheme: GoogleFonts.poppinsTextTheme()),
        initialRoute: "/home",
        routes: {
          "/splash": (context) => const SplashPage(),
          "/home": (context) => const HomePage()
        });
  }
}
