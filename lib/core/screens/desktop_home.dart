import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/common_const.dart';
import 'package:my_portfolio/core/widgets/desktop_header.dart';

class DesktopHomeScreen extends StatelessWidget {
  const DesktopHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DesktopHeader(
            items: CommonConst.headerItems,
          )
        ],
      ),
    );
  }
}
