/*
 * @Author: cy
 * @Date: 2021-01-08 11:12:02
 * @LastEditTime: 2021-01-08 14:58:45
 * @FilePath: /flutter_module/lib/routers/routes.dart
 */
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_module/routers/router_handler.dart';
import 'application.dart';


class Routes {
  static FluroRouter route;

  static String root = '/';
  static String goodsDetail = goodsDetailPath;
  static void configureRoutes(FluroRouter router) {
    route = router;
    router.notFoundHandler = Handler(
      handlerFunc: (ctx, Map<String, List<String>> params) {
        print('ROUTE WAS NOT FOUND !!!');
      },
    );
    router.define(root, handler: rootHandler, transitionType: TransitionType.native);
    router.define(goodsDetail, handler: goodsDetailRouteHandler, transitionType: TransitionType.native);
  }
  
  // 对参数进行encode，解决参数中有特殊字符，影响fluro路由匹配
  // static Future navigateTo(BuildContext context, String path, {Map<String, dynamic> params, TransitionType transition = TransitionType.native}) {
  //   String query =  "";
  //   if (params != null) {
  //     int index = 0;
  //     for (var key in params.keys) {
  //       var value = Uri.encodeComponent((params[key]).toString());
  //       if (index == 0) {
  //         query = "?";
  //       } else {
  //         query = query + "\&";
  //       }
  //       query += "$key=$value";
  //       index++;
  //     }
  //   }
  //   print('传递的参数：$query');
  //   path = path + query;
  //   return route.navigateTo(context, path, transition:transition);
  // }

}
