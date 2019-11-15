import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/profile.dart';

import 'Global.dart';

class ProfileChangeNotifier extends ChangeNotifier {
  Profile get profile => Global.profile;

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    Global.saveProfile();
    super.notifyListeners();
  }
}
