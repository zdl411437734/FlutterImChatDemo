import 'package:flutter/material.dart';
import 'package:imchat/chat/message_page.dart';
import 'package:imchat/contacts/contacts.dart';
import 'package:imchat/personal/personal.dart';

/**
 * App 主界面
 */
class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AppState();
  }
}

/**
 * App的状态控制
 */
class _AppState extends State<App> {
  //当前选中页面索引
  var _currentIndex = 0; //当前下标
  // 聊天页面
  MessagePage message;
  // 好友页面
  Contacts contacts;
  //我的页面
  Personal me;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("即时通讯"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {
            Navigator.pushNamed(context, "search");
          }),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              //弹出菜单
              showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(500.0, 76.0, 10.0, 0.0),
                  items: <PopupMenuEntry>[
                    _popupMenuItem("发起会话",
                        imagePath: 'images/icon_menu_group.png'),
                    _popupMenuItem("添加好友",
                        imagePath: "images/icon_menu_addfriend.png"),
                    _popupMenuItem("联系客服", icon: Icons.person)
                  ]);
            },
          )
        ],
      ),
      //底部导航按钮
      bottomNavigationBar: BottomNavigationBar(
          //通过fixedColor设置选中的颜色
          type: BottomNavigationBarType.fixed,
          //当前页索引
          currentIndex: _currentIndex,
          //按下设设置当前页面索引
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            //导航按钮项传入文本及图标
            BottomNavigationBarItem(
              title: Text("聊天",style: TextStyle(
                color: _currentIndex == 0? Color(0xFF46c01b):Color(0xff999999)
              ),),
                icon: _currentIndex == 0
                    ? Image.asset(
                        "images/message_pressed.png",
                        width: 32.0,
                        height: 32.0,
                      )
                    : Image.asset(
                        "images/message_normal.png",
                        width: 32.0,
                        height: 32.0,
                      )),
            BottomNavigationBarItem(
                title: Text("好友",style: TextStyle(
                    color: _currentIndex == 1? Color(0xFF46c01b):Color(0xff999999)
                ),),
                icon: _currentIndex == 1
                    ? Image.asset(
                  "images/contact_list_pressed.png",
                  width: 32.0,
                  height: 32.0,
                )
                    : Image.asset(
                  "images/contact_list_normal.png",
                  width: 32.0,
                  height: 32.0,
                )),
            BottomNavigationBarItem(
                title: Text("我的",style: TextStyle(
                    color: _currentIndex == 2? Color(0xFF46c01b):Color(0xff999999)
                ),),
                icon: _currentIndex == 2
                    ? Image.asset(
                  "images/profile_pressed.png",
                  width: 32.0,
                  height: 32.0,
                )
                    : Image.asset(
                  "images/profile_normal.png",
                  width: 32.0,
                  height: 32.0,
                ))
          ]),
      body: currentPage(),
    );
  }

  //切换底部界面
  currentPage() {
    switch (_currentIndex) {
      case 0:
        //返回聊天界面
        if (message == null) {
          message = MessagePage();
        }
        return message;
      case 1:
        //返回好友界面
        if (contacts == null) {
          contacts = Contacts();
        }
        return contacts;
      case 2:
        //返回我的页面
        if (me == null) {
          me = Personal();
        }
        return me;
      default:
    }
  }

  //渲染某个菜单项，传入菜单的标题，图片或者图标
  _popupMenuItem(String title, {String imagePath, IconData icon}) {
    return PopupMenuItem(
        child: Row(
      children: <Widget>[
        //判断是使用图片路径还是图标
        imagePath != null
            ? Image.asset(
                imagePath,
                width: 32.0,
                height: 32.0,
              )
            : SizedBox(
                width: 32.0,
                height: 32.0,
                child: Icon(icon),
              ),
        //显示菜单项文本内容
        Container(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    ));
  }
}
