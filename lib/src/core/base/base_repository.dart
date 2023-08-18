/*
 * Copyright (c) 2022
 * Author: Kishor Mainali
 * Company: EB Pearls
 */
import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:calendar/localization/l10n.dart';

import '../errors/api_exception.dart';
import '../errors/app_error.dart';
import '../logging/logger.dart';
import '../typedefs/typedefs.dart';

/// {@template base_repository}
/// A [BaseRepository] class for handling network status and exceptions.
///
/// Methods should return EitherResponse.
/// {@endtemplate}
class BaseRepository {
  /// BaseRepository is not meant to be used with other than server
  /// (BaseRemoteSource).
  ///
  /// If you need to make http request or use third party plugin that can throw
  /// exception other that NetworkError don't use [BaseRepository].
  BaseRepository();

  /// [T] is Return type for [EitherResponse]
  ///
  /// [R] is response type from server that is params for [onSuccess] callback
  ///
  /// [onSuccess] callback returns the [T] and accept [R]
  ///
  /// This should not be used other that making request to server. Otherwise
  /// you would not be able to handle exceptions properly.
  EitherResponse<T> handleNetworkCall<R, T>({
    required Future<R> call,
    required FutureOr<T> Function(R data) onSuccess,
  }) async {
    try {
      final data = await call;
      return right(await onSuccess(data));
    } on ApiException catch (e) {
      final apiException = e.when(
        serverException: (message) => AppError.serverError(message: message),
        network: () => const AppError.noInternet(),
      );
      return left(apiException);
    } on Exception catch (e) {
      logger.e(e.toString());
      return left(AppError.serverError(message: l10n.serverError));
    }
  }
}
