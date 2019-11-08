import 'package:dio/dio.dart';

class NetUtil {
  factory NetUtil() => _getInstance();

  static NetUtil get ins => _getInstance();
  static NetUtil _ins;
  Dio dio;

  NetUtil._internal() {
    dio = new Dio();
  }

  static NetUtil _getInstance() {
    if (_ins == null) {
      _ins = new NetUtil._internal();
    }
    return _ins;
  }

  Future<Response> get(String path, {Map<String, dynamic> queryParameters})  {
    return  dio.get(path, queryParameters: queryParameters);
  }
}
