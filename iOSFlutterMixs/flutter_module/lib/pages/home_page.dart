
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../service/requestTool.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/models.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
      homeData();
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('首页'),
          elevation: 0,
        ),
        body: FutureBuilder(
          future: homeData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData){
              List<Map> swiperList = (snapshot.data[0] != null) ? (snapshot.data[0]['data']['records'] as List).cast():[];
              List<Map> menuList = (snapshot.data[1] != null) ? (snapshot.data[1]['data'] as List).cast():[];
              return ListView(
                children: [
                  SwiperCustom(swiperList:swiperList),
                  NavigationMenu(menuList:menuList),
                ],
              );
            }else{
              return Center(child: Text('banner失效'),);
            }
          },
        ),
      ),
    );
  }
}

//轮播图
class SwiperCustom extends StatelessWidget{
  final List swiperList;
  SwiperCustom({Key key,this.swiperList}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      child: Swiper(
        itemBuilder: (context,index){
          return Image.network(swiperList[index]['picture'],fit: BoxFit.fitWidth,);
        },
        itemCount: swiperList.length,
        pagination: SwiperPagination(),
        autoplay: true,
        onTap: (index){
          print(index);
        },
      ),
    );
  }
}

//导航模块
class NavigationMenu extends StatelessWidget {
  final List menuList;
  NavigationMenu({Key key,this.menuList}):super(key: key);
  @override
  Widget build(BuildContext context) {
    final jsons1 = menuList[0]['navigations'] as List;
    final jsons2 = menuList[1]['navigations'] as List;
    final items = List<Widget>();
    for (var item in jsons1){
      items.add(_menuItem(context,menuItemModel.fromJson(item)));
    }
     for (var item in jsons2){
      items.add(_menuItem(context,menuItemModel.fromJson(item)));
    }
    return Container(
      height: 200.h,
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
        crossAxisCount: 4,
        children: items,
      )
    );
  }

  Widget _menuItem(BuildContext context,menuItemModel model){
    return InkWell(
      onTap: (){
        print(111);
      },
      child: Column(
          children:[
            Image.network(model.icon,width: 50.w,height: 50.h,),
            Text(model.name)
          ],
        )
      );
  }
}