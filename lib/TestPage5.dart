import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestPage5 extends StatefulWidget {
  @override
  _TestPage5State createState() => _TestPage5State();
}

class _TestPage5State extends State<TestPage5> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _builderItem(BuildContext context, int index) {
      return Container(
        color: Colors.red,
        height: 40,
        child: Text('1'),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('滑动选择测试'),
      ),
      body: Center(
          child: CupertinoPicker(
        itemExtent: 40,
        scrollController: FixedExtentScrollController(initialItem: 1),
        children: <Widget>[
          Text("0"),
          Text("1"),
          Text("2"),
          Text("3"),
          Text("4"),
        ],
      )),
    );
  }
}
