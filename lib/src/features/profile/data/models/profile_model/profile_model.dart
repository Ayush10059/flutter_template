import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_local_storage/hive_local_storage.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
class ProfileModel with _$ProfileModel {
  const ProfileModel._();

  @HiveType(typeId: 5)
  const factory ProfileModel({
    @HiveField(0) required String name,
    @HiveField(1) required String email,
    @HiveField(2) required String designation,
    @HiveField(3) required String phone,
    @HiveField(4) required String preferredFloor,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
}
