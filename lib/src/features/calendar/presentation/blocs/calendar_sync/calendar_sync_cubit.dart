// import 'package:eb_core_flutter/eb_core_flutter.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:fpdart/fpdart.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:googleapis/calendar/v3.dart' as gc;
// import 'package:injectable/injectable.dart';

// import '../../../../../core/exceptions/xception.dart';
// import '../../../domain/models/event.dart';
// import '../../../domain/repository/google_calendar_api_repository.dart';

// part 'calendar_sync_cubit.freezed.dart';
// part 'calendar_sync_state.dart';

// @injectable
// class CalendarSyncCubit extends Cubit<CalendarSyncState> {
//   CalendarSyncCubit(
//     this.googleCalendarApiRepository,
//   ) : super(CalendarSyncState.initial());

//   final GoogleCalendarApiRepository googleCalendarApiRepository;

//   Future<void> fetchCalendars() async {
//     _resetEffects();

//     // if (!calendars.isSuccess || calendars.hasErrors) {
//     //   emit(
//     //     state.copyWith(
//     //       submissionStatus: FormSubmissionStatus.failure,
//     //     ),
//     //   );
//     //   return;
//     // }
//     // if (calendars.data == null) {
//     //   emit(state.copyWith(calendars: []));
//     //   return;
//     // }

//     // emit(
//     //   state.copyWith(
//     //     calendars: calendars.data!.map((e) => e).toList(),
//     //     initialized: true,
//     //   ),
//     // );
//   }

//   Future<void> _addEventsToCalendar({
//     required String calendarId,
//     required List<Event> events,
//   }) async {
//     // for (var item in events) {
//     //   final event = dc.Event(
//     //     calendarId,
//     //     title: item.title,
//     //     allDay: item.allDay,
//     //     description: item.description,
//     //     start: dc.TZDateTime.from(
//     //       item.startTime,
//     //       currentLocation,
//     //     ),
//     //     end: dc.TZDateTime.from(
//     //       item.endTime,
//     //       currentLocation,
//     //     ),
//     //   );
//     //   await dc.DeviceCalendarPlugin().createOrUpdateEvent(event);
//     // }
//   }

//   Future<void> addEventsToCalendar({
//     required String calendarId,
//     required List<Event> events,
//   }) async {
//     _resetEffects();
//     emit(state.copyWith(submissionStatus: FormSubmissionStatus.inProgress));
//     _addEventsToCalendar(calendarId: calendarId, events: events);
//     emit(state.copyWith(submissionStatus: FormSubmissionStatus.success));
//   }

//   /// Create a new Calendar in device and add events to it.
//   Future<void> createCalendarAddEvents(List<Event> events) async {
//     _resetEffects();
//     // emit(state.copyWith(submissionStatus: FormSubmissionStatus.inProgress));

//     // String calendarIdToAddEvents;
//     // // create calendar if it does not exist.
//     // if (!state.calendars.containsWhere((e) => e.name == AppConst.appNameEN)) {
//     //   if (!res.isSuccess || res.hasErrors) {
//     //     emit(
//     //       state.copyWith(
//     //         submissionStatus: FormSubmissionStatus.failure,
//     //       ),
//     //     );
//     //     return;
//     //   }
//     //   calendarIdToAddEvents = res.data!;

//     //   // fetch calendars
//     //   final calendars = await deviceCalendarPlugin.retrieveCalendars();
//     //   if (!calendars.isSuccess || calendars.hasErrors) {
//     //     emit(
//     //       state.copyWith(
//     //         submissionStatus: FormSubmissionStatus.failure,
//     //       ),
//     //     );
//     //     return;
//     //   }
//     //   // emit state with new calendar list
//     //   if (calendars.data == null) {
//     //     emit(state.copyWith(calendars: []));
//     //     return;
//     //   }
//     //   emit(
//     //     state.copyWith(
//     //       calendars: calendars.data!.map((e) => e).toList(),
//     //       initialized: true,
//     //     ),
//     //   );
//     // } else {
//     //   calendarIdToAddEvents =
//     //       state.calendars.firstWhere((e) => e.name == AppConst.appNameEN).id!;
//     // }
//     // // add events
//     // await _addEventsToCalendar(
//     //   calendarId: calendarIdToAddEvents,
//     //   events: events,
//     // );
//     // emit(state.copyWith(submissionStatus: FormSubmissionStatus.success));
//   }

//   Future<void> createCalendarAddEventsToGoogleCalendarApi(
//     List<Event> events,
//   ) async {
//     // _resetEffects();
//     // emit(state.copyWith(submissionStatus: FormSubmissionStatus.inProgress));

//     // final res = await googleCalendarApiRepository.signIn().flatMap(
//     //   (_) {
//     //   return googleCalendarApiRepository.getCalendars().flatMap((r) {
//     //     late String calendarId;
//     //     if (r.containsWhere(
//     //       (element) {
//     //         if (element.summary == AppConst.appNameEN) {
//     //           calendarId = element.id!;
//     //           return true;
//     //         }
//     //         return false;
//     //       },
//     //     )) {
//     //       return TaskEither.right(calendarId);
//     //     }
//     //     return googleCalendarApiRepository.createCalendarWithAppName();
//     //   }).flatMap(
//     //     (r) {
//     //       return googleCalendarApiRepository.addEvents(
//     //         calendarId: r,
//     //         events: events,
//     //       );
//     //     },
//     //   );
//     // },
//     // ).run();

//     // res.fold(
//     //   (l) => emit(
//     //     state.copyWith(
//     //       submissionStatus: FormSubmissionStatus.failure,
//     //     ),
//     //   ),
//     //   (r) => emit(
//     //     state.copyWith(
//     //       submissionStatus: FormSubmissionStatus.success,
//     //     ),
//     //   ),
//     // );
//   }

//   void _resetEffects() {
//     emit(
//       state.copyWith(
//         submissionStatus: FormSubmissionStatus.initial,
//       ),
//     );
//   }
// }
