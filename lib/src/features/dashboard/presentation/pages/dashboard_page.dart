import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remixicon/remixicon.dart';

import '../../../../core/di/injector.dart';
import '../../../../core/routes/app_router.dart';
import '../../../auth/presentation/blocs/login/login_cubit.dart';

@RoutePage()
class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            onPressed: () => getIt<AppRouter>().push(const CalendarRoute()),
            icon: const Icon(Remix.calendar_2_line),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                context.read<LoginCubit>().logout();
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
