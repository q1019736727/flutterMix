
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/common/global.dart';
import '../service/requestTool.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/models.dart';
import '../config/refreshConfig.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin{
  //保持页面状态AutomaticKeepAliveClientMixin
  @override
  bool get wantKeepAlive => true;
      
  var _currentPage = 1;
  EasyRefreshController _controller;

  @override
  void initState() {
            print(3333);
    super.initState();
    _controller = EasyRefreshController();
        print(2222);
    // _fetchData();
  }
 
  void _fetchData() async{
    print(11111);
    homeData().then((value) => {
        print(value)
    });
  }

  @override
  Widget build(BuildContext context) {
    // getTicketList(_currentPage).then((value) => {
    //   print(value),
    // });
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('首页'),
          elevation: 0,
        ),
        // body: FutureBuilder(
        //   future: homeData(),
        //   builder: (BuildContext context, AsyncSnapshot snapshot) {
        //     if (snapshot.hasData){
        //       List<Map> swiperList = (snapshot.data[0] != null) ? (snapshot.data[0]['data']['records'] as List).cast():[];
        //       List<Map> menuList = (snapshot.data[1] != null) ? (snapshot.data[1]['data'] as List).cast():[];
        //       List<Map> flooerList = (snapshot.data[2] != null) ? (snapshot.data[2]['data']['records'] as List).cast():[];
        //       List<Map> hotList = (snapshot.data[3] != null) ? (snapshot.data[3]['data']['articleList'] as List).cast():[];
        //       return ListView(
        //         children: [
        //           SwiperCustom(swiperList:swiperList),
        //           NavigationMenu(menuList:menuList),
        //           FloorTitle(titleStr: '热卖专区',),
        //           HotContent(itemList: hotList,),
        //           FloorTitle(titleStr: '畅销专区',),
        //           FloorContent(contentList: flooerList,),
        //           FloorTitle(titleStr: '热门推荐',),
        //           RecommadView(),
        //         ],
        //       );
        //     }else{
        //       return Center(child: Text('banner失效'),);
        //     }
        //   },
        // ),
        body: Center(child:Text('你好')),
        // body: EasyRefresh(
        //   controller: _controller,
        //   firstRefresh: true,
        //   header: refreshHeader(),
        //   footer: refreshFooter(),
        //   onRefresh: (){
        //     print('加载数据');
        //   },
        //   onLoad: (){
        //     print('加载更多');
        //   },
        //   child: ListView.builder(itemBuilder: (BuildContext context,int index){
        //     return Text('data');
        //   },),
        // )
        // body: FutureBuilder(builder: (BuildContext context, AsyncSnapshot snapshot){
        //   if (snapshot.hasData){
        //     List<Map> swiperList = (snapshot.data[0] != null) ? (snapshot.data[0]['data']['records'] as List).cast():[];
        //     List<Map> menuList = (snapshot.data[1] != null) ? (snapshot.data[1]['data'] as List).cast():[];
        //     List<Map> flooerList = (snapshot.data[2] != null) ? (snapshot.data[2]['data']['records'] as List).cast():[];
        //     List<Map> hotList = (snapshot.data[3] != null) ? (snapshot.data[3]['data']['articleList'] as List).cast():[];
        //     return EasyRefresh(
        //       controller: _controller,
        //       firstRefresh: true,
        //       header: refreshHeader(),
        //       footer: refreshFooter(),
        //       child: ListView(
        //         children: [
        //           SwiperCustom(swiperList:swiperList),
        //           NavigationMenu(menuList:menuList),
        //           FloorTitle(titleStr: '热卖专区',),
        //           HotContent(itemList: hotList,),
        //           FloorTitle(titleStr: '畅销专区',),
        //           FloorContent(contentList: flooerList,),
        //           FloorTitle(titleStr: '热门推荐',),
        //           RecommadView(),
        //         ],
        //       ),
        //       onRefresh: () async{
        //         print('刷新');
        //       },
        //       onLoad: () async{
        //         print('加载更多');
        //       },
        //       );
        //   }else{
        //     return Center(child: Text('暂无数据'),);
        //   }
        // },
        // future: homeData(),
        // ),
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
      height: 160.h,
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

//标题
class FloorTitle extends StatelessWidget {
  String titleStr;
  FloorTitle({Key key,this.titleStr}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 0.5,color: Colors.black12))
      ),
      child: Text(titleStr,style: TextStyle(color: Colors.red,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
    );
  }
}

//热卖专区
class HotContent extends StatelessWidget {
  List itemList;
  HotContent({Key key,this.itemList}):super(key: key);
  @override
  Widget build(BuildContext context) {
    final List items = [];
    for (var itemObj in itemList){
      itemObj = hotRecommadModel.fromJson(itemObj);
      items.add(itemObj);
    }
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context,index){
            return _item(context,items[index]);
        }
      )
    );
  }

  Widget _item(BuildContext context,hotRecommadModel model) {
    if (model.title == null){
      return SizedBox(width: 0,height: 0,);
    }
    return Container(
      width: 130,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 0.5,color: Colors.black12),right: BorderSide(width: 0.5,color: Colors.black12))
      ),
      child: InkWell(
        onTap: (){
          print('点击热卖');
        },
        child: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.only(top:10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                image: DecorationImage(
                          image: NetworkImage(model.cover),
                          fit: BoxFit.cover
                        )
              ),
              // child: Image.network(model.cover,fit: BoxFit.cover,)
            ),
            SizedBox(height:10),
            Container(
              width: 100,
              alignment: Alignment.center,
              child: Text(model.title != null ? model.title:' ',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.grey[500]),
                maxLines: 1,)
            ),
          ]
        )
      )
    );
  }
}

//畅销专区
class FloorContent extends StatelessWidget {
  List contentList;
  FloorContent({Key key,this.contentList}):super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<flooerModel> items = [];
    for (var itemObj in contentList){
      itemObj = flooerModel.fromJson(itemObj);
      items.add(itemObj);
    }
    return Container(
      child: Column(
        children: [
          _topItem(items),
          _bottomItem(items)
        ],
      ),
    );
  }

  Widget _topItem(List<flooerModel> datas) {
    return Container(
      height:130,
      child: Row(
        children: [
            _goodsItem(datas[0]),
            _goodsItem(datas[1]),
        ],
      )
    );
  }

  Widget _bottomItem(List datas) {
    return Container(
      height: 130,
      child: Row(children: [_goodsItem(datas[2]),_goodsItem(datas[3])],)
    );
  }

  Widget _goodsItem(flooerModel model) {
    return Container(
      width: 187.5.w,
      child: InkWell(
        onTap: (){
          print('畅销点击');
        },
        child: Image.network(model.picture,fit: BoxFit.cover,),
      )
    );
  }
}

//推荐模块
class RecommadView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
        ],
      ),
    );
  }


}