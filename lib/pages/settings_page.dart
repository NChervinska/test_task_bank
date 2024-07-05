import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_bank/cubit/app_control_cubit/app_control_cubit.dart';
import 'package:test_task_bank/pages/view/language_dialog.dart';
import 'package:test_task_bank/pages/view/settings_view.dart';
import 'package:test_task_bank/utils/build_context_ext.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  AppControlCubit _getCubit(BuildContext context) => context.read();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.strings.settings),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<AppControlCubit, AppControlState>(
            builder: (context, state) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SettingsView(
                      onTap: () {},
                      title: context.strings.theme,
                      subtitle: state.isLightTheme
                          ? context.strings.light
                          : context.strings.dark,
                      child: Switch(
                        value: state.isLightTheme,
                        onChanged: _getCubit(context).setTheme,
                      ),
                    ),
                    SettingsView(
                      onTap: () {
                        showDialog(
                          context: context,
                          barrierColor: Colors.black.withOpacity(.4),
                          builder: (context) {
                            return LanguageDialog(
                              onSelect: (locale) {
                                _getCubit(context).setLocale(locale);
                                Navigator.of(context).pop();
                              },
                            );
                          },
                        );
                      },
                      title: context.strings.language,
                      subtitle: context.strings.currentLanguage,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
