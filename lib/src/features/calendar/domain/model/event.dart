import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';

@freezed
class Event with _$Event {
  const factory Event({
    required String id,
    required String title,
    required bool allDay,
    required DateTime startTime,
    required DateTime endTime,
    String? eventLocation,
    String? description,
    String? coverImage,
  }) = _Event;
}
