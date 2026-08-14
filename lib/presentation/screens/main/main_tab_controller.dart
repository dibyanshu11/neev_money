import 'package:flutter/foundation.dart';

/// Shared tab index so Home quick actions can jump between main tabs.
class MainTabController {
  MainTabController._();
  static final MainTabController instance = MainTabController._();

  final ValueNotifier<int> index = ValueNotifier<int>(0);

  void goHome() => index.value = 0;
  void goExplore() => index.value = 1;
  void goPortfolio() => index.value = 2;
  void goAccount() => index.value = 3;
}
