import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/colars_const.dart';
import 'package:my_portfolio/core/constants/common_const.dart';
import 'package:my_portfolio/core/widgets/project_card_widget.dart';

class ProjectSession extends StatelessWidget {
  const ProjectSession({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
        width: screenWidth,
        padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
        child: Column(children: [
          // Work projects title
          const Text(
            "My Projects",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.darkText,
            ),
          ),
          const SizedBox(height: 50),
          // Work projects cards
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Wrap(
              spacing: 25,
              runSpacing: 25,
              children: [
                for (int i = 0; i < CommonConst.myProject.length; i++)
                  ProjectCardWidget(
                    project: CommonConst.myProject[i],
                  ),
              ],
            ),
          ),
        ]));
  }
}
