// import 'package:eb_core_flutter/eb_core_flutter.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:uuid/uuid.dart';

// import '../../../domain/models/address.dart';
// import '../../../domain/models/event.dart';
// import '../../../domain/models/repeat_type.dart';
// import '../../../domain/repository/calendar_repository.dart';
// import '../create_event_form/create_event_form.dart';

// part 'create_event_cubit.freezed.dart';

// part 'create_event_state.dart';

// class CreateEventCubit extends Cubit<CreateEventState> {
//   CreateEventCubit(this.calendarRepository, Event? event)
//       : super(
//           CreateEventState(
//             form: event != null
//                 ? CreateEventForm.fromEvent(event)
//                 : const CreateEventForm(),
//             eventId: event?.id,
//           ),
//         );

//   final CalendarRepository calendarRepository;

//   void onImageChanged(Filez? filez) {
//     emit(state.copyWith.form(image: filez));
//   }

//   void onTitleChanged(String title) {
//     emit(state.copyWith.form(title: title));
//   }

//   DateTime _withCurrentTime(DateTime dateTime) {
//     final now = DateTime.now();
//     return DateTime(
//       dateTime.year,
//       dateTime.month,
//       dateTime.day,
//       now.hour,
//       now.minute,
//       now.second,
//     );
//   }

//   void onAllDayCheckChanged(bool value) {
//     final s = state.form.startTime;
//     final e = state.form.endTime;

//     emit(
//       state.copyWith.form(
//         allDay: value,
//         startTime: s != null ? _withCurrentTime(s) : null,
//         endTime: e != null ? _withCurrentTime(e) : null,
//       ),
//     );
//   }

//   void onStartDateChanged(DateTime? value) {
//     emit(state.copyWith.form(startTime: value));
//   }

//   void onEndDateChanged(DateTime? value) {
//     emit(state.copyWith.form(endTime: value));
//   }

//   void onDescriptionChanged(String description) {
//     emit(state.copyWith.form(description: description));
//   }

//   void onRepeatTypeChanged(RepeatType repeatType) {
//     emit(state.copyWith.form(repeatType: repeatType));
//   }

//   void onLocationChanged(Address? value) {
//     emit(state.copyWith.form(location: value));
//   }

//   void onSubmit() async {
//     emit(state.copyWith(submissionStatus: FormSubmissionStatus.inProgress));

//     final image = state.form.image;
//     String? imagePath;
//     if (image != null && image.isFile) {
//       imagePath = (image as PlatformFilez).file.path;
//     }
//     final event = Event(
//       id: state.eventId ?? const Uuid().v4(),
//       coverImage: imagePath,
//       eventLocation: state.form.location?.value,
//       title: state.form.title,
//       allDay: state.form.allDay,
//       startTime: state.form.startTime!,
//       endTime: state.form.endTime!,
//       description: state.form.description,
//     );
//     if (state.eventId != null) {
//       calendarRepository.updateEvent(event);
//     } else {
//       calendarRepository.addEvent(event);
//     }
//     emit(state.copyWith(submissionStatus: FormSubmissionStatus.success));
//   }
// }
