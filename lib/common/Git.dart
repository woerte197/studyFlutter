import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/common/Global.dart';
import 'package:flutter_app/models/repo.dart';
import 'package:flutter_app/models/user.dart';

class Git {
  Options _options;
  BuildContext context;

  Git([this.context]) {
    _options = Options(extra: {"context": context});
  }

  static Dio dio =  new Dio(BaseOptions(baseUrl: 'http://api.github.com/',headers: {
    HttpHeaders.acceptHeader:"application/vnd.github.squirrel-girl-preview,"
        "application/vnd.github.symmetra-preview+json",
  }));

  static void init(){
    dio.interceptors.add(Global.netCache);
    dio.options.headers[HttpHeaders.authorizationHeader] = Global.profile.token;

    if(!Global.isRelease){
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client){
        client.findProxy =(uri){
          return "PROXY 10.1.10.250:8888";
        };
      client.badCertificateCallback = (X509Certificate cert,String host,int port) => true;
      };
    }
  }

  Future<User> login(String login,String pwd) async{
    String basic = 'Basic'+base64.encode(utf8.encode('$login:$pwd'));
    var r= await dio.get("user/$login",options: _options.merge(headers: {HttpHeaders.authorizationHeader:basic},extra: {"noCache":true,}),);
    dio.options.headers[HttpHeaders.authorizationHeader] = basic;
    Global.netCache.cache.clear();
    Global.profile.token = basic;
    return User.fromJson(r.data);
  }

  Future<List<Repo>> getRepos({Map<String,dynamic> queryParamaters,refresh = false} )async{
    if(refresh){
      _options.extra.addAll({"refresh":true,"list":true});
    }
    var r  = await dio.get<List>("user/repos",queryParameters: queryParamaters,options: _options);
    return r.data.map((e)=>Repo.fromJson(e)).toList();
  }

}
