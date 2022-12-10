import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';
import '../../themes/app_text_styles.dart';

class TextInputWidget extends StatefulWidget {
  final String label;
  final IconData? icon;
  final bool? passwordType;
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
      this.controller,
      this.passwordType})
      : super(key: key);

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  @override
  Widget build(BuildContext context) {
    bool hiddenPassword = false;

    @override
    void initState() {
      hiddenPassword = false;
      super.initState();
    }

    void togglePasswordView() {
      print(hiddenPassword);
      setState(() {
        hiddenPassword = !hiddenPassword;
      });
    }

    return AnimatedCard(
      direction: AnimatedCardDirection.left,
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          children: [
            TextFormField(
              controller: widget.controller,
              initialValue: widget.initalValue,
              validator: widget.validator,
              onChanged: widget.onChanged,
              obscureText: hiddenPassword,
              enableSuggestions: !hiddenPassword,
              autocorrect: !hiddenPassword,
              style: TextStyles.input,
              decoration: InputDecoration(
                  suffix: widget.label == 'Senha'
                      ? InkWell(
                          onTap: togglePasswordView,
                          child: Icon(
                              hiddenPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: AppColors.primary))
                      : null,
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      borderSide:
                          BorderSide(color: AppColors.primary, width: 1)),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  labelText: widget.label,
                  labelStyle: TextStyles.input,
                  prefixIcon: widget.icon != null
                      ? Icon(
                          widget.icon,
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
