import 'dart:collection';

import 'package:dio/dio.dart';

import 'Global.dart';

class CacheObject {
  CacheObject(this.response)
      : timeStamp = DateTime
      .now()
      .millisecondsSinceEpoch;
  Response response;
  int timeStamp; // 缓存创建时间

  @override
  bool operator ==(other) {
    return response.hashCode == other.hashCode;
  }

  //将请求uri作为缓存的key
  @override
  int get hashCode => response.realUri.hashCode;
}

class NetCache extends Interceptor {
  var cache = LinkedHashMap<String, CacheObject>();

  @override
  onRequest(RequestOptions options) async {
    // TODO: implement onRequest
    if (!Global.profile.cache.enable) {
      bool refresh = options.extra["refresh"] == true;
      if (refresh) {
        if (options.extra["list"] == true) {
          cache.removeWhere((key, v) => key.contains(options.path));
        } else {
          delete(options.uri.toString());
        }
      }
      return onRequest(options);
    }
    if (options.extra["noCache"] != true &&
        options.method.toLowerCase() == 'get') {
      String key = options.extra["cacheKey"] ?? options.uri.toString();
      var ob = cache[key];
      if (ob != null) {
        if ((DateTime
            .now()
            .millisecondsSinceEpoch - ob.timeStamp) / 1000 <
            Global.profile.cache.maxAge) {
          return cache[key].response;
        } else {
          cache.remove(key);
        }
      }
    }

    return super.onRequest(options);
  }

  @override
  onError(DioError err) {
    // TODO: implement onError
    return super.onError(err);
  }

  @override
  onResponse(Response response) {
    // TODO: implement onResponse
    if (Global.profile.cache.enable) {
      _saveCache(response);
    }
  }

  _saveCache(Response object) {
    RequestOptions options = object.request;
    if (options.extra["noCache"] != true &&
        options.method.toLowerCase() == "get") {
      // 如果缓存数量超过最大数量限制，则先移除最早的一条记录
      if (cache.length == Global.profile.cache.maxCount) {
        cache.remove(cache[cache.keys.first]);
      }
      String key = options.extra["cacheKey"] ?? options.uri.toString();
      cache[key] = CacheObject(object);
    }
  }
    void delete(String key) {
      cache.remove(key);
    }
  }
