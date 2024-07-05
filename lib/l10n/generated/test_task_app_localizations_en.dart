// ignore_for_file: unnecessary_brace_in_string_interps, no_leading_underscores_for_local_identifiers

import 'test_task_app_localizations.dart';

/// The translations for English (`en`).
class TestTaskAppLocalizationsEn extends TestTaskAppLocalizations {
  TestTaskAppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get welcome => 'Welcome!\nHere you can check exchange rate';

  @override
  String get clickHere => 'Click Here';

  @override
  String get noInternetConnection => 'No Internet Connection';

  @override
  String get serverErrorMessage => 'Server Error';

  @override
  String get currentRateRate => 'Current date rate';

  @override
  String get settings => 'Settings';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get currentLanguage => 'English';

  @override
  String get language => 'Language';

  @override
  String get theme => 'Theme';

  @override
  String get light => 'Light';

  @override
  String get dark => 'Dark';
}
