import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../domain/models/event_model.dart';
import '../../../domain/repository/calendar_repository.dart';

part 'calendar_cubit.freezed.dart';

part 'calendar_state.dart';

@injectable
class CalendarCubit extends Cubit<CalendarState> {
  CalendarCubit(this._repository)
      : super(CalendarState(focusedDay: DateTime.now())) {
    _init();
  }

  final CalendarRepository _repository;

  void _init() async {
    emit(state.copyWith(events: [...await _repository.getEvents()]));
    _repository.events().listen((events) {
      // emit(state.copyWith(events: events)); does not rebuild bloc builder.
      emit(state.copyWith(events: [...events]));
    });
  }

  void setFocusedDate(DateTime dateTime) {
    emit(state.copyWith(focusedDay: dateTime));
  }

  void onPageChanged(DateTime focusedDate) =>
      emit(state.copyWith(focusedDay: focusedDate, selectedDay: null));

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (isSameDay(state.selectedDay, selectedDay)) {
      emit(state.copyWith(selectedDay: null));
    } else {
      emit(
        state.copyWith(
          selectedDay: selectedDay,
          focusedDay: focusedDay,
        ),
      );
    }
  }

  void deleteEvent(EventModel event) => _repository.deleteEvent(event.id);
}
