import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class NetUtil {
  factory NetUtil() => _getInstance();

  static NetUtil get ins => _getInstance();
  static NetUtil _ins;
  Dio dio;

  NetUtil._internal() {
    dio = new Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
      //设置代理
//      client.findProxy = (uri) {
//        return "PROXY 192.168.1.2:8888";
//      };
      //校验证书
      client.badCertificateCallback=(X509Certificate cert, String host, int port){
        if(cert.pem=="PEM"){
          return true; //证书一致，则允许发送数据
        }
        return false;
      };
    };
  }

  static NetUtil _getInstance() {
    if (_ins == null) {
      _ins = new NetUtil._internal();
    }
    return _ins;
  }

  Future<Response> get(String path, {Map<String, dynamic> queryParameters}) {
    return dio.get(path, queryParameters: queryParameters);
  }

  Future<Response> post(String path, Object data) {
    return dio.post(path, data: data);
  }

  Future<List<Response>> moreConnect(Iterable<Future<Response>> futures) {
    return Future.wait(futures);
  }

  Future<Response> download(String path,Object savePath){
    return dio.download(path, savePath);
  }
  Future<Response> postFormData(FormData  formData){
    return  dio.post("/info", data: formData);
  }

}
