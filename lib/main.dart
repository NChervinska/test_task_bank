import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_task_bank/di/di.dart';
import 'package:test_task_bank/test_task_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  await configureDependencies();

  runApp(TestTaskApp.create());
}
