import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wxwork_flutter/style.dart';
import 'package:wxwork_flutter/workbench/attendance.dart';

class Workbench extends StatefulWidget {
  @override
  _WorkbenchState createState() => _WorkbenchState();
}

class _WorkbenchState extends State<Workbench> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 667);
    return Scaffold(
      appBar: AppBar(
        title: Text('工作台'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Attendance();
                  },
                ),
              );
            },
            child: Container(
              child: Row(
                children: <Widget>[
                  Container(
                    width: ScreenUtil().setWidth(48),
                    height: ScreenUtil().setWidth(48),
                    child: Center(
                      child: Container(
                        child: Image.asset(
                          'assets/c7j.png',
                          width: ScreenUtil().setWidth(26),
                          height: ScreenUtil().setWidth(26),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: ScreenUtil().setWidth(48),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xffE5E5E5),
                          ),
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              child: Text(
                                '考勤打卡',
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(CFFontSize.title),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Icon(
                              Icons.keyboard_arrow_right,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
