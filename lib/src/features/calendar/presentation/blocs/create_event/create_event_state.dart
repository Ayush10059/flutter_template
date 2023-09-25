part of 'create_event_cubit.dart';

@freezed
class CreateEventState with _$CreateEventState, FormMixin {
  const CreateEventState._();

  const factory CreateEventState({
    @Default(FormStatus.initial()) FormStatus status,
    required Field<String> title,
    DateTime? startTime,
    DateTime? endTime,
    @Default(const Field<String>(value: '', isValid: false))
    Field<String> description,
    @Default(const Field<String>(value: '', isValid: false))
    Field<String> notify,
    @Default(const Field<String>(value: '', isValid: false))
    Field<String> addGuest,
  }) = _CreateEventState;

  factory CreateEventState.initial() => CreateEventState(
        title: const Field<String>(value: '', isValid: false),
        startTime: DateTime.now(),
        endTime: DateTime.now(),
        status: const FormStatus.initial(),
      );

  bool get valid => isValid;

  @override
  List<Field> get fields => [title, description, notify, addGuest];
}
