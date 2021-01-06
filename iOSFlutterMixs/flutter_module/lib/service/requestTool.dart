import 'package:dio/dio.dart';
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
Future homeData() async{
  return await Future.wait([getHomeBanner(),getHomeNav(),getHotRecommand(),getHomeRecommad(),getTicketList(1)]);
}

Future getHomeBanner() async {
  return RequestTool.instance
      .request(api_list[homebannerKey], requestType.GET, null);
}

Future getHomeNav() async{
  return RequestTool.instance.request(api_list[homenavgationKey], requestType.GET, null);
}

Future getHomeRecommad() async {
  return RequestTool.instance
    .request(api_list[homeRecommandKey], requestType.GET, {'searchKey':'成都','cityName':'成都','column':'ARTICLE'});
}

Future getHotRecommand() async{
  return RequestTool.instance
    .request(api_list[homeHotKey], requestType.GET, null);
}

Future getTicketList(int page) async{
    return RequestTool.instance
    .request(api_list[homeRecommandKey], requestType.GET, {'pageNum':page,'searchKey':'三亚','cityName':'三亚','column':'TICKET','pageSize':'20'});
}

Future getCateGoryList() async {
  return RequestTool.instance
    .request(api_list[getCategoryKey], requestType.POST, null);
}