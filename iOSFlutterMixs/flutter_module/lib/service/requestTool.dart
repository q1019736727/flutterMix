import 'package:dio/dio.dart';
import 'dart:async';
import '../config/api_list.dart';

enum requestType { GET, POST }

class RequestTool {
  static RequestTool instance = RequestTool();
  Future request(String url, requestType type, Object params) async {
    Response response;
    Dio dio = new Dio();
    switch (type) {
      case requestType.GET:
        try {
          response = await dio.get(url, queryParameters: params);
          // print(response.data);
          return response.data;
        } catch (e) {
          print(e);
        }
        break;
      case requestType.POST:
        try {
          // dio.options.headers = {'Content-Type':'multipart/form-data'};
          dio.options.contentType = "application/x-www-form-urlencoded";
          response = await dio.post(url, data: params);
          // print(response.data);
          return response.data;
        } catch (e) {
          print(e);
        }
        break;
    }
  }
}

//获取首页所有数据
Future homeData() async {
  return await Future.wait([
    getHomeBanner(),
    getHomeNav(),
    getHotRecommand(),
    getHomeRecommad(),
    getTicketList(1)
  ]);
}

Future getHomeBanner() async {
  return RequestTool.instance
      .request(api_list[homebannerKey], requestType.GET, null);
}

Future getHomeNav() async {
  return RequestTool.instance
      .request(api_list[homenavgationKey], requestType.GET, null);
}

Future getHomeRecommad() async {
  return RequestTool.instance.request(
      api_list[homeRecommandKey],
      requestType.GET,
      {'searchKey': '成都', 'cityName': '成都', 'column': 'ARTICLE'});
}

Future getHotRecommand() async {
  return RequestTool.instance
      .request(api_list[homeHotKey], requestType.GET, null);
}

Future getTicketList(int page) async {
  return RequestTool.instance
      .request(api_list[homeRecommandKey], requestType.GET, {
    'pageNum': page,
    'searchKey': '三亚',
    'cityName': '三亚',
    'column': 'TICKET',
    'pageSize': '20'
  });
}

/*获取分类*/
getCateGoryList() {
  return RequestTool.instance
      .request(api_list[getCategoryKey], requestType.POST, null);
}

/* 获取分类的商品 */
Future getCategoryGoods(
    String categoryId, String categorySubId, int page) {
  return RequestTool.instance.request(
      api_list[getCategoryGoodsKey],
      requestType.POST,
      {'categoryId': categoryId, 'categorySubId': categorySubId, 'page': page,'pagesize':10});
}
