import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../localization/l10n.dart';
import 'local_exception.dart';

part 'location_exception.freezed.dart';

@freezed
class LocationException with _$LocationException implements LocalException {
  const LocationException._();

  const factory LocationException.locationNotEnabled() =
      LocationExceptionNotEnabled;
  const factory LocationException.permissionDenied() =
      LocationExceptionPermissionDenied;
  const factory LocationException.permissionDeniedForever() =
      LocationExceptionPermissionDeniedForever;

  @override
  String toLocalized(AppLocalizations l10n) => when(
        locationNotEnabled: () => l10n.locationNotEnabled,
        permissionDenied: () => l10n.locationExceptionDenied,
        permissionDeniedForever: () => l10n.locationExceptionDeniedForever,
      );
}
