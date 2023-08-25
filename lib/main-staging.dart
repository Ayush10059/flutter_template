import 'package:calendar/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'bootstrap.dart';
import 'src/core/base/env.dart';
import 'src/core/envs/staging_env.dart';

/// Bootstraps project with early initialization
/// with [StagingEnv()] Environment configurations
void main() {
  final binding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: binding);
  bootstrap(
    createEnv: () => Env.instance.createEnv(StagingEnv()),
    firebaseOptions: DefaultFirebaseOptions.currentPlatform,
  );
}
