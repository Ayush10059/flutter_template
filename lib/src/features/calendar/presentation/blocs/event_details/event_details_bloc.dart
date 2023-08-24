import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/event.dart';
import '../../../domain/repository/calendar_repository.dart';

part 'event_details_bloc.freezed.dart';

typedef EventDetailsState = AsyncValue<Event>;

class EventDetailsBloc extends Bloc<EventDetailsEvent, EventDetailsState> {
  EventDetailsBloc({
    required this.calendarRepository,
    required this.eventId,
  }) : super(const AsyncValue.loading()) {
    on<_GetEventDetails>(_onGetEventDetails);
  }
  final CalendarRepository calendarRepository;
  final String eventId;

  Future<FutureOr<void>> _onGetEventDetails(
    _GetEventDetails event,
    Emitter<EventDetailsState> emit,
  ) async {
    await emit.onEach(
      calendarRepository.events(),
      onData: (data) =>
          emit(AsyncData(data.firstWhere((e) => e.id == eventId))),
    );
  }
}

@freezed
class EventDetailsEvent with _$EventDetailsEvent {
  const factory EventDetailsEvent.getEventDetails() = _GetEventDetails;
}
