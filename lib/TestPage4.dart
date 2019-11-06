import 'package:flutter/material.dart';

import 'chart.dart';

class Testpage4 extends StatefulWidget {
  @override
  _Testpage4State createState() => _Testpage4State();
}

class _Testpage4State extends State<Testpage4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: CustomPaint(
          painter: SpiderNetView(3),
        ),
      ),
    );
  }
}
