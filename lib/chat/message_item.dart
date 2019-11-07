import 'package:flutter/material.dart';
import 'package:imchat/chat/message_data.dart';
import 'package:date_format/date_format.dart';
import 'package:imchat/common/touch_callback.dart';

/**
 * 聊天信息列表项
 * */
class MessageItem extends StatelessWidget {
  final MessageData data;

  MessageItem({Key key, @required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(width: 0.5, color: Color(0xFFd9d9d9)))),
        height: 64.0,
        child: TouchCallBack(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
             Container(
               margin: const EdgeInsets.only(left: 13.0,right: 13.0),
               child:  Image.network(
                   data.avatar,
                   fit: BoxFit.cover,width: 48.0,height: 48.0,),
             ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[
                    Text(
                      data.title,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.black),
                      maxLines: 1,
                    ),
                    Padding(padding: const EdgeInsets.only(top: 8.0)),

                    Text(
                      data.subTitle,
                      style: TextStyle(fontSize: 15.0, color: Colors.grey),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
             Container(
               alignment: AlignmentDirectional.topStart,
               margin: const EdgeInsets.only(right: 12.0,top: 12.0),
               child:  Text(
                 formatDate(data.time, ['HH', ':', 'nn', ':', 'ss']).toString(),
                 style: TextStyle(fontSize: 14.0, color: Colors.grey),
               ),
             )
            ],
          ),
        ),
    );
  }
}
