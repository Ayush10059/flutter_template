/*
 * Copyright (c) 2022
 * Author: Kishor Mainali
 * Company: EB Pearls
 */

part of 'login_form_cubit.dart';

@freezed
class LoginFormState with _$LoginFormState, FormMixin {
  const LoginFormState._();

  const factory LoginFormState({
    required Field<String> email,
    required Field<String> password,
  }) = _LoginFormState;

  @override
  List<Field> get fields => [email, password];

  @override
  Map<String, dynamic> get values => {
        'email': email.value.trim(),
        'password': password.value.trim(),
      };
}
