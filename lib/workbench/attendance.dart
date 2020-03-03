import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wxwork_flutter/style.dart';

class Attendance extends StatefulWidget {
  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  String time = '';
  String date = '';
  String hour = '';
  DateTime inTime;
  DateTime outTime;
  Timer timer;
  Map weekday = {
    '1': '一',
    '2': '二',
    '3': '三',
    '4': '四',
    '5': '五',
    '6': '六',
    '7': '日',
  };

  @override
  void initState() {
    super.initState();
    timerFun();
  }

  timerFun() {
    const period = const Duration(seconds: 1);
    DateTime now = DateTime.now();
    setState(() {
      time = '${now.hour > 9 ? now.hour : '0${now.hour}'}:${now.minute > 9 ? now.minute : '0${now.minute}'}'
          ':${now.second > 9 ? now.second : '0${now.second}'}';
      date = '考勤日: ${now.year}-${now.month > 9 ? now.month : '0${now.month}'}'
          '-${now.day > 9 ? now.day : '0${now.day}'} 星期${weekday[now.weekday.toString()]}';
    });
    timer = Timer.periodic(period, (timer1) {
      now = DateTime.now();
      setState(() {
        time = '${now.hour > 9 ? now.hour : '0${now.hour}'}:${now.minute > 9 ? now.minute : '0${now.minute}'}'
            ':${now.second > 9 ? now.second : '0${now.second}'}';
        date = '考勤日: ${now.year}-${now.month > 9 ? now.month : '0${now.month}'}'
            '-${now.day > 9 ? now.day : '0${now.day}'} 星期${weekday[now.weekday.toString()]}';
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  getDatePoor(DateTime endDate, DateTime nowDate) {
    int nd = 1000 * 24 * 60 * 60;
    int nh = 1000 * 60 * 60;
    int nm = 1000 * 60;
    // long ns = 1000;
    // 获得两个时间的毫秒时间差异
    int diff = endDate.millisecondsSinceEpoch - nowDate.millisecondsSinceEpoch;
    // int day = diff ~/ nd;
    double hour = diff % nd / nh;
    double min = diff % nd % nh / nm;
    print(endDate);
    print(nowDate);
    Duration diff2 = endDate.difference(nowDate);
    print(diff2.inHours);
    print(diff2.inMinutes);
    // return "$day天${hour.toStringAsFixed(2)}小时$min分钟";
    return "${hour.toStringAsFixed(1)}";
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 667);
    return Scaffold(
      appBar: AppBar(
        title: Text('今日考勤'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              top: ScreenUtil().setHeight(35),
            ),
            child: Text(
              time,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(25),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              top: ScreenUtil().setHeight(20),
            ),
            child: Text(
              date,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(13),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '以工作',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(13),
                  ),
                ),
                Text(
                  inTime != null && outTime != null ? getDatePoor(outTime, inTime) : '0',
                  style: TextStyle(
                    color: CFColors.primary,
                  ),
                ),
                Text('小时'),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: ScreenUtil().setHeight(30),
            ),
            height: 1,
            color: Color(0xffe5e5e5),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(15),
              vertical: ScreenUtil().setHeight(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('常规考勤'),
                Row(
                  children: <Widget>[
                    Text('详情'),
                    Icon(Icons.keyboard_arrow_right),
                  ],
                )
              ],
            ),
          ),
          Container(
            height: ScreenUtil().setHeight(15),
            color: Color(0xffF8F8F8),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(15),
              vertical: ScreenUtil().setHeight(10),
            ),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                    right: ScreenUtil().setWidth(10),
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        '签到',
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(15),
                        ),
                      ),
                      Text(
                        '09:00',
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(12),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.edit_location,
                            size: ScreenUtil().setSp(18),
                          ),
                          Expanded(
                            child: Text(
                              '福建省福州市连江县蓼沿乡岐山村',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(13),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '备注',
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(13),
                          color: CFColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                inTime == null
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            inTime = DateTime.now();
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(
                            ScreenUtil().setWidth(6),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: CFColors.white,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                          ),
                          child: Text(
                            '签到',
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(16),
                            ),
                          ),
                        ),
                      )
                    : Container(
                        padding: EdgeInsets.all(
                          ScreenUtil().setWidth(6),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: CFColors.primary,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                        child: Text(
                          '${inTime.hour > 9 ? inTime.hour : '0${inTime.hour}'}:'
                          '${inTime.minute > 9 ? inTime.minute : '0${inTime.minute}'}',
                          style: TextStyle(
                            color: CFColors.primary,
                            fontSize: ScreenUtil().setSp(16),
                          ),
                        ),
                      ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(15),
              vertical: ScreenUtil().setHeight(10),
            ),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                    right: ScreenUtil().setWidth(10),
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        '签退',
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(15),
                        ),
                      ),
                      Text(
                        '17:30',
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(12),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.edit_location,
                            size: ScreenUtil().setSp(18),
                          ),
                          Expanded(
                            child: Text(
                              '福建省福州市连江县蓼沿乡岐山村',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(13),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '备注',
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(13),
                          color: CFColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                outTime == null
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            outTime = DateTime.now();
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(
                            ScreenUtil().setWidth(6),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: CFColors.white,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                          ),
                          child: Text(
                            '签退',
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(16),
                            ),
                          ),
                        ),
                      )
                    : Container(
                        padding: EdgeInsets.all(
                          ScreenUtil().setWidth(6),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: CFColors.primary,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                        child: Text(
                          '${outTime.hour > 9 ? outTime.hour : '0${outTime.hour}'}:'
                          '${outTime.minute > 9 ? outTime.minute : '0${outTime.minute}'}',
                          style: TextStyle(
                            color: CFColors.primary,
                            fontSize: ScreenUtil().setSp(16),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
