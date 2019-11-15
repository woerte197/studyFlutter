import 'dart:ui';

import 'package:flutter_app/common/ProfileChangeNotifier.dart';

class LocaleModel extends ProfileChangeNotifier {
  Locale getLocal() {
    if (profile.locale != null) {
      var t = profile.locale.split("_");
      return Locale(t[0], t[1]);
    }
    return null;
  }

  String get locale => profile.locale;

  set locale(String locale) {
    if (locale != profile.locale) {
      profile.locale = locale;
      notifyListeners();
    }
  }
}
