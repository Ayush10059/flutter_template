part of 'calendar_cubit.dart';

@freezed
class CalendarState with _$CalendarState {
  const CalendarState._();

  const factory CalendarState({
    @Default(CalendarFormat.month) CalendarFormat calendarFormat,

    /// Calendar plugin shows/presents calendar view for the [focusedDay] in
    /// the given [CalendarFormat].
    required DateTime focusedDay,
    DateTime? selectedDay,

    /// All events.
    @Default([]) List<Event> events,
  }) = _CalendarState;

  /// Get events of a month from all events.
  List<Event> getEventsOfMonth(DateTime dateTime) => events
      .where(
        (e) =>
            DateFormat('yyyy-MM').format(e.startTime) ==
            DateFormat('yyyy-MM').format(dateTime),
      )
      .toList();

  /// Get events of a day from all events.
  List<Event> getEventsOfDay(DateTime dateTime) => events
      .where(
        (e) =>
            DateFormat('yyyy-MM-dd').format(e.startTime) ==
            DateFormat('yyyy-MM-dd').format(dateTime),
      )
      .toList();

  /// Get map of [DateTime] and list of [Event].
  Map<DateTime, List<Event>> getMapOfEventByDate(List<Event> events) {
    HashMap<DateTime, List<Event>> eventMap = HashMap();
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

  Map<DateTime, List<Event>> getEventMap() => getMapOfEventByDate(
        selectedDay != null
            ? getEventsOfDay(selectedDay!)
            : getEventsOfMonth(focusedDay),
      );
}
