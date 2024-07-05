import 'package:injectable/injectable.dart';

import '../router/app_auto_router.dart';
import '../router/test_task_router.dart';

@module
abstract class RouterModule {
  @singleton
  AppAutoRouter hazAppAutoRouter() {
    return AppAutoRouter();
  }

  @singleton
  TestTaskRouter hazRouter(AppAutoRouter router) {
    return TestTaskRouter(router);
  }
}
