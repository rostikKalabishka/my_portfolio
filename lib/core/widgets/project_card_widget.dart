import 'dart:js' as js;

import 'package:flutter/material.dart';

import 'package:my_portfolio/core/constants/colars_const.dart';
import 'package:my_portfolio/core/model/my_project.dart';

class ProjectCardWidget extends StatelessWidget {
  const ProjectCardWidget({
    super.key,
    required this.project,
  });
  final MyProject project;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        js.context.callMethod('open', [project.urlOnGitHub]);
      },
      child: Container(
        clipBehavior: Clip.antiAlias,
        height: 320,
        width: 260,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.darkCard,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // project img
            Image.asset(
              project.image,
              height: 140,
              width: 260,
              fit: BoxFit.cover,
            ),
            // title
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 15, 12, 12),
              child: Text(
                project.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.darkText,
                ),
              ),
            ),
            // subtitle
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
              child: Text(
                project.subtitle,
                overflow: TextOverflow.fade,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.darkText,
                ),
              ),
            ),
            const Spacer(),
            // footer
          ],
        ),
      ),
    );
  }
}
