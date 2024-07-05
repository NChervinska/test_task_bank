import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:test_task_bank/models/rate.dart';
import 'package:test_task_bank/service/preferences_service.dart';
import 'package:test_task_bank/service/rate_service.dart';

import '../core/base_cubit.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends BaseCubit<HomeState> {
  final RateService _rateService;
  final PreferencesService _preferencesService;

  HomeCubit(
    this._rateService,
    this._preferencesService,
  ) : super(const HomeState());

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      status: HomeStatus.error,
      errorMessage: errorMessage,
    ));

    getRatesFromLocalStorage();
  }

  Future<void> init() async {
    await performSafeAction(() async {
      emit(state.copyWith(
        status: HomeStatus.initial,
        rates: await _rateService.getExchangeList(),
      ));
    });
  }

  void getRatesFromLocalStorage() {
    emit(state.copyWith(
      status: HomeStatus.initial,
      rates: _preferencesService.getRates(),
    ));
  }
}
