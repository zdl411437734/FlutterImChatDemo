import 'package:flutter/material.dart';
import 'dart:async';


/**
 * 加载界面
 */
class LoadingPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoadingState();
  }

}


class _LoadingState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      print("Flutter即时通讯APP界面实现....");
      Navigator.of(context).pushReplacementNamed("app");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          Image.asset("images/loading.jpg",fit: BoxFit.cover,)
        ],
      ),
    );
  }
}
