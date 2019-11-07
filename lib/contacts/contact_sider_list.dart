import 'package:flutter/material.dart';
import './contact_vo.dart';
import './contact_header.dart';

// 好友列表具体实现
class ContactSiderList extends StatefulWidget {
  //添加列表数据集构造器
  final List<ContactVo> listData;
  // 好友列表头构造器
  final IndexedWidgetBuilder headerBuilder;
  // 好友类别项构造器
  final IndexedWidgetBuilder itemBuilder;
  //字母构造器
  final IndexedWidgetBuilder sectionBuilder;

  ContactSiderList(
      {Key key,
      @required this.listData,
      this.headerBuilder,
      @required this.itemBuilder,
      @required this.sectionBuilder})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ContactSiderState();
  }
}

/**
 * 状态
 */
class _ContactSiderState extends State<ContactSiderList> {
  //列表滚动控制器
  final ScrollController controller = ScrollController();

  bool _onNotification(ScrollNotification notification) {
    return true;
  }

  //判断并显示头部视图或空容器
  _isShowHeaderView(index) {
    if (index == 0 && widget.headerBuilder != null) {
      return Offstage(
        offstage: false,
        child: widget.headerBuilder(context, index),
      );
    }
    return Container();
  }

  // 根据定位判断是否显示好友列表头
  bool _shouldShowHeader(int position) {

    if (position < 1) {
      return false;
    }
    if (position != 0 &&
        widget.listData[position].seationKey !=
            widget.listData[position-1].seationKey) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          //列表加载更多
          NotificationListener(
              onNotification: _onNotification,
              child: ListView.builder(
                  //滚动控制器
                  controller: controller,
                  //列表里面的内容不足一屏时，列表可以滑动
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: widget.listData.length,
                  itemBuilder: (BuildContext context, int index) {
                    //列表项容器
                    return Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                          children: <Widget>[
                            //显示列表头
                            _isShowHeaderView(index),
                            //用户Offstage组件控制是否显示英文字母
                            Offstage(
                              offstage: _shouldShowHeader(index),
                              child: widget.sectionBuilder(context,index),
                            ),
                            //显示列表项
                            Column(
                              children: <Widget>[
                                widget.itemBuilder(context,index)
                              ],
                            )
                          ],

                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
