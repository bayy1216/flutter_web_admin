import 'package:flutter/material.dart';

import '../../../core/const/color.dart';

/// web에서 divider가 안보이는 문제 발생하여
/// divider를 커스텀하여 사용
class CustomDivider extends StatelessWidget {
  final double height;
  final Color color;
  final bool vertical;

  const CustomDivider({
    super.key,
    this.height = 0.4,
    this.color = ColorConst.dividerGrey,
    this.vertical = false,
  });

  @override
  Widget build(BuildContext context) {
    if(vertical){
      return Container(
        height: double.infinity,
        width: height,
        color: color,
      );
    }
    return Container(
      height: height,
      width: double.infinity,
      color: color,
    );
  }
}
