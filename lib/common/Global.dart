import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/common/SharedPreferencesUtil.dart';
import 'package:flutter_app/models/cacheConfig.dart';
import 'package:flutter_app/models/profile.dart';

const _themes = <MaterialColor>[
  Colors.blue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.red,
];

class Global{
  static List<MaterialColor> get themes => _themes;
  static Profile profile = Profile();
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");
  static Future init() async {
    SharedPreferencesUtil.init();
    var _profile = SharedPreferencesUtil.preferences.getString("profile");
    if (_profile != null) {
      try{
        profile =Profile.fromJson(jsonDecode(_profile));
      }catch (e){
        print(e);
      }
    }
    profile.cache = profile.cache??CacheConfig()
      ..enable = true
      ..maxAge = 3600
      ..maxCount = 100;
    saveProfile();
  }
  // 持久化Profile信息
  static saveProfile() =>
      SharedPreferencesUtil.preferences.setString("profile", jsonEncode(profile.toJson()));

}

