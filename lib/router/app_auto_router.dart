import 'package:auto_route/auto_route.dart';

import 'app_auto_router.gr.dart';

const _durationInMilliseconds = 250;
const _fadeIn = TransitionsBuilders.fadeIn;

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppAutoRouter extends $AppAutoRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          page: HomeRoute.page,
          path: '/home',
          transitionsBuilder: _fadeIn,
          durationInMilliseconds: _durationInMilliseconds,
        ),
        CustomRoute(
          page: WelcomeRoute.page,
          path: '/welcome',
          initial: true,
          transitionsBuilder: _fadeIn,
          durationInMilliseconds: _durationInMilliseconds,
        ),
        CustomRoute(
          page: SettingsRoute.page,
          path: '/settings',
          transitionsBuilder: _fadeIn,
          durationInMilliseconds: _durationInMilliseconds,
        ),
      ];
}
