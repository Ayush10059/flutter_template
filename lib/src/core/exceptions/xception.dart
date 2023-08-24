import 'package:eb_core_flutter/eb_core_flutter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../localization/l10n.dart';
import 'local_exception.dart';
import 'network_exception.dart';

part 'xception.freezed.dart';

/// Xception is globally used all over the app so that it will be easy to
/// use/handle and translate to localized strings.
///
/// Generally it is a wrapper around [NetworkException] and [LocalException].
@freezed
class Xception with _$Xception implements Exception {
  const Xception._();

  /// Exception from Network calls.
  const factory Xception.network(NetworkException exception) = _XceptionNetwork;

  /// Custom exception that are related to a feature
  /// or other type of exception.
  const factory Xception.local(LocalException exception) = _XceptionLocal;

  const factory Xception.unsupportedPlatform() = _UnsupportedPlatform;

  const factory Xception.other(Object error) = _Other;

  /// Converts Object into useful [Xception].
  factory Xception.from(Object error) {
    // Every possible Exception should be converted here since we don't know,
    // what object can be.

    // error is not Exception so it is some object.
    if (error is! Exception) return Xception.other(error);

    // error is ApiException which implements Exception.
    if (error is ApiException) {
      return Xception.network(
        error.when(
          response: (e) => NetworkException.response(e),
          connection: () => const NetworkException.connection(),
          timeout: () => const NetworkException.timeout(),
          unexpected: () => const NetworkException.unexpected(),
        ),
      );
    }

    if (error is NetworkException) return Xception.network(error);
    if (error is LocalException) return Xception.local(error);

    if (error is Xception) return error;

    return Xception.other(error);
  }

  String toLocalized(AppLocalizations l10n) => when(
        network: (exception) => exception.toLocalized(l10n),
        local: (exception) => exception.toLocalized(l10n),
        unsupportedPlatform: () => l10n.xceptionUnsupportedPlatform,
        other: (o) => o.toString(),
      );
}
