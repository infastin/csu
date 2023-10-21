import 'package:csu/repo/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PreferencesProvider extends ChangeNotifier {
  PreferencesProvider({
    required Locale locale,
    required String group,
  }) : _locale = locale, _group = group;

  Locale _locale;
  String _group;

  Locale get locale => _locale;
  String get group => _group;

  void setLocale(Locale locale) {
    if (!AppLocalizations.supportedLocales.contains(locale)) {
      return;
    }

    _locale = locale;
    Preferences.setLocale(locale);

    notifyListeners();
  }

  void setGroup(String group) {
    _group = group;
    Preferences.setGroup(group);

    notifyListeners();
  }
}
