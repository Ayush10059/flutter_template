import 'package:calendar/src/features/auth/data/models/login_request_dto/login_request_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/base/base_bloc.dart';
import '../../../domain/repository/auth_repository.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

@injectable
class LoginCubit extends BaseCubit<LoginState> {
  LoginCubit(this._authRepository) : super(const LoginState.initial());

  final AuthRepository _authRepository;

  void login(LoginRequestDto loginRequestDto) {
    emit(const LoginState.loading());
    handleBusinessLogic(
      call: _authRepository.login(loginRequestDto).run(),
      onSuccess: (data) => const LoginState.success(),
      onFailure: (error) => LoginState.error(message: error),
    );
  }

  void logout() {
    emit(const LoginState.loading());
    handleBusinessLogic(
      call: _authRepository.logout().run(),
      onSuccess: (data) => const LoginState.success(),
      onFailure: (error) => LoginState.error(message: error),
    );
  }
}
