import 'package:flutter/material.dart';
import 'package:new_app/core/errors/app_failure_ext.dart';
import 'package:new_app/core/utils/toast_utils.dart';
import 'package:new_app/data/datasources/local/token_storage.dart';
import 'package:new_app/core/errors/app_failure.dart';
import 'package:new_app/app/router/app_router.dart';
import 'package:new_app/app/router/route_names.dart';

/// Central error handling — call from Bloc / Screen / Listener.
///
/// Uses [appNavigatorKey] when [context] is omitted so Blocs
/// do not need a BuildContext.
void showAppFailure(AppFailure failure, [BuildContext? context]) {
  final ctx = context ?? appNavigatorKey.currentContext;
  if (ctx == null) return;
  _handle(failure, ctx);
}

void appFailureHandling(AppFailure failure, BuildContext context) {
  _handle(failure, context);
}

void _handle(AppFailure failure, BuildContext context) {
  ToastUtils.showToast(context, message: failure.userMessage);

  failure.maybeWhen(
    unauthorized: () {
      TokenStorage().clear();
      appNavigatorKey.currentState?.pushNamedAndRemoveUntil(
        RouteName.splash,
        (_) => false,
        arguments: true,
      );
    },
    orElse: () {},
  );
}
