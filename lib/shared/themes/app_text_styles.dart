import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/shared/themes/app_colors.dart';

class TextStyles {
  static final titleBig = GoogleFonts.poppins(
    fontSize: 80,
    fontWeight: FontWeight.w200,
    color: const Color(0xFFFFFFFF),
  );
  static final welcome = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: const Color(0xFFFFFFFF),
  );
  static final input = GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColors.text,
  );
  static final inputFocus = GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColors.primary,
  );
}
