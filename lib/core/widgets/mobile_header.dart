import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/colars_const.dart';
import 'package:my_portfolio/core/widgets/site_logo.dart';

class HeaderMobile extends StatelessWidget {
  const HeaderMobile({
    super.key,
    this.onLogoTap,
    this.onMenuTap,
  });
  final VoidCallback? onLogoTap;
  final VoidCallback? onMenuTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      margin: const EdgeInsets.fromLTRB(40, 5, 20, 5),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Colors.transparent,
            AppColors.darkPrimary,
            AppColors.darkAccent,
          ],
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        children: [
          SiteLogo(),
          const Spacer(),
          IconButton(
            onPressed: onMenuTap,
            icon: const Icon(Icons.menu),
          ),
          const SizedBox(width: 15),
        ],
      ),
    );
  }
}
