import 'package:flutter/material.dart';
import 'package:new_app/router/app_theme.dart';
import 'package:new_app/router/route_manager.dart';
import 'package:new_app/router/route_name.dart';

void main() {
  runApp(const NeevMoneyApp());
}

class NeevMoneyApp extends StatelessWidget {
  const NeevMoneyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Neev',
      debugShowCheckedModeBanner: false,
      navigatorKey: appNavigatorKey,
      theme: AppTheme.light,
      initialRoute: RouteName.splash,
      onGenerateRoute: RouteManager().generate,
      builder: (context, child) {
        // Tap anywhere outside a field to dismiss the keyboard.
        return GestureDetector(
          onTap: () {
            final focus = FocusManager.instance.primaryFocus;
            if (focus != null && focus.hasFocus) {
              focus.unfocus();
            }
          },
          behavior: HitTestBehavior.translucent,
          child: child,
        );
      },
    );
  }
}
