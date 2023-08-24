import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../exceptions/xception.dart';
import '../logging/logger.dart';

mixin XceptionMixin {
  @protected
  Xception getXception(Object error, StackTrace stackTrace) {
    logger.e('error(getXception,XceptionMixin): $error');
    logger.e('stackTrace(getXception,XceptionMixin): $stackTrace');

    return Xception.from(error);
  }

  @protected
  TaskEither<Xception, R> tryCatch<R>(
    Future<R> Function() run, {
    /// By default it is [getXception].
    Xception Function(Object error, StackTrace stackTrace)? onXception,
  }) =>
      TaskEither.tryCatch(run, onXception ?? getXception);
}
