import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List banner = ['menu_banner1.webp', 'menu_banner2.webp'];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 667);
    MediaQueryData media = MediaQuery.of(context);
    double width = media.size.width - media.padding.left - media.padding.right;
    return Scaffold(
      appBar: AppBar(
        title: Text('通讯录'),
      ),
      body: ListView(
        children: <Widget>[],
      ),
    );
  }
}
