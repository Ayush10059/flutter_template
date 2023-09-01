import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_local_storage/hive_local_storage.dart';
import 'package:path_provider/path_provider.dart';

import 'src/app/app.dart';
import 'src/core/constants/storage_keys.dart';
import 'src/core/di/injector.dart';
import 'src/core/helpers/encryption_helper.dart';
import 'src/core/logging/logger.dart';
import 'src/features/calendar/domain/models/event_model.dart';

class AppBlocObserver extends BlocObserver {
  @override
  Future<void> onChange(BlocBase bloc, Change change) async {
    super.onChange(bloc, change);
    logger.d('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    logger.e('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap({
  required Function() createEnv,
  Function()? intRootLogger,
  FirebaseOptions? firebaseOptions,
}) async {
  Bloc.observer = AppBlocObserver();
  GoogleFonts.config.allowRuntimeFetching = false;
  FlutterError.onError = (FlutterErrorDetails details) {
    logger.e(details.exceptionAsString());
  };
  await createEnv();
  await Firebase.initializeApp(options: firebaseOptions);

  _addFontsLicenses();

  await configureInjection();

  final storageDir = await getApplicationSupportDirectory();
  await _initDependencies(storageDir.path);

  /// Runs error on own error zone
  Future.delayed(const Duration(milliseconds: 400), () => runApp(App()));
}

Future<void> _initDependencies(String storagePath) async {
  Hive.init(storagePath);

  await Hive.openBox<EventModel>(
    StorageKeys.eventKey,
    encryptionCipher: await EncryptionHelper.getHiveCipher(),
  );
}

void _addFontsLicenses() {
  LicenseRegistry.addLicense(() async* {
    final robotoLicense =
        await rootBundle.loadString('google_fonts/LICENSE.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], robotoLicense);
  });
}
