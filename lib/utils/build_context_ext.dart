import 'package:flutter/material.dart';
import 'package:test_task_bank/l10n/generated/test_task_app_localizations.dart';
import 'package:test_task_bank/l10n/generated/test_task_app_localizations_en.dart';

extension BuildContextExt on BuildContext {
  TestTaskAppLocalizations get strings => TestTaskAppLocalizations.of(this);

  ThemeData get theme => Theme.of(this);

  TestTaskAppLocalizations getLocaleLocalizations(Locale locale) {
    final localeSupported = TestTaskAppLocalizations.supportedLocales.contains(
      locale,
    );

    if (!localeSupported) return TestTaskAppLocalizationsEn();

    return lookupTestTaskAppLocalizations(locale);
  }

  double get width => MediaQuery.of(this).size.width;

  bool get isWeb => width > 500;
}
