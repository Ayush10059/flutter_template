part of 'profile_form_cubit.dart';

@freezed
class ProfileFormState with _$ProfileFormState, FormMixin {
  const ProfileFormState._();

  const factory ProfileFormState({
    @Default(FormStatus.initial()) FormStatus status,
    required Field<String> name,
    required Field<String> email,
    required Field<String> designation,
    required Field<String> phone,
    required Field<String> preferredFloor,
  }) = _ProfileFormState;

  factory ProfileFormState.initial() => const ProfileFormState(
        status: FormStatus.initial(),
        name: Field<String>(value: ''),
        email: Field<String>(value: '', isValid: false),
        designation: Field<String>(value: ''),
        phone: Field<String>(value: '', isValid: false),
        preferredFloor: Field<String>(value: ''),
      );

  bool get valid => isValid;

  @override
  List<Field> get fields => [name, email, designation, phone, preferredFloor];
}
