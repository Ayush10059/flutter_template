import 'package:bloc/bloc.dart';
import 'package:calendar/src/core/extensions/extensions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/form/field.dart';
import '../../../../../core/form/form_mixin.dart';
import '../../../../../core/form/form_status.dart';
import '../../../data/models/profile_request_dto/profile_request_dto.dart';

part 'profile_form_state.dart';
part 'profile_form_cubit.freezed.dart';

@injectable
class ProfileFormCubit extends Cubit<ProfileFormState> {
  ProfileFormCubit() : super(ProfileFormState.initial());

  void onNameChange(String value) {
    late Field<String> _nameField;
    if (value.isNotEmpty)
      _nameField = state.name.copyWith(
        value: value,
        isValid: true,
        errorMessage: '',
      );
    else
      _nameField = state.name.copyWith(
        value: value,
        errorMessage: 'Please Enter Name',
        isValid: false,
      );
    emit(state.copyWith(name: _nameField));
  }

  void onEmailChange(String value) {
    late Field<String> _emailField;
    if (value.isNotEmpty && value.isEmail)
      _emailField = state.email.copyWith(
        value: value,
        isValid: true,
        errorMessage: '',
      );
    else
      _emailField = state.email.copyWith(
        value: value,
        errorMessage: 'Enter Valid Email',
        isValid: false,
      );
    emit(state.copyWith(email: _emailField));
  }

  void onDesignationChange(String value) {
    late Field<String> _designationField;
    if (value.isNotEmpty)
      _designationField = state.designation.copyWith(
        value: value,
        isValid: true,
        errorMessage: '',
      );
    else
      _designationField = state.designation.copyWith(
        value: value,
        errorMessage: 'Please Enter Designation',
        isValid: false,
      );
    emit(state.copyWith(designation: _designationField));
  }

  void onPhoneChange(String value) {
    late Field<String> _phoneField;
    if (value.isNotEmpty && value.isValidPhone)
      _phoneField = state.phone.copyWith(
        value: value,
        isValid: true,
        errorMessage: '',
      );
    else
      _phoneField = state.phone.copyWith(
        value: value,
        errorMessage: 'Enter Valid Phone Number',
        isValid: false,
      );
    emit(state.copyWith(phone: _phoneField));
  }

  void onPreferredFloorChange(String value) {
    late Field<String> _preferredFloorField;
    if (value.isNotEmpty)
      _preferredFloorField = state.preferredFloor.copyWith(
        value: value,
        isValid: true,
        errorMessage: '',
      );
    else
      _preferredFloorField = state.phone.copyWith(
        value: value,
        errorMessage: 'Enter Preferred Floor',
        isValid: false,
      );
    emit(state.copyWith(preferredFloor: _preferredFloorField));
  }

  ProfileRequestDto get getProfileDto => ProfileRequestDto(
        name: state.name.value,
        email: state.email.value,
        designation: state.designation.value,
        phone: state.phone.value,
        preferredFloor: state.preferredFloor.value,
      );
}
