import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static const String localeKey = "locale";
  static const String groupKey = "group";
  static const String subgroupKey = "subgroup";

  static Locale getDefaultLocale() {
    var locale = Locale(Intl.shortLocale(Intl.getCurrentLocale()));
    if (!AppLocalizations.supportedLocales.contains(locale)) {
      locale = const Locale("en");
    }
    return locale;
  }

  static Future<bool> setLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(localeKey, locale.toString());
  }

  static Future<Locale?> getLocale() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final localeStr = prefs.getString(localeKey);

      if (localeStr == null || localeStr.isEmpty) {
        return null;
      }

      return Locale(localeStr);
    } catch (_) {
      return null;
    }
  }

  static Future<bool> setGroup(String group) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(groupKey, group);
  }

  static Future<String> getGroup() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final group = prefs.getString(groupKey);
      return group ?? "";
    } catch (_) {
      return "";
    }
  }

  static Future<bool> setSubgroup(int subgroup) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setInt(subgroupKey, subgroup);
  }

  static Future<int> getSubgroup() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final subgroup = prefs.getInt(subgroupKey);
      return subgroup ?? 1;
    } catch (_) {
      return 1;
    }
  }
}
