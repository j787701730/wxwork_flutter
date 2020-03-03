import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List banner = ['banner1.webp', 'banner2.webp', 'banner3.webp'];
  List menu = [
    {'chName': '现在下单', 'enName': 'ORDER NOW', 'icon': 'icon_order_now_new.png'},
    {'chName': '咖啡钱包', 'enName': 'COFFRR WALLET', 'icon': 'icon_promo_new.png'},
    {'chName': '送Ta咖啡', 'enName': 'SEND COFFEE', 'icon': 'icon_send_coffee_new.png'},
    {'chName': '企业账户', 'enName': 'ENTERPRISE ACCOUNT', 'icon': 'icon_enterprise_new.png'},
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 667);
    MediaQueryData media = MediaQuery.of(context);
    double width = media.size.width - media.padding.left - media.padding.right;
    return Scaffold(
      appBar: AppBar(
        title: Text('消息'),
      ),
      body: ListView(
        children: <Widget>[],
      ),
    );
  }
}
