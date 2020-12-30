
import 'package:flutter/material.dart';
import '../service/requestTool.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // getHomeBanner();
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('首页'),
          elevation: 0,
        ),
        body: FutureBuilder(
          future: getHomeBanner(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData){
              List<Map> swiperList = (snapshot.data['data']['records'] as List).cast();
              return ListView(
                children: [
                  SwiperCustom(swiperList:swiperList),
                ],
              );
            }else{
              return Center(child: Text('没数据'),);
            }
          },
        ),
      ),
    );
  }
}

class SwiperCustom extends StatelessWidget{
  final List swiperList;
  SwiperCustom({Key key,this.swiperList}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
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

