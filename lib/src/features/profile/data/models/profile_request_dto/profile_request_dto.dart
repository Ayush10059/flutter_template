import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_request_dto.freezed.dart';
part 'profile_request_dto.g.dart';

@freezed
class ProfileRequestDto with _$ProfileRequestDto {
  factory ProfileRequestDto({
    required String name,
    required String email,
    required String designation,
    required String phone,
    required String preferredFloor,
  }) = _ProfileRequestDto;
  factory ProfileRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ProfileRequestDtoFromJson(json);
}
