import 'package:flutte_test/TestPage7.dart';
import 'package:flutte_test/localizations_delegate.dart';
import 'package:flutte_test/testPage1.dart';
import 'package:flutte_test/testPage2.dart';
import 'package:flutte_test/translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'TestPage3.dart';
import 'TestPage4.dart';
import 'TestPage5.dart';
import 'TestPage6.dart';
import 'app_strings.dart';
import 'application.dart';
import 'test.dart';
import 'chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SpecificLocalizationDelegate _localeOverrideDelegate;

  @override
  void initState() {
    super.initState();
    _localeOverrideDelegate = new SpecificLocalizationDelegate(null);

    /// 保存这个方法的指针，当用户改变语言时，我们可以调用applic.onLocaleChanged(new Locale('en',''));，通过SetState()我们可以强制App整个刷新
    applic.onLocaleChanged = onLocaleChange;
  }

  onLocaleChange(Locale locale) {
    setState(() {
      _localeOverrideDelegate = new SpecificLocalizationDelegate(locale);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      localizationsDelegates: [
        _localeOverrideDelegate,
        TranslationsDelegate(),
        AppLocalizationsDelegate(), // 我们定义的代理
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        // 支持的语言类型
        const Locale('en', 'US'), // English
        const Locale('zh', 'CH'),
      ],
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('hello flutter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TestPage7()));
              },
              child: Text("多语言测试"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TestPage6()));
              },
              child: Text("groupListview"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TestPage5()));
              },
              child: Text("滑动选择测试"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TestPage1()));
              },
              child: Text("滑动页面测试"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TestPage2()));
              },
              child: Text("时间选择测试"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TestPage3()));
              },
              child: Text("string选择"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Testpage4()));
              },
              child: Text("雷达图"),
            ),
            Row(
              children: <Widget>[
//                Row(children: <Widget>[
                Text('A.'),
                Expanded(
                  child: Text(
                      '佛阿我房间额放到沙发垫沙发垫沙发垫所发生的开挂你可能人ll家嫩我那个那个让热基恩刚入fsdafdsfadsf发生的发生的'),
                )
              ],
            ),
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
