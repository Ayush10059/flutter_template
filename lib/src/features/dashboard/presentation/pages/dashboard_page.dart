import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

import '../../../../core/di/injector.dart';
import '../../../../core/routes/app_router.dart';

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
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text('data'),
          ],
        ),
      ),
    );
  }
}
