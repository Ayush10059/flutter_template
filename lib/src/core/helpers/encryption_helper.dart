import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

const _chipherKey = 'hive_cipher';

class EncryptionHelper {
  const EncryptionHelper._();

  /// Helper function to generate a secure encryption key.
  static Future<HiveAesCipher> getHiveCipher() async {
    const storage = FlutterSecureStorage(
      iOptions: IOSOptions(accessibility: KeychainAccessibility.unlocked),
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
    );
    late final Uint8List encryptionKey;

    String? savedKey;
    try {
      savedKey = await storage.read(key: _chipherKey);
    } catch (e) {
      // If unable to read clear all data otherwise it will cause app crash
      // when backup is not disabled in Android.
      await storage.deleteAll();
    }

    if (savedKey == null) {
      // Secure key is not created before. Create one.
      final secureKey = Hive.generateSecureKey();
      // Save key into secure storage.
      await storage.write(
        key: _chipherKey,
        value: base64UrlEncode(secureKey),
      );
      encryptionKey = Uint8List.fromList(secureKey);
    } else {
      encryptionKey = base64Url.decode(savedKey);
    }

    return HiveAesCipher(encryptionKey);
  }
}
