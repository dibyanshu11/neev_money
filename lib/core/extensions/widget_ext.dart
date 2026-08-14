import 'package:flutter/material.dart';

extension WidgetExt on Widget {
  Widget get center => Center(child: this);

  Widget paddingAll(double value) => Padding(
        padding: EdgeInsets.all(value),
        child: this,
      );

  Widget paddingSymmetric({double horizontal = 0, double vertical = 0}) =>
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontal,
          vertical: vertical,
        ),
        child: this,
      );
}

extension SizedBoxExt on num {
  SizedBox get heightBox => SizedBox(height: toDouble());
  SizedBox get widthBox => SizedBox(width: toDouble());
}

extension ContextExt on BuildContext {
  double get deviceWidth => MediaQuery.sizeOf(this).width;
  double get deviceHeight => MediaQuery.sizeOf(this).height;
}
