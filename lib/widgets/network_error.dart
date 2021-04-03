import 'package:flutter/material.dart' hide Router;
import 'package:mall/constant/string.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NetWorkErrorView extends StatelessWidget {
  VoidCallback callback;

  NetWorkErrorView(this.callback);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        alignment: Alignment.center,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "images/network_error.png",
                height: ScreenUtil().setWidth(120.0),
                width: ScreenUtil().setWidth(120.0),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: ScreenUtil().setHeight(20.0)),
              ),
              Text(
                Strings.NO_DATA_TEXT,
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(28.0),
                    color: Colors.deepOrangeAccent),
              )
            ],
          ),
        ),
      ),
    );
  }
}
