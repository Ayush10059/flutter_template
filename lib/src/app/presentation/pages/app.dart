import 'package:adaptive_sizer/adaptive_sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:calendar/localization/generated/l10n.dart';
import 'package:calendar/src/app/presentation/blocs/locale/locale_cubit.dart';
import 'package:calendar/src/core/di/injector.dart';
import 'package:calendar/src/core/routes/app_router.dart';
import 'package:calendar/src/core/themes/theme.dart';
import 'package:calendar/src/core/widgets/widgets.dart';

import '../blocs/app/app_cubit.dart';

class App extends StatelessWidget {
  App({super.key});

  final AppRouter _appRouter = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<AppCubit>(),
        ),
        BlocProvider<LocaleCubit>(
          create: (_) => LocaleCubit(),
        ),
      ],
      child: BlocListener<AppCubit, AppState>(
        listener: (context, authState) {
          authState.maybeWhen(
            authenticated: () =>
                _appRouter.replaceAll([const DashboardRoute()]),
            unAuthenticated: () => _appRouter.replaceAll([const LoginRoute()]),
            unknown: () => _appRouter.replaceAll([const LoginRoute()]),
            orElse: () {},
          );
        },
        child: BlocBuilder<LocaleCubit, LocaleState>(
          builder: (context, state) {
            return AdaptiveSizer(
              builder: (context) {
                return MaterialApp.router(
                  restorationScopeId: 'root',
                  debugShowCheckedModeBanner: false,
                  routeInformationParser: _appRouter.defaultRouteParser(),
                  routerDelegate: _appRouter.delegate(),
                  localizationsDelegates: [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  locale: state.locale,
                  theme: AppTheme.lightTheme,
                  supportedLocales: AppLocalizations.delegate.supportedLocales,
                  builder: (BuildContext context, Widget? child) {
                    ErrorWidget.builder = (FlutterErrorDetails details) =>
                        AppErrorWidget(details: details);
                    return child!;
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
