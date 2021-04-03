import 'package:flutter/material.dart' hide Router;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DividerLineView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.grey[350],
      height: ScreenUtil().setHeight(1.0),
    );
  }
}
