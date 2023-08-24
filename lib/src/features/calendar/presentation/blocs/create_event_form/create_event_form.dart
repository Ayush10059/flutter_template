import 'dart:io';

import 'package:eb_core_flutter/eb_core_flutter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/address.dart';
import '../../../domain/models/event.dart';
import '../../../domain/models/repeat_type.dart';

part 'create_event_form.freezed.dart';

@freezed
class CreateEventForm with _$CreateEventForm {
  const CreateEventForm._();

  const factory CreateEventForm({
    Filez? image,
    @Default('') String title,
    DateTime? startTime,
    DateTime? endTime,
    @Default('') String description,
    Address? location,
    @Default(RepeatType.noRepeat) RepeatType repeatType,
    @Default(false) bool allDay,
  }) = _CreateEventForm;

  factory CreateEventForm.fromEvent(Event event) => CreateEventForm(
        image: event.coverImage != null
            ? Filez.platform(File(event.coverImage!))
            : null,
        allDay: event.allDay,
        description: event.description ?? '',
        endTime: event.endTime,
        startTime: event.startTime,
        title: event.title,
        location: event.eventLocation != null
            ? Address(value: event.eventLocation!)
            : null,
      );
}
