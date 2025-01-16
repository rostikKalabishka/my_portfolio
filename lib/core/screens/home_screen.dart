import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/colars_const.dart';
import 'package:my_portfolio/core/constants/common_const.dart';
import 'package:my_portfolio/core/constants/page_size_const.dart';

import 'package:my_portfolio/core/widgets/desktop_header.dart';
import 'package:my_portfolio/core/widgets/mobile_drawer.dart';
import 'package:my_portfolio/core/widgets/mobile_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(4, (index) => GlobalKey());
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: AppColors.darkBackground,
          endDrawer: constraints.maxWidth >= PageSizeConst.mobileBreakpoint
              ? null
              : DrawerMobile(
                  onNavItemTap: (int index) {
                    scaffoldKey.currentState?.closeEndDrawer();
                    scrollToSection(index);
                  },
                ),
          body: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                SizedBox(key: navbarKeys.first),
                if (constraints.maxWidth >= PageSizeConst.mobileBreakpoint)
                  DesktopHeader(
                    items: CommonConst.headerItems,
                    onNavItemTap: (int index) {
                      scrollToSection(index);
                    },
                  )
                else
                  HeaderMobile(
                    onLogoTap: () {},
                    onMenuTap: () {
                      scaffoldKey.currentState?.openEndDrawer();
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  void scrollToSection(int navIndex) {
    final key = navbarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
