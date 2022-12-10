import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:mobile/shared/themes/app_colors.dart';

class DropdownMenuWidget extends StatelessWidget {
  final String label;
  const DropdownMenuWidget({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

    return AnimatedCard(
      direction: AnimatedCardDirection.left,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: SizedBox(
            width: double.maxFinite,
            height: 50,
            child: DropdownButtonFormField<String>(
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                isExpanded: true,
                decoration: InputDecoration(
                  labelText: label,
                  isCollapsed: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2),
                      borderSide:
                          const BorderSide(color: AppColors.primary, width: 1)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2),
                      borderSide:
                          const BorderSide(color: AppColors.primary, width: 1)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2),
                      borderSide:
                          const BorderSide(color: AppColors.primary, width: 1)),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                ),
                onChanged: (String? value) {
                  print(value);
                })),
      ),
    );
  }
}
