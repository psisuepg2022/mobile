import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/modules/home/home_page.dart';
import 'package:mobile/modules/login/login_page.dart';
import 'package:mobile/shared/themes/app_colors.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'modules/splash/splash_page.dart';

void main() {
  tz.initializeTimeZones();
  initializeDateFormatting('pt_BR', null)
      .then((_) => runApp(const ProviderScope(child: MyApp())));
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
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => const SplashPage(),
        "/home": (context) => const HomePage(),
        "/login": (context) => const LoginPage()
      },
    );
  }
}
