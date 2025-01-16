import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/colars_const.dart';
import 'package:my_portfolio/core/constants/common_const.dart';

class DesktopSkills extends StatelessWidget {
  const DesktopSkills({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 500),
      child: Wrap(
        spacing: 10.0,
        runSpacing: 10.0,
        alignment: WrapAlignment.center,
        children: [
          for (int i = 0; i < CommonConst.mySkills.length; i++)
            Chip(
              padding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 16.0,
              ),
              backgroundColor: AppColors.darkCard,
              label: Text(CommonConst.mySkills[i].name),
              avatar: Image.asset(
                CommonConst.mySkills[i].image,
                width: 28,
                height: 28,
              ),
            ),
        ],
      ),
    );
  }
}
