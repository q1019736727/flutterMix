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
          print(response.data);
          return response.data;
        } catch (e) {
          print(e);
        }
        break;
      case requestType.POST:
        try {
          response = await dio.post(url, data: params);
          print(response.data);
          return response.data;
        } catch (e) {
          print(e);
        }
        break;
    }
  }
}

Future getHomeBanner() async {
  return RequestTool.instance
      .request(api_list[homebannerKey], requestType.GET, null);
}
