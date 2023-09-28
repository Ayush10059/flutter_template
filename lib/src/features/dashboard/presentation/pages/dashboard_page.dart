import 'package:auto_route/auto_route.dart';
import 'package:calendar/src/core/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injector.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/widgets/custom_bottom_bar.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../auth/presentation/blocs/login/login_cubit.dart';

@RoutePage()
class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            onPressed: () => getIt<AppRouter>().push(const CalendarRoute()),
            icon: const Icon(Icons.calendar_month),
          )
        ],
      ),
      body: Column(
        children: [
          CustomButton(
            onPressed: () {
              context.read<LoginCubit>().logout();
            },
            label: 'Logout',
            isDisabled: false,
          ),
        ],
      ).pad(20),
    );
  }
}

@RoutePage()
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.pageView(
      routes: const [
        SearchRoute(),
        MyEventsRoute(),
        GoogleEventsRoute(),
        ProfileRoute(),
      ],
      builder: (context, child, _) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: CustomBottomBar(
            onTap: (index) {
              tabsRouter.setActiveIndex(index);
            },
            activeIndex: tabsRouter.activeIndex,
          ),
        );
      },
    );
  }
}
