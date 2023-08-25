import 'package:calendar/src/core/extensions/fpdartx.dart';
import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/xception_mixin.dart';
import '../../../../core/typedefs/typedefs.dart';
import '../../domain/models/event.dart' as app;
import '../../domain/repository/google_calendar_api_repository.dart';

@Injectable(as: GoogleCalendarApiRepository)
class GoogleCalendarApiRepositoryImpl
    with XceptionMixin
    implements GoogleCalendarApiRepository {
  GoogleCalendarApiRepositoryImpl();

  late CalendarApi _calendarApi;

  @override
  EitherXception<void> addEvent({
    required String calendarId,
    required app.Event event,
  }) =>
      tryCatch(() {
        final Event gEvent;
        if (event.allDay) {
          gEvent = Event(
            start: EventDateTime(date: event.startTime),
            end: EventDateTime(date: event.endTime),
            summary: event.title,
            description: event.description,
          );
        } else {
          gEvent = Event(
            start: EventDateTime(dateTime: event.startTime),
            end: EventDateTime(dateTime: event.endTime),
            summary: event.title,
            description: event.description,
          );
        }
        return _calendarApi.events.insert(gEvent, calendarId);
      });

  @override
  EitherXception<Unit> addEvents({
    required String calendarId,
    required List<app.Event> events,
  }) =>
      tryCatch(() async {
        for (var event in events) {
          await addEvent(calendarId: calendarId, event: event).runUnwrapped();
        }
        return unit;
      });
  @override
  EitherXception<String> createCalendarWithAppName() => tryCatch(() async {
        return _calendarApi.calendars
            .insert(
              Calendar(
                summary: 'Calendar',
                description: 'Calendar for Calendar app.',
              ),
            )
            .then((value) => value.id!);
      });

  @override
  EitherXception<List<CalendarListEntry>> getCalendars() => tryCatch(() async {
        final calendartList = await _calendarApi.calendarList.list();
        return calendartList.items ?? [];
      });

  @override
  EitherXception<void> getEvents(String calendarId) {
    // TODO: implement getEvents
    throw UnimplementedError();
  }

  @override
  EitherXception<void> signIn() => tryCatch(() async {
        final googleSignIn = GoogleSignIn(
          scopes: <String>[CalendarApi.calendarScope],
        );
        await googleSignIn.signIn();
        final httpClient = await googleSignIn.authenticatedClient();
        _calendarApi = CalendarApi(httpClient!);
      });
}
