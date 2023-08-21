part of 'login_form_cubit.dart';

@freezed
class LoginFormState with _$LoginFormState, FormMixin {
  const LoginFormState._();

  const factory LoginFormState({
    @Default(FormStatus.initial()) FormStatus status,
    required Field<String> email,
    required Field<String> password,
  }) = _LoginFormState;

  factory LoginFormState.initial() => const LoginFormState(
        status: FormStatus.initial(),
        email: Field<String>(value: '', isValid: false),
        password: Field<String>(value: '', isValid: false),
      );

  @override
  Map<String, dynamic> get values => {
        'email': email.value.trim(),
        'password': password.value.trim(),
      };

  bool get valid => isValid;

  @override
  List<Field> get fields => [email, password];
}
