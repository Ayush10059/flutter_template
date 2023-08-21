import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';

import '../errors/app_error.dart';

import '../../../localization/l10n.dart';

//// Mixin to handle success and error state of the Cubit/Bloc
abstract class BaseCubit<State> extends Cubit<State> {
  BaseCubit(State initialState) : super(initialState);

  /// [R] is  response type (data) expected from the Api call.
  ///
  /// [AppError] is the error type returned from the server.
  ///
  /// [onSuccess] and [onFailure] are callbacks that returns the state of the cubit
  /// and emits either success or failure states.

  Future<void> handleBusinessLogic<R>({
    required Future<Either<AppError, R>> call,
    required Function(R data) onSuccess,
    required Function(String error) onFailure,
  }) async {
    final response = await call;

    emit(
      response.fold(
        (error) => error.when(
          serverError: (message) => onFailure(message),
          noInternet: () => onFailure(l10n.noInternet),
          unAuthorized: () => onFailure(l10n.unAuthorizedAccess),
          validationsError: (message) => onFailure(message),
          unAuthenticated: () => onFailure(l10n.unAuthorizedAccess),
        ),
        (result) => onSuccess(result),
      ),
    );
  }
}
