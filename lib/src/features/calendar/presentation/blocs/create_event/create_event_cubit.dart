import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../../../../core/form/field.dart';
import '../../../../../core/form/form_mixin.dart';
import '../../../../../core/form/form_status.dart';
import '../../../domain/models/event_model.dart';
import '../../../domain/repository/calendar_repository.dart';

part 'create_event_cubit.freezed.dart';

part 'create_event_state.dart';

class CreateEventCubit extends Cubit<CreateEventState> {
  CreateEventCubit(this.calendarRepository, EventModel? event)
      : super(CreateEventState.initial()) {}

  final CalendarRepository calendarRepository;

  void onTitleChanged(String title) {
    late Field<String> _titleField;
    if (title.isNotEmpty)
      _titleField = state.title.copyWith(
        value: title,
        errorMessage: '',
        isValid: true,
      );
    else
      _titleField = state.title.copyWith(
        value: title,
        errorMessage: 'Enter Title',
        isValid: false,
      );
    emit(state.copyWith(title: _titleField));
  }

  void onStartDateChanged(DateTime? value) {
    emit(state.copyWith(startTime: value));
  }

  void onEndDateChanged(DateTime? value) {
    emit(state.copyWith(endTime: value));
  }

  void onDescriptionChanged(String description) {
    late Field<String> _descriptionField;
    if (description.length < 100)
      _descriptionField = state.description.copyWith(
        value: description,
        errorMessage: '',
        isValid: true,
      );
    else
      _descriptionField = state.title.copyWith(
        value: description,
        errorMessage: 'Too long',
        isValid: false,
      );
    emit(state.copyWith(description: _descriptionField));
  }

  void onNotifyChanged(String value) {
    late Field<String> _notifyField;
    _notifyField = state.notify.copyWith(
      value: value,
      errorMessage: '',
      isValid: true,
    );

    emit(state.copyWith(notify: _notifyField));
  }

  void onAddGuestChanged(String value) {
    late Field<String> _addGuestField;
    _addGuestField = state.addGuest.copyWith(
      value: value,
      errorMessage: '',
      isValid: true,
    );

    emit(state.copyWith(addGuest: _addGuestField));
  }

  void onSubmit() async {
    emit(state.copyWith(status: const FormStatus.submitting()));

    final event = EventModel(
      id: const Uuid().v4(),
      title: state.title.value,
      startTime: state.startTime!,
      endTime: state.endTime!,
      description: state.description.value,
      notify: state.notify.value,
      addGuest: state.addGuest.value,
    );

    calendarRepository.addEvent(event);

    emit(state.copyWith(status: const FormStatus.success()));
  }
}
