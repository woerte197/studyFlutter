import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/Global.dart';
import 'package:flutter_app/common/ProfileChangeNotifier.dart';

class ThemeModel extends ProfileChangeNotifier {
  ColorSwatch get theme => Global.themes
      .firstWhere((e) => e.value == profile.theme, orElse: () => Colors.blue);

  set theme(ColorSwatch colorSwatch) {
    if (colorSwatch != theme) {
      profile.theme = colorSwatch[500].value;
      notifyListeners();
    }
  }
}
