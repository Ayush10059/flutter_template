import 'package:auto_route/auto_route.dart';

import 'app_router.dart';

export 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: DashboardRoute.page),
    AutoRoute(page: CalendarRoute.page),
    AutoRoute(page: CreateEventRoute.page),
    AutoRoute(page: EventDetailRoute.page),
  ];
}
