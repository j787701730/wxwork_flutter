import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wxwork_flutter/error.dart';
import 'package:wxwork_flutter/home.dart';
import 'package:wxwork_flutter/menu.dart';
import 'package:wxwork_flutter/style.dart';
import 'package:wxwork_flutter/workbench.dart';

import 'localizations.dart';

void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Colors.transparent,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'wxwork_flutter',
      theme: ThemeData(
        primaryColor: Color(0xff4378BE),
        primaryTextTheme: TextTheme(
          title: TextStyle(
            color: Colors.white,
            fontSize: CFFontSize.topTitle,
          ),
        ),
        platform: TargetPlatform.iOS,
        scaffoldBackgroundColor: Colors.white,
        splashColor: Colors.white,
        backgroundColor: Colors.white,
        textTheme: TextTheme(
          subhead: TextStyle(
            textBaseline: TextBaseline.alphabetic,
          ),
          body1: TextStyle(
            color: Colors.black,
          ),
        ),
        primaryColorBrightness: Brightness.dark,
      ),
      home: MyHomePage(title: ''),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        // 自己要补个文件 localizations.dart
        ChineseCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', 'US'),
        Locale('zh', 'CH'),
      ],
      routes: <String, WidgetBuilder>{
        '/home': (_) => MyHomePage(),
        '/workbench': (_) => Workbench(),
      },
      onUnknownRoute: (RouteSettings settings) => MaterialPageRoute<void>(
        settings: settings,
        builder: (BuildContext context) => ErrorPage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List list = [
    Home(),
    Menu(),
    Workbench(),
    Home(),
    Home(),
  ];
  int _tabIndex = 0;
  DateTime _lastPressedAt; // 上次点击时间

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 667);

    return WillPopScope(
      onWillPop: () async {
        Fluttertoast.showToast(
          msg: '再按一次退出app',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
        if (_lastPressedAt == null || DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
          // 两次点击间隔超过1秒则重新计时
          _lastPressedAt = DateTime.now();
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: list[_tabIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 0,
          unselectedFontSize: 0,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Container(
                width: double.infinity,
                height: 56,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/${_tabIndex == 0 ? 'c7k' : 'c7j'}.png',
                      height: 32,
                    ),
                    Text(
                      '消息',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(12),
                        color: _tabIndex == 0 ? Color(0xff4378BE) : Color(0xff555659),
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: double.infinity,
                height: 56,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/${_tabIndex == 1 ? 'c7g' : 'c7f'}.png',
                      height: 32,
                    ),
                    Text(
                      '通讯录',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(12),
                        color: _tabIndex == 1 ? Color(0xff4378BE) : Color(0xff555659),
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: double.infinity,
                height: 56,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/${_tabIndex == 2 ? 'c7e' : 'c7d'}.png',
                      height: 32,
                    ),
                    Text(
                      '工作台',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(12),
                        color: _tabIndex == 2 ? Color(0xff4378BE) : Color(0xff555659),
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: double.infinity,
                height: 56,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/${_tabIndex == 3 ? 'c7i' : 'c7h'}.png',
                      height: 32,
                    ),
                    Text(
                      '我',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(12),
                        color: _tabIndex == 3 ? Color(0xff4378BE) : Color(0xff555659),
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
              title: Text(''),
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _tabIndex,
          onTap: (val) {
            setState(() {
              _tabIndex = val;
            });
          },
        ),
      ),
    );
  }
}
