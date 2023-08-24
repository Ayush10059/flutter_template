import 'package:fpdart/fpdart.dart';
import 'package:googleapis/calendar/v3.dart' as g_api;

import '../../../../core/typedefs/typedefs.dart';
import '../models/event.dart';

abstract class GoogleCalendarApiRepository {
  EitherResponse<List<g_api.CalendarListEntry>> getCalendars();
  EitherResponse<String> createCalendarWithAppName();
  EitherResponse<void> addEvent({
    required String calendarId,
    required Event event,
  });
  EitherResponse<Unit> addEvents({
    required String calendarId,
    required List<Event> events,
  });
  EitherResponse<void> getEvents(String calendarId);
  EitherResponse<void> signIn();
}
