import 'package:calendar/src/core/network/xception_mixin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';

import '../typedefs/typedefs.dart';

//// Mixin to handle success and error state of the Cubit/Bloc
abstract class BaseCubit<State> extends Cubit<State> with XceptionMixin {
  BaseCubit(State initialState) : super(initialState);

  /// [R] is  response type (data) expected from the Api call.
  ///
  /// [AppError] is the error type returned from the server.
  ///
  /// [onSuccess] and [onFailure] are callbacks that returns the state of the cubit
  /// and emits either success or failure states.

  EitherXception<void> handleBusinessLogic<R>({
    required Future<Either<R, R>> call,
    required Function(Either<R, R> data) onSuccess,
    required Function(Object error) onFailure,
  }) =>
      TaskEither.tryCatch(() async {
        final response = await call;

        return emit(onSuccess(response));
      }, (error, stackTrace) {
        emit(onFailure(error));
        return getXception(error, stackTrace);
      });
}
