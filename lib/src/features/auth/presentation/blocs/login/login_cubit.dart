import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/login_request_dto/login_request_dto.dart';
import '../../../domain/repository/auth_repository.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authRepository) : super(const LoginState.initial());

  final AuthRepository _authRepository;

  Future<void> login(LoginRequestDto loginRequestDto) async {
    emit(const LoginState.loading());
    final res = await _authRepository.login(loginRequestDto).run();

    res.fold(
      (data) => emit(const LoginState.success()),
      (error) => emit(LoginState.error(message: error)),
    );
  }

  Future<void> logout() async {
    emit(const LoginState.loading());
    final res = await _authRepository.logout().run();

    res.fold(
      (data) => emit(const LoginState.success()),
      (error) => emit(LoginState.error(message: error)),
    );
  }
}
