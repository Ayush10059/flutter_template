import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';

@freezed
class Address with _$Address {
  const factory Address({
    required String value,
    (double lat, double lng)? latLng,
    String? googlePlaceId,
  }) = _Address;
}
