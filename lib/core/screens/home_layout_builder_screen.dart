import 'package:flutter/material.dart';
import 'package:my_portfolio/core/screens/desktop_home.dart';
import 'package:my_portfolio/core/screens/mobile_home.dart';

import 'responsive.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: DesktopHomeScreen(),
      mobile: MobileHomeScreen(),
    );
  }
}
