import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/i10n/localization_intl.dart';

class Http extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: FlatButton(
          onPressed: () => connect(
              Uri.parse("https://book.flutterchina.club/chapter11/http.html")),
//          onPressed: () => print(Localizations.localeOf(context)),
          child: Text(DemoLocalizations.of(context).title)),
    );
  }

  connect(Uri url) async {
    try {
      HttpClient httpClient = new HttpClient();
      HttpClientRequest request = await httpClient.getUrl(url);
      HttpClientResponse response = await request.close();
      String responseString = await response.transform(utf8.decoder).join();
      print(responseString);
      httpClient.close();
    } catch (e) {
      print("${e.toString()}");
    }
  }
}
