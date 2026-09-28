import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_app/app/router/app_router.dart';
import 'package:new_app/app/router/app_theme.dart';
import 'package:new_app/app/router/route_names.dart';
import 'package:new_app/core/constants/app_colors.dart';
import 'package:new_app/core/constants/text_styles.dart';

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
        return CupertinoTheme(
          data: AppTheme.cupertino,
          child: DefaultTextStyle(
            style: TextStyles.subtitle.copyWith(color: AppColors.textPrimary),
            child: GestureDetector(
              onTap: () {
                final focus = FocusManager.instance.primaryFocus;
                if (focus != null && focus.hasFocus) {
                  focus.unfocus();
                }
              },
              behavior: HitTestBehavior.translucent,
              child: child,
            ),
          ),
        );
      },
    );
  }
}
