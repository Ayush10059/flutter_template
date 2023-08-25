import 'package:fpdart/fpdart.dart';
import 'package:googleapis/calendar/v3.dart' as g_api;

import '../../../../core/typedefs/typedefs.dart';
import '../models/event.dart';

abstract class GoogleCalendarApiRepository {
  EitherXception<List<g_api.CalendarListEntry>> getCalendars();
  EitherXception<String> createCalendarWithAppName();
  EitherXception<void> addEvent({
    required String calendarId,
    required Event event,
  });
  EitherXception<Unit> addEvents({
    required String calendarId,
    required List<Event> events,
  });
  EitherXception<void> getEvents(String calendarId);
  EitherXception<void> signIn();
}
