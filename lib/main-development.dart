import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:logging/logging.dart';

import 'bootstrap.dart';
import 'src/core/base/env.dart';
import 'src/core/envs/development_env.dart';

/// Bootstraps project with early initialization
/// with [DevelopmentEnv()] Environment configurations
void main() => runZonedGuarded(() {
      // enableFlutterDriverExtension();
      final binding = WidgetsFlutterBinding.ensureInitialized();
      FlutterNativeSplash.preserve(widgetsBinding: binding);
      bootstrap(
        createEnv: () => Env.instance.createEnv(DevelopmentEnv()),
        intRootLogger: _initRootLogger,
      );
    }, (Object error, StackTrace stackTrace) => print('error'));

/// Initialize top level root Logger
_initRootLogger() {
  Logger.root.level = Level.ALL;
}
