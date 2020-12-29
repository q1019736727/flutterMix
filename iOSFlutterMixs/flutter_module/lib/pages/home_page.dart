
import 'package:flutter/material.dart';
import '../common/global.dart';
import 'package:dio/dio.dart';
import '../requestTool/requestTool.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    will
    return Container(
      child: new Scaffold(
        appBar: AppBar(
          backgroundColor: Global.instance.MainColor(),
          title: Text('首页'),
        ),
      ),
    );
  }
  void httpGET() async{
    try{
      Response response;
      response = await new Dio().get('http://www.baidu.com');
      print(response);
    }catch(error){
      print(error);
    }
  } 
}