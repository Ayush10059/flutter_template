import 'package:auto_route/auto_route.dart';

import 'app_router.dart';

export 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: LoginRoute.page),
    AutoRoute(
      page: DashboardRoute.page,
      children: [
        AutoRoute(page: SearchRoute.page),
        AutoRoute(page: MyEventsRoute.page),
        AutoRoute(page: GoogleEventsRoute.page),
        AutoRoute(page: SettingsRoute.page),
        RedirectRoute(path: '*', redirectTo: ''),
      ],
    ),
    AutoRoute(page: CalendarRoute.page),
    AutoRoute(page: CreateEventRoute.page),
    AutoRoute(page: EventDetailRoute.page),
    AutoRoute(page: ProfileRoute.page),
    AutoRoute(page: EditProfileRoute.page),
  ];
}
