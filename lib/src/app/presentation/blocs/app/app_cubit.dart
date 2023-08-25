import 'package:bloc/bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:calendar/src/features/auth/domain/repository/auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'app_cubit.freezed.dart';

part 'app_state.dart';

@injectable
class AppCubit extends Cubit<AppState> {
  AppCubit(this._authRepository) : super(const AppState.unknown()) {
    watchLoginSession();
  }

  final AuthRepository _authRepository;

  void watchLoginSession() {
    _authRepository.isLoggedIn.listen((isLoggedIn) {
      if (isLoggedIn) {
        emit(const AppState.authenticated());
      } else {
        emit(const AppState.unAuthenticated());
      }
    });

    FlutterNativeSplash.remove();
  }

  Future<void> logout() async => _authRepository.logout();
}
