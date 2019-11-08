import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'messages_all.dart'; //1

class DemoLocalizations {
  static Future<DemoLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    //2
    return initializeMessages(localeName).then((b) {
      Intl.defaultLocale = localeName;
      return new DemoLocalizations();
    });
  }

  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
  }

  String get title {
    return Intl.message(
      'Flutter APP',
      name: 'title',
      desc: 'Title for the Demo application',
    );
  }

  String get titleA {
    return Intl.message(
      'Flutter',
      name: 'titleA',
      desc: 'Title for the Demo ',
    );
  }

  remainingEmailsMessage(int howMany) => Intl.plural(howMany,
      zero: 'There are no emails left',
      one: 'There is $howMany email left',
      other: 'There are $howMany emails left',
      name: "remainingEmailsMessage",
      args: [howMany],
      desc: "How many emails remain after archiving.",
      examples: const {'howMany': 42, 'userName': 'Fred'});
}

class DemoLocalizationsDelegate
    extends LocalizationsDelegate<DemoLocalizations> {
  @override
  bool isSupported(Locale locale) {
    // TODO: implement isSupported
    return ["en", "zh"].contains(locale.languageCode);
  }

  @override
  Future<DemoLocalizations> load(Locale locale) {
    // TODO: implement load
    return DemoLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<DemoLocalizations> old) {
    // TODO: implement shouldReload
    return false;
  }
}
