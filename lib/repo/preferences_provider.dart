import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'preferences.dart';

class PreferencesProvider extends ChangeNotifier {
  PreferencesProvider({
    required Locale locale,
    required String group,
    required int subgroup,
  }) : _locale = locale
     , _group = group
     , _subgroup = subgroup;

  Locale _locale;
  String _group;
  int _subgroup;

  Locale get locale => _locale;
  String get group => _group;
  int get subgroup => _subgroup;

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

  void setSubgroup(int subgroup) {
    _subgroup = subgroup;
    Preferences.setSubgroup(subgroup);
    notifyListeners();
  }
}
