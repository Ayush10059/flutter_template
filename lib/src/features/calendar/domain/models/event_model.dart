import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_local_storage/hive_local_storage.dart';

part 'event_model.freezed.dart';

part 'event_model.g.dart';

@freezed
class EventModel extends HiveObject with _$EventModel {
  EventModel._();

  @HiveType(typeId: 4)
  factory EventModel({
    @HiveField(0) required String id,
    @HiveField(1) required String title,
    @HiveField(2) required DateTime startTime,
    @HiveField(3) required DateTime endTime,
    @HiveField(4) @Default('-') String? description,
    @HiveField(5) @Default('-') String? notify,
    @HiveField(6) @Default('-') String? addGuest,
  }) = _EventModel;

  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);
}
