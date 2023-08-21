import 'package:bloc/bloc.dart';
import 'package:calendar/src/core/extensions/extensions.dart';
import 'package:calendar/src/core/form/field.dart';
import 'package:calendar/src/core/form/form_mixin.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/form/form_status.dart';
import '../../../data/models/login_request_dto/login_request_dto.dart';

part 'login_form_cubit.freezed.dart';

part 'login_form_state.dart';

@injectable
class LoginFormCubit extends Cubit<LoginFormState> {
  LoginFormCubit()
      : super(
          const LoginFormState(
            email: const Field<String>(value: ''),
            password: const Field<String>(value: '', obscureText: true),
          ),
        );

  void onEmailChange(String value) {
    late Field<String> _emailField;
    if (value.isNotEmpty && value.isEmail)
      _emailField = state.email.copyWith(
        value: value,
        errorMessage: '',
        isValid: true,
      );
    else
      _emailField = state.email.copyWith(
        value: value,
        errorMessage: 'Enter Valid Email',
        isValid: false,
      );
    emit(state.copyWith(email: _emailField));
  }

  void onPasswordChange(String value) {
    late Field<String> _passwordField;
    if (value.isNotEmpty && value.length > 8)
      _passwordField = state.password.copyWith(
        value: value,
        isValid: true,
        errorMessage: '',
      );
    else
      _passwordField = state.password.copyWith(
        value: value,
        errorMessage: 'Enter valid password',
        isValid: false,
      );
    emit(state.copyWith(password: _passwordField));
  }

  void togglePassword() {
    final passwordField = state.password;
    final currentToggleState = passwordField.obscureText;
    final toggledField = state.password.copyWith(
      value: passwordField.value,
      errorMessage: passwordField.errorMessage,
      obscureText: !currentToggleState,
    );
    emit(state.copyWith(password: toggledField));
  }

  LoginRequestDto get getLoginDto => LoginRequestDto(
        email: state.email.value,
        password: state.password.value,
      );
}
