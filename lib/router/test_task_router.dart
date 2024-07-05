import '../di/di.dart';
import 'app_auto_router.gr.dart';
import 'base_router.dart';

TestTaskRouter router = locator<TestTaskRouter>();

class TestTaskRouter extends BaseRouter {
  TestTaskRouter(super.router);

  @override
  Future<void> pushRoot() => push(const WelcomeRoute());

  @override
  Future<void> replaceWithRoot() => pushAndClearStack(const WelcomeRoute());

  Future<void> pushSettings() async {
    await push(const SettingsRoute());
  }

  Future<void> pushHome() async {
    await push(const HomeRoute());
  }
}
