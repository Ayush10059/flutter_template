part of 'calendar_cubit.dart';

@freezed
class CalendarState with _$CalendarState {
  const CalendarState._();

  const factory CalendarState({
    @Default(CalendarFormat.month) CalendarFormat calendarFormat,
    required DateTime focusedDay,
    DateTime? selectedDay,
    @Default([]) List<EventModel> events,
  }) = _CalendarState;

  List<EventModel> getEventsOfMonth(DateTime dateTime) => events
      .where(
        (e) =>
            DateFormat('yyyy-MM').format(e.startTime) ==
            DateFormat('yyyy-MM').format(dateTime),
      )
      .toList();

  List<EventModel> getEventsOfDay(DateTime dateTime) => events
      .where(
        (e) =>
            DateFormat('yyyy-MM-dd').format(e.startTime) ==
            DateFormat('yyyy-MM-dd').format(dateTime),
      )
      .toList();

  Map<DateTime, List<EventModel>> getMapOfEventByDate(List<EventModel> events) {
    HashMap<DateTime, List<EventModel>> eventMap = HashMap();
    for (var event in events) {
      if (eventMap.containsKey(event.startTime)) {
        eventMap[event.startTime]!.add(event);
      } else {
        eventMap[event.startTime] = [event];
      }
    }
    return Map.fromEntries(
      eventMap.entries.toList()..sort((e1, e2) => e1.key.compareTo(e2.key)),
    );
  }

  Map<DateTime, List<EventModel>> getEventMap() => getMapOfEventByDate(
        selectedDay != null
            ? getEventsOfDay(selectedDay!)
            : getEventsOfMonth(focusedDay),
      );
}
