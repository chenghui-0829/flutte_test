import 'package:flutte_test/app_strings.dart';
import 'package:flutte_test/locale_util.dart';
import 'package:flutte_test/translations.dart';
import 'package:flutter/material.dart';

import 'application.dart';

class TestPage7 extends StatefulWidget {
  @override
  _TestPage7State createState() => _TestPage7State();
}

class _TestPage7State extends State<TestPage7> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print("-----" + LocaleUtil().getLanguageCode());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(AppStrings.of(context).title()),
            FlatButton(
                onPressed: () {
                  applic.onLocaleChanged(new Locale('en', ''));
//                  AppStrings.load(Locale('en')).then((v) {
//                    setState(() {
//                      print(v.title());
//                    });
//                  });
                },
                child: Text('切换成英文')),
            FlatButton(
                onPressed: () {
                  applic.onLocaleChanged(new Locale('zh', ''));
//                  AppStrings.load(Locale('en')).then((v) {
//                    setState(() {
//                      print(v.title());
//                    });
//                  });
                },
                child: Text('切换成中文')),
            Text(Translations.of(context).text('test')),
          ],
        ),
      ),
    );
  }
}
