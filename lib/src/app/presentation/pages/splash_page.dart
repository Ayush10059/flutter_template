/*
 * Copyright (c) 2022.
 * Author: Kishor Mainali
 * Company: EB Pearls
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:calendar/src/core/di/injector.dart';
import 'package:calendar/src/core/extensions/extensions.dart';
import 'package:calendar/src/core/routes/app_router.dart';
import '../blocs/app/app_cubit.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            authenticated: () {
              getIt<AppRouter>().replace(const DashboardRoute());
            },
            unAuthenticated: () {
              getIt<AppRouter>().replace(const LoginRoute());
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const SizedBox.shrink(),
            initial: (showSplash) {
              if (showSplash) {
                //TODO: design custom splash screen
                return Container(
                  width: context.width,
                  height: context.height,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                  ),
                  child: const Text('Splash Screen'),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          );
        },
      ),
    );
  }
}