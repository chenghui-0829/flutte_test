import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class TestPage2 extends StatefulWidget {
  @override
  _TestPage2State createState() => _TestPage2State();
}

class _TestPage2State extends State<TestPage2> {
  _showTimePicker() {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(1950, 1, 1),
      maxTime: DateTime(2010, 1, 0),
      onChanged: (date) {
        print('change $date');
      },
      onConfirm: (date) {
        print('confirm $date');
      },
      currentTime: DateTime(1993, 08, 29),
      locale: LocaleType.zh,
      theme: DatePickerTheme(
          itemStyle: TextStyle(color: Colors.black, fontSize: 18),
          cancelStyle: TextStyle(color: Color(0xffBEBDB1), fontSize: 18),
          doneStyle: TextStyle(color: Color(0xff6A6852), fontSize: 18)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('時間選擇'),
      ),
      body: Container(
        child: FlatButton(
          onPressed: () {
            _showTimePicker();
          },
          child: Text("时间选择测试"),
        ),
      ),
    );
  }
}
