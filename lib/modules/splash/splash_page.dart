import 'package:flutter/material.dart';
import 'package:mobile/shared/themes/app_colors.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgrey,
      child: const Text(
        'Bem-vindo ao PSIS',
        style: TextStyle(color: AppColors.text, fontWeight: FontWeight.w400),
      ),
    );
  }
}
