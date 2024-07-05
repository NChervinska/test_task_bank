import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:test_task_bank/cubit/core/base_cubit.dart';
import 'package:test_task_bank/router/test_task_router.dart';
import 'package:test_task_bank/service/preferences_service.dart';

part 'app_control_state.dart';

@injectable
class AppControlCubit extends BaseCubit<AppControlState> {
  final PreferencesService _preferencesService;
  final TestTaskRouter router;

  AppControlCubit(
    this._preferencesService,
    this.router,
  ) : super(AppControlState(
          locale: _preferencesService.getLocale(),
          isLightTheme: _preferencesService.getIsLightTheme() ?? true,
        ));

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(errorMessage: errorMessage));
  }

  Future<void> setLocale(Locale? locale) async {
    if (locale == null) return;

    await performSafeAction(() async {
      await _preferencesService.setLocale(locale);
      emit(state.copyWith(locale: locale));
    });
  }

  Future<void> setTheme(bool isLightTheme) async {
    await performSafeAction(() async {
      await _preferencesService.setIsLightTheme(isLightTheme);
      emit(state.copyWith(isLightTheme: isLightTheme));
    });
  }
}
