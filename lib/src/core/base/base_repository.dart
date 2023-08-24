import 'package:calendar/src/core/exceptions/xception.dart';
import 'package:fpdart/fpdart.dart';

import '../network/xception_mixin.dart';

abstract class BaseRepository with XceptionMixin {
  const BaseRepository();

  /// [T] is Return type for [EitherXception]
  ///
  /// [R] is response type from server that is params for [onSuccess] callback
  ///
  /// [onSuccess] callback returns the [T] and accept [R]
  TaskEither<Xception, T> handleNetworkCall<R, T>({
    required Future<R> call,
    required T Function(R data) onSuccess,
  }) =>
      TaskEither.tryCatch(
        () async {
          final data = await call;
          return onSuccess(data);
        },
        (error, stackTrace) => getXception(error, stackTrace),
      );
}
