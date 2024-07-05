// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../api/api_client.dart' as _i7;
import '../cubit/app_control_cubit/app_control_cubit.dart' as _i8;
import '../cubit/home_cubit/home_cubit.dart' as _i10;
import '../router/app_auto_router.dart' as _i4;
import '../router/test_task_router.dart' as _i6;
import '../service/preferences_service.dart' as _i3;
import '../service/rate_service.dart' as _i9;
import 'api_module.dart' as _i12;
import 'router_module.dart' as _i11;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final routerModule = _$RouterModule();
  final apiModule = _$ApiModule();
  await gh.factoryAsync<_i3.PreferencesService>(
    () => _i3.PreferencesService.getInstance(),
    preResolve: true,
  );
  gh.singleton<_i4.AppAutoRouter>(() => routerModule.hazAppAutoRouter());
  gh.lazySingleton<_i5.Dio>(() => apiModule.dio());
  gh.singleton<_i6.TestTaskRouter>(
      () => routerModule.hazRouter(gh<_i4.AppAutoRouter>()));
  gh.lazySingleton<_i7.ApiClient>(() => apiModule.apiClient(gh<_i5.Dio>()));
  gh.factory<_i8.AppControlCubit>(() => _i8.AppControlCubit(
        gh<_i3.PreferencesService>(),
        gh<_i6.TestTaskRouter>(),
      ));
  gh.factory<_i9.RateService>(() => _i9.RateService(
        gh<_i7.ApiClient>(),
        gh<_i3.PreferencesService>(),
      ));
  gh.factory<_i10.HomeCubit>(() => _i10.HomeCubit(
        gh<_i9.RateService>(),
        gh<_i3.PreferencesService>(),
      ));
  return getIt;
}

class _$RouterModule extends _i11.RouterModule {}

class _$ApiModule extends _i12.ApiModule {}
