import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('页面找不到了'),
      ),
      body: Center(
        child: Text(
          '页面找不到了',
        ),
      ),
    );
  }
}
