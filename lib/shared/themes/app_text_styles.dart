import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/shared/themes/app_colors.dart';

class TextStyles {
  static final titleBig = GoogleFonts.poppins(
    fontSize: 80,
    fontWeight: FontWeight.w200,
    color: Colors.white,
  );
  static final subtitleLogin = GoogleFonts.poppins(
    fontSize: 22,
    fontWeight: FontWeight.w400,
    color: AppColors.primary,
  );
  static final welcome = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: Colors.white,
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
  static final whiteLabel = GoogleFonts.poppins(
      fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white);

  static final primaryLabel = GoogleFonts.poppins(
      fontSize: 15, fontWeight: FontWeight.w400, color: AppColors.primary);
  static final eventCounter = GoogleFonts.poppins(
      fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white);
  static final eventCardTitle = GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: AppColors.text,
  );
}
