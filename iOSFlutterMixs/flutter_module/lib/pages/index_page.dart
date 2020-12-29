import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_module/pages/cate_page.dart';
import 'home_page.dart';
import 'cart_page.dart';
import 'member_page.dart';
import '../common/global.dart';

class ShopMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _indexPages();
  }
}

class _indexPages extends State<ShopMain> {
  final List<BottomNavigationBarItem> bottomBars = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: '首页'),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.search), label: '分类'),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.cart), label: '购物车'),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.memories), label: '我的'),
  ];
  final pages = [HomePage(), CateGoryPage(), CartPage(), MemeberPage()];
  int currentIndex = 0;
  var currentPage;
  @override
  void initState() {
    currentPage = pages[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Global.instance.MainColor(),
        selectedFontSize: 12.0,
        currentIndex: currentIndex,
        items: bottomBars,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            currentPage = pages[currentIndex];
          });
        },
      ),
      body: currentPage,
    );
  }
}
