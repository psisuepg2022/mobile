import 'package:flutter/material.dart';
import 'package:mobile/shared/themes/app_colors.dart';

import '../../themes/app_text_styles.dart';

class LabelButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final TextStyle? style;
  const LabelButtonWidget(
      {super.key, required this.label, required this.onPressed, this.style});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: AppColors.primary,
      ),
      width: double.maxFinite,
      child: TextButton(
          onPressed: onPressed,
          child: Text(
            label,
            style: style ?? TextStyles.whiteLabel,
          )),
    );
  }
}
