import 'package:flutter/material.dart';

class TestPage1 extends StatefulWidget {
  @override
  _TestPage1State createState() => _TestPage1State();
}

class _TestPage1State extends State<TestPage1> {
  double _top = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned(
            child: Container(
              color: Colors.yellow,
              child: Text('這裡是歷層頁面'),
            ),
          ),
          Positioned(
            top: _top,
            child: Container(
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    child: Container(
                      color: Colors.red,
                      height: 40,
                      width: 100,
                    ),
                    onPanUpdate: (DragUpdateDetails e) {
                      setState(() {
                        _top += e.delta.dy;
                      });
                    },
                  ),
                  Container(
                    child: Text('這裡是外面頁面'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
