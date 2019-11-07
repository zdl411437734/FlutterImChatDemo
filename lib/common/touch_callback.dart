import 'package:flutter/material.dart';

//触摸回调组件
class TouchCallBack extends StatefulWidget{
  //子组件
  final Widget child;
  //回调函数
  final VoidCallback onPressed;
  final bool isfeed;
  //北京颜色
  final Color backgroud;
  //传入参数
  TouchCallBack({Key key,@required this.child,@required this.onPressed,this.isfeed:true,this.backgroud:const Color(0xffd8d8d8)}):super(key:key);
  @override
  State<StatefulWidget> createState() {
    return TouchState();
  }

}

class TouchState extends State<TouchCallBack>{
  Color color = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    //返回GestureDetector对象
    return GestureDetector(
      child: Container(
        color: color,
        child: widget.child,
      ),
      onTap: widget.onPressed,
      onPanDown: (d){
        if(widget.isfeed == false) return;
        setState(() {
          color = widget.backgroud;
        });
      },
      onPanCancel: (){
        setState(() {
          color = Colors.transparent;
        });
      },
      onTapUp: (detail){
        setState(() {
          color = Colors.transparent;
        });
      },
      onLongPressMoveUpdate: (detail){
        setState(() {
          color = Colors.transparent;
        });
      },
    );
  }
}