import 'package:dio/dio.dart';
import 'package:mall/constant/string.dart';
import 'package:mall/utils/shared_preferences_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

var dio;

class HttpUtil {
  // 工厂模式
  static HttpUtil get instance => _getInstance();

  static HttpUtil _httpUtil;

  static HttpUtil _getInstance() {
    if (_httpUtil == null) {
      _httpUtil = HttpUtil();
    }
    return _httpUtil;
  }

  HttpUtil() {
    var options = BaseOptions(
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    dio = Dio(options);
    dio.interceptors.add(InterceptorsWrapper(
        // onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        // print("========================请求数据===================");
        // print("url=${options.uri.toString()}");
        // print("params=${options.data}");
        //   //  dio.lock();
        //   // await SharedPreferencesUtils.getToken().then((token) {
        //   //    options.headers[Strings.TOKEN] = token;
        //   //    print("X-Litemall-Token=${options.headers[Strings.TOKEN]}");
        //   //  });
        //   //  dio.unlock();
        //    return options;
        // },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
      print("========================返回数据===================");
      print("code=${response.statusCode}");
      print("response=${response.data}");
    }, onError: (DioError error, ErrorInterceptorHandler handler) {
      print("========================请求错误===================");
      print("message =${error.message}");
    }));
  }

  Future get(String url, {Map<String, dynamic> parameters, Options options}) async {
    try {
      Response response;
      var getOptions = BaseOptions(
        connectTimeout: 5000,
        receiveTimeout: 3000,
      );
      dio = Dio(getOptions);
      if (parameters != null && options != null) {
        response = await dio.get(url, queryParameters: parameters, options: options);
      } else if (parameters != null && options == null) {
        response = await dio.get(url, queryParameters: parameters);
      } else if (parameters == null && options != null) {
        response = await dio.get(url, options: options);
      } else {
        // print(res1.data.toString());
        // response = await dio.get(url);
        response = await dio.get(url);
      }
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  Future post(String url, {Map<String, dynamic> parameters, Options options}) async {
    Response response;
    var postOptions = BaseOptions(
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    dio = Dio(postOptions);
    if (parameters != null && options != null) {
      response = await dio.post(url, data: parameters, options: options);
    } else if (parameters != null && options == null) {
      response = await dio.post(url, data: parameters);
    } else if (parameters == null && options != null) {
      response = await dio.post(url, options: options);
    } else {
      response = await dio.post(url);
    }
    return response.data;
  }
}
