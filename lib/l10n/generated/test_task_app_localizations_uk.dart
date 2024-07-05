// ignore_for_file: unnecessary_brace_in_string_interps, no_leading_underscores_for_local_identifiers

import 'test_task_app_localizations.dart';

/// The translations for Ukrainian (`uk`).
class TestTaskAppLocalizationsUk extends TestTaskAppLocalizations {
  TestTaskAppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get welcome => 'Вітаю!\nТут ви можете переглянути курс валют';

  @override
  String get clickHere => 'Тицяй сюди';

  @override
  String get noInternetConnection => 'Немає інтернет зʼєднання';

  @override
  String get serverErrorMessage => 'Помилка серверу';

  @override
  String get currentRateRate => 'Курс на поточну дату';

  @override
  String get settings => 'Налаштування';

  @override
  String get selectLanguage => 'Виберіть мову';

  @override
  String get currentLanguage => 'Українська';

  @override
  String get language => 'Мова';

  @override
  String get theme => 'Тема';

  @override
  String get light => 'Світла';

  @override
  String get dark => 'Темна';
}
