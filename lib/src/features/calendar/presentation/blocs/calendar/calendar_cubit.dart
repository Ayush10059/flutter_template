import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../domain/models/event.dart';
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

  /// Listen to stream of events and update states.
  void _init() {
    // set initial event list
    emit(state.copyWith(events: [..._repository.getEvents()]));
    // update state whenever event list is updated.
    _repository.events().listen((events) {
      // emit(state.copyWith(events: events)); does not rebuild bloc builder.
      emit(state.copyWith(events: [...events]));
    });
  }

  void setFocusedDate(DateTime dateTime) {
    emit(state.copyWith(focusedDay: dateTime));
  }

  /// On calendar page changed unset selected date and set focused date from
  /// calendar.
  void onPageChanged(DateTime focusedDate) =>
      emit(state.copyWith(focusedDay: focusedDate, selectedDay: null));

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (isSameDay(state.selectedDay, selectedDay)) {
      // If selected date is same day as previously selected date unset the
      // selected date.
      emit(state.copyWith(selectedDay: null));
    } else {
      // Else set the selected date and focused day.
      emit(
        state.copyWith(
          selectedDay: selectedDay,
          focusedDay: focusedDay,
        ),
      );
    }
  }

  void deleteEvent(Event event) => _repository.deleteEvent(event.id);
}
