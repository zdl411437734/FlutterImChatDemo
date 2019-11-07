import 'package:flutter/material.dart';
import 'package:imchat/chat/message_data.dart';
import 'package:imchat/chat/message_item.dart';

/**
 * 聊天信息列表界面
 */
class MessagePage extends StatefulWidget{
  List<MessageData> messageData = <MessageData>[
    MessageData("http://tx.haiqq.com/uploads/allimg/c170727/150111a15U640-111T.jpg", "张数", "天才少年", DateTime.now(), MessageType.CHAT),
    MessageData("http://tx.haiqq.com/uploads/allimg/c170727/150111a159CP-2J24.jpg", "刘备", "蜀汉的建立者", DateTime(2019,10,30,22,55,20), MessageType.PUBLIC),
    MessageData("http://tx.haiqq.com/uploads/allimg/c170727/150111a15b30-331Z.jpg", "伯邑考", "商朝时代人物", DateTime.now(), MessageType.GROUP),
    MessageData("http://tx.haiqq.com/uploads/allimg/c170727/150111a1640320-112R7.jpg", "毛泽东", "中华人民共和国的建立者，人民领袖,中华人民共和国的建立者，人民领袖,中华人民共和国的建立者，人民领袖", DateTime.now(), MessageType.SYSTEM)];

  @override
  State<StatefulWidget> createState() {
    return _MessagePageState();
  }
}

/**
 * 状态管理
 */
class _MessagePageState extends State<MessagePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemCount: widget.messageData.length,itemBuilder: (BuildContext context,int index){return MessageItem(data: widget.messageData[index]);}),
    );
  }
}