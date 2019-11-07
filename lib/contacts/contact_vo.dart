import 'package:flutter/material.dart';

class ContactVo{
  //字母排序值
  String seationKey;
  //名称
  String name;
  //头像url
  String avatarUrl;
  //构造函数
 ContactVo(@required this.seationKey,this.name,this.avatarUrl);
}

List<ContactVo> contactData = [
  ContactVo("A", "毛泽东", "http://tx.haiqq.com/uploads/allimg/c170727/150111a1635B0-aR2.jpg"),
  ContactVo("B", "阿里巴巴", "http://tx.haiqq.com/uploads/allimg/c170727/150111a1635B0-aR2.jpg"),
  ContactVo("C", "腾讯", "http://tx.haiqq.com/uploads/allimg/c170727/150111a1635B0-aR2.jpg"),
  ContactVo("D", "360", "http://tx.haiqq.com/uploads/allimg/c170727/150111a1635B0-aR2.jpg"),
  ContactVo("E", "小米", "http://tx.haiqq.com/uploads/allimg/c170727/150111a1635B0-aR2.jpg"),
  ContactVo("F", "华为", "http://tx.haiqq.com/uploads/allimg/c170727/150111a1635B0-aR2.jpg"),
  ContactVo("G", "VIVO", "http://tx.haiqq.com/uploads/allimg/c170727/150111a1635B0-aR2.jpg"),
];