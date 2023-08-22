import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_model.freezed.dart';

part 'calendar_model.g.dart';

@freezed
class CalendarModel with _$CalendarModel {
  const CalendarModel._();

  const factory CalendarModel() = _CalendarModel;

  factory CalendarModel.fromJson(Map<String, dynamic> json) =>
      _$CalendarModelFromJson(json);
}
