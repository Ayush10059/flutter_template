import 'package:fpdart/fpdart.dart';
import 'package:googleapis/calendar/v3.dart';

import '../../../../core/typedefs/typedefs.dart';
import '../models/event_model.dart';

abstract class GoogleCalendarApiRepository {
  EitherXception<List<CalendarListEntry>> getCalendars();

  EitherXception<String> createCalendarWithAppName();

  EitherXception<void> addEvent({
    required String calendarId,
    required EventModel event,
  });

  EitherXception<Unit> addEvents({
    required String calendarId,
    required List<EventModel> events,
  });

  EitherXception<void> getEvents(String calendarId);

  EitherXception<void> signIn();
}
