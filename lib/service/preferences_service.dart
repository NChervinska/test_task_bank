import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_task_bank/l10n/generated/test_task_app_localizations.dart';
import 'package:test_task_bank/models/rate.dart';

@injectable
class PreferencesService {
  static const _localeKey = '_localeKey';
  static const _themeKey = '_themeKey';
  static const _ratesKey = '_ratesKey';

  final SharedPreferences _prefs;

  PreferencesService._(this._prefs);

  @factoryMethod
  @preResolve
  static Future<PreferencesService> getInstance() async {
    final prefs = await SharedPreferences.getInstance();
    return PreferencesService._(prefs);
  }

  ///
  /// Localization
  ///

  String getDefaultLanguageCode() {
    if (kIsWeb) {
      return TestTaskAppLocalizations.supportedLocales.first.languageCode;
    }
    if (TestTaskAppLocalizations.supportedLocales
        .contains(Locale(Platform.localeName))) {
      return Platform.localeName;
    }
    return TestTaskAppLocalizations.supportedLocales.first.languageCode;
  }

  Locale getLocale() {
    final languageCode =
        _prefs.getString(_localeKey) ?? getDefaultLanguageCode();
    return Locale(languageCode);
  }

  Future<void> setLocale(Locale locale) async {
    await _prefs.setString(_localeKey, locale.languageCode);
  }

  ///
  /// Rates
  ///

  List<Rate> getRates() {
    final rates = _prefs.getStringList(_ratesKey)?.map((rate) {
      return Rate.fromJson(jsonDecode(rate));
    }).toList();

    return rates ?? <Rate>[];
  }

  Future<void> setRates(List<Rate> rates) async {
    await _prefs.setStringList(
      _ratesKey,
      rates.map((rate) => jsonEncode(rate.toJson())).toList(),
    );
  }

  ///
  /// Theme
  ///

  bool? getIsLightTheme() {
    return _prefs.getBool(_themeKey);
  }

  Future<void> setIsLightTheme(bool isLightTheme) async {
    await _prefs.setBool(_themeKey, isLightTheme);
  }
}
