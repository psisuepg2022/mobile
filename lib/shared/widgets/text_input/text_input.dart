import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';
import '../../themes/app_text_styles.dart';

class TextInputWidget extends StatelessWidget {
  final String label;
  final IconData? icon;
  final String? initalValue;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String value) onChanged;
  const TextInputWidget(
      {Key? key,
      required this.label,
      this.icon,
      required this.onChanged,
      this.initalValue,
      this.validator,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.left,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8, top: 16),
        child: Column(
          children: [
            TextFormField(
              controller: controller,
              initialValue: initalValue,
              validator: validator,
              onChanged: onChanged,
              style: TextStyles.input,
              decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      borderSide:
                          BorderSide(color: AppColors.primary, width: 1)),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  labelText: label,
                  labelStyle: TextStyles.input,
                  prefixIcon: icon != null
                      ? Icon(
                          icon,
                          color: AppColors.primary,
                        )
                      : null,
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      borderSide:
                          BorderSide(color: AppColors.primary, width: 1))),
            )
          ],
        ),
      ),
    );
  }
}
