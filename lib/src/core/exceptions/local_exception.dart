import '../../../localization/l10n.dart';
import 'xception.dart';

/// Implement [LocalException] when creating any exceotion to use in the app.
abstract class LocalException implements Exception {
  /// Translate Exception to localized string.
  String toLocalized(AppLocalizations l10n);
}

extension LocalExceptionX on LocalException {
  Xception get xception => Xception.local(this);
}
