import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/page_size_const.dart';

class Responsive extends StatelessWidget {
  final Widget desktop;

  final Widget mobile;

  const Responsive({super.key, required this.desktop, required this.mobile});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= PageSizeConst.mobileBreakpoint) {
          return mobile;
        } else {
          return desktop;
        }
      },
    );
  }
}
