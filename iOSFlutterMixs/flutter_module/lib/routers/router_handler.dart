/*
 * @Author: cy
 * @Date: 2021-01-08 11:10:01
 * @LastEditTime: 2021-01-08 13:42:54
 * @FilePath: /flutter_module/lib/routers/router_handler.dart
 */
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../pages/index_page.dart';
import '../pages/detail/goods_detail.dart';


var rootHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return ShopMain();
  },
);

var goodsDetailRouteHandler = Handler(
  handlerFunc: (ctx, Map<String, List<String>> params) {
    return GoodsDetail();
  },
);
