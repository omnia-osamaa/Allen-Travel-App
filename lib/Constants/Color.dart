import 'package:flutter/material.dart';

const Color appBar = Color(0xff290c38);
const Color primary = Color(0xff6a0f67);
const Color grey2 = Color(0xff333333);
const Color grey3 = Color(0xff999999);
const Color yellow2 = Color(0xfff1ff53);
const Color bg = Color(0xffF5F5F5);



extension AppContext on BuildContext {
  Size get size => MediaQuery.sizeOf(this);
  double get width => size.width;
  double get height => size.height;

  Future push(Widget widget) async {
    return Navigator.push(
        this, MaterialPageRoute(builder: (context) => widget));
  }
  void pop() async {
    return Navigator.pop(this);
  }
}
