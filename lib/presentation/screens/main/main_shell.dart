import 'package:flutter/material.dart';
import 'package:new_app/core/constant/app_colors.dart';
import 'package:new_app/presentation/screens/account/account_screen.dart';
import 'package:new_app/presentation/screens/explore/explore_screen.dart';
import 'package:new_app/presentation/screens/home/home_screen.dart';
import 'package:new_app/presentation/screens/main/main_tab_controller.dart';
import 'package:new_app/presentation/screens/portfolio/portfolio_screen.dart';
import 'package:new_app/presentation/widgets/custom_bottom_nav.dart';
import 'package:new_app/presentation/widgets/whatsapp_fab.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  late int _currentIndex;

  static const _navAnim = Duration(milliseconds: 220);
  static const _navCurve = Curves.easeOutCubic;

  final _screens = const [
    HomeScreen(),
    ExploreScreen(),
    PortfolioScreen(),
    AccountScreen(),
  ];

  /// Matches each tab’s page canvas behind the floating nav.
  static const _tabBackgrounds = <Color>[
    Color(0xFFF7F9F8), // Home
    Color(0xFFF7F9F8), // Explore
    AppColors.background, // Portfolio
    Color(0xFFF5F5F5), // Account
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = MainTabController.instance.index.value;
    MainTabController.instance.index.addListener(_onTabChanged);
  }

  void _onTabChanged() {
    final next = MainTabController.instance.index.value;
    if (next != _currentIndex && mounted) {
      setState(() => _currentIndex = next);
    }
  }

  @override
  void dispose() {
    MainTabController.instance.index.removeListener(_onTabChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final showNav = MediaQuery.viewInsetsOf(context).bottom <= 0;
    final navHeight = CustomBottomNav.occupiedHeight(context);
    final fabLift = navHeight + 16;
    final bg =
        _tabBackgrounds[_currentIndex.clamp(0, _tabBackgrounds.length - 1)];

    return Scaffold(
      backgroundColor: bg,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Positioned.fill(child: ColoredBox(color: bg)),

          // Reserve nav space only when nav is visible — animated to avoid jump.
          AnimatedPositioned(
            duration: _navAnim,
            curve: _navCurve,
            left: 0,
            right: 0,
            top: 0,
            bottom: showNav ? navHeight : 0,
            child: IndexedStack(
              index: _currentIndex,
              children: _screens,
            ),
          ),

          // Keep nav in the tree; fade + slide instead of mount/unmount blink.
          Positioned(
            right: 18,
            bottom: fabLift,
            child: IgnorePointer(
              ignoring: !showNav,
              child: AnimatedOpacity(
                duration: _navAnim,
                curve: _navCurve,
                opacity: showNav ? 1 : 0,
                child: AnimatedSlide(
                  duration: _navAnim,
                  curve: _navCurve,
                  offset: showNav ? Offset.zero : const Offset(0, 0.35),
                  child: const WhatsAppFab(),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: IgnorePointer(
              ignoring: !showNav,
              child: AnimatedOpacity(
                duration: _navAnim,
                curve: _navCurve,
                opacity: showNav ? 1 : 0,
                child: AnimatedSlide(
                  duration: _navAnim,
                  curve: _navCurve,
                  offset: showNav ? Offset.zero : const Offset(0, 1),
                  child: CustomBottomNav(
                    currentIndex: _currentIndex,
                    onTap: (index) {
                      MainTabController.instance.index.value = index;
                      setState(() => _currentIndex = index);
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
