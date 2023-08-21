import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'bootstrap.dart';
import 'src/core/base/env.dart';
import 'src/core/envs/production_env.dart';

/// Bootstraps project with early initialization
/// with [ProductionEnv()] Environment configurations
void main() {
  runZonedGuarded(() {
    final binding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: binding);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    bootstrap(createEnv: () => Env.instance.createEnv(ProductionEnv()));
  }, (Object error, StackTrace stackTrace) => print('error'));
}
