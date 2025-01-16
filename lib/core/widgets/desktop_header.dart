// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/colars_const.dart';

import 'package:my_portfolio/core/widgets/site_logo.dart';

class DesktopHeader extends StatelessWidget {
  const DesktopHeader({
    Key? key,
    required this.items,
    required this.onNavItemTap,
  }) : super(key: key);

  final List<String> items;
  final Function(int) onNavItemTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.white,
        gradient: const LinearGradient(
          colors: [
            Colors.transparent,
            AppColors.darkPrimary,
            AppColors.darkAccent,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const SiteLogo(),
          const SizedBox(width: 16),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                for (int i = 0; i < items.length; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextButton(
                      onPressed: () {
                        onNavItemTap(i);
                      },
                      child: Text(
                        items[i],
                        style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.darkText,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
