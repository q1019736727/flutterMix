/*
 * @Author: cy
 * @Date: 2021-01-08 11:41:07
 * @LastEditTime: 2021-01-08 15:35:55
 * @FilePath: /flutter_module/lib/routers/application.dart
 */

import 'package:fluro/fluro.dart';
import 'dart:convert';


const goodsDetailPath = '/goodsdetail';

//中文转码
String fluroCnParamsEncode(String originalCn) {
  return jsonEncode(Utf8Encoder().convert(originalCn));
}

//中文解码
String fluroCnParamsDecode(String encodeCn) {
  var list = List<int>();
  for(var data in jsonDecode(encodeCn)[0]){
    list.add(data);
  }
  return Utf8Decoder().convert(list);
}


class Application{
  static FluroRouter router;
}