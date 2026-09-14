import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/utils/app_colors.dart';
import 'package:fruit_hub_dashboard/core/utils/app_text_styles.dart';

class IsOrganicCheckBox extends StatefulWidget {
  const IsOrganicCheckBox({super.key, required this.onChanged});

  final ValueChanged<bool> onChanged;

  @override
  State<IsOrganicCheckBox> createState() => IsOrganicCheckBoxState();
}

class IsOrganicCheckBoxState extends State<IsOrganicCheckBox> {
  bool isOrganic = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Is Product Organic?',
                style: TextStyles.semiBold13.copyWith(color: Color(0xff949d9e)),
              ),
            ],
          ),
        ),
        const Spacer(),
        Checkbox(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          checkColor: Colors.white,
          activeColor: AppColors.primaryColor,
          value: isOrganic,
          onChanged: (value) {
            setState(() {
              isOrganic = value ?? false;
            });

            widget.onChanged(isOrganic);
          },
        ),
      ],
    );
  }
}
