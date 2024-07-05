import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_bank/cubit/app_control_cubit/app_control_cubit.dart';
import 'package:test_task_bank/di/di.dart';
import 'package:test_task_bank/l10n/generated/test_task_app_localizations.dart';
import 'package:test_task_bank/router/app_auto_router.dart';

class TestTaskApp extends StatelessWidget {
  static Widget create() {
    return BlocProvider<AppControlCubit>(
      create: (_) => locator.get(),
      child: const TestTaskApp._(),
    );
  }

  const TestTaskApp._();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppControlCubit, AppControlState>(
      builder: (context, state) {
        return Builder(
          builder: (BuildContext context) {
            final appAutoRouter = locator<AppAutoRouter>();
            return MaterialApp.router(
              locale: state.locale,
              debugShowCheckedModeBanner: false,
              theme: state.isLightTheme ? ThemeData.light() : ThemeData.dark(),
              supportedLocales: TestTaskAppLocalizations.supportedLocales,
              routeInformationParser: appAutoRouter.defaultRouteParser(),
              routeInformationProvider: appAutoRouter.routeInfoProvider(),
              routerDelegate: appAutoRouter.delegate(),
              localizationsDelegates:
                  TestTaskAppLocalizations.localizationsDelegates,
            );
          },
        );
      },
    );
  }
}
