import 'package:flutter/material.dart';
import 'package:mobile/shared/themes/app_colors.dart';

import '../../themes/app_text_styles.dart';

class LabelButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool? onLoading;
  final bool? reversed;
  final TextStyle? style;
  const LabelButtonWidget(
      {super.key,
      required this.label,
      required this.onPressed,
      this.style,
      this.onLoading,
      this.reversed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        border: reversed != null && reversed == true
            ? Border.all(color: AppColors.primary)
            : null,
        color: reversed != null && reversed == true
            ? Colors.white
            : AppColors.primary,
      ),
      width: double.maxFinite,
      child: onLoading == true
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
              ],
            )
          : TextButton(
              onPressed: onPressed,
              child: Text(
                label,
                style: style ?? TextStyles.whiteLabel,
              )),
    );
  }
}
