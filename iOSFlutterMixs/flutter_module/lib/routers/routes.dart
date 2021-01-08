/*
 * @Author: cy
 * @Date: 2021-01-08 11:12:02
 * @LastEditTime: 2021-01-08 13:43:03
 * @FilePath: /flutter_module/lib/routers/routes.dart
 */
import 'package:fluro/fluro.dart';
import 'package:flutter_module/routers/router_handler.dart';

class Routes {
  static String root = '/';
  static String goodsDetail = '/goodsdetail';
  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
      handlerFunc: (ctx, Map<String, List<String>> params) {
        print('ROUTE WAS NOT FOUND !!!');
      },
    );
    router.define(root, handler: rootHandler);
    router.define(goodsDetail, handler: goodsDetailRouteHandler);
  }
}
