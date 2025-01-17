import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/colars_const.dart';
import 'package:my_portfolio/core/constants/common_const.dart';
import 'package:my_portfolio/core/constants/page_size_const.dart';
import 'package:my_portfolio/core/screens/model/home_page_model.dart';
import 'package:my_portfolio/core/widgets/desktop_header.dart';
import 'package:my_portfolio/core/widgets/desktop_mobile.dart';
import 'package:my_portfolio/core/widgets/form_widget.dart';
import 'package:my_portfolio/core/widgets/mobile_drawer.dart';
import 'package:my_portfolio/core/widgets/mobile_header.dart';
import 'package:my_portfolio/core/widgets/project_session.dart';
import 'package:my_portfolio/core/widgets/skills_mobile.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(4, (index) => GlobalKey());
  final model = HomePageModel();

  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;

  bool _isVisible = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (scrollController.offset >= 200 && !_isVisible) {
      _isVisible = true;
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return ChangeNotifierProvider(
      create: (BuildContext context) => model,
      child: LayoutBuilder(
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
                  Container(
                    key: navbarKeys[1],
                    width: screenWidth,
                    padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                    color: AppColors.darkBackground,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "What I can do",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColors.darkText,
                          ),
                        ),
                        const SizedBox(height: 50),
                        if (constraints.maxWidth >=
                            PageSizeConst.mobileBreakpoint)
                          const DesktopSkills()
                        else
                          const MobileSkills(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  ProjectSession(
                    key: navbarKeys[2],
                  ),
                  const SizedBox(height: 30),
                  SlideTransition(
                    position: _slideAnimation,
                    child: FadeTransition(
                      opacity: _opacityAnimation,
                      child: FormWidget(
                        key: navbarKeys[3],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
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
