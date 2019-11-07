import 'package:flutter/material.dart';
import 'package:imchat/loading.dart';
import 'package:imchat/app.dart';
import "package:flutter_webview_plugin/flutter_webview_plugin.dart";
import 'package:imchat/search.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IM chat home',
      routes: <String, WidgetBuilder>{
        "app": (BuildContext context) => App(),
        "/friends": (_) => WebviewScaffold(
              url: "https://www.baidu.com",
              appBar: AppBar(
                title: Text("我的好友"),
              ),
              withZoom: true,
              withLocalStorage: true,
            ),
        "search" : (BuildContext context) => SearchPage()
      },
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Color(0xFFebebeb),
        cardColor: Colors.green
      ),
      home: LoadingPage(),
    );
  }
}
