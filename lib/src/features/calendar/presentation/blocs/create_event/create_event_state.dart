part of 'create_event_cubit.dart';

@freezed
class CreateEventState with _$CreateEventState {
  const factory CreateEventState({
    required CreateEventForm form,
    @Default(FormSubmissionStatus.initial)
    FormSubmissionStatus submissionStatus,
    String? eventId,
  }) = _CreateEventState;
}
