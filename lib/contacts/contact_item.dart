import 'package:flutter/material.dart';
import './contact_vo.dart';

//好友列表项
class ContactItem extends StatelessWidget {
  //好友数据VO
  final ContactVo item;
  //标题名称
  final String name;
  //图片路径
  final String imageName;
  //构造方法
  ContactItem({this.item, this.name, this.imageName});

  //渲染好友列表项目

  @override
  Widget build(BuildContext context) {
    // 列表项容器
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          //每条列表底部添加一个边框
          border:
              Border(bottom: BorderSide(width: 0.5, color: Color(0xFFd9d9d9)))),
      height: 52.0,
      child: FlatButton(onPressed: (){}, child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //展示头像或图片
          imageName == null ? Image.network(item.avatarUrl!=''?item.avatarUrl:'http://tx.haiqq.com/uploads/allimg/c170727/150111a15U640-111T.jpg',width: 36.0,height: 36.0,scale: 0.9,): Image.asset(imageName,width: 36.0,height: 36.0,),
          //展示名称或者标题
          Container(
            margin: const EdgeInsets.only(left: 12.0),
            child: Text(name == null?item.name??'暂时':name,style: TextStyle(fontSize: 18.0,color: Color(0xFF353535)),maxLines: 1,),
          )
        ],
      )),
    );
  }
}
