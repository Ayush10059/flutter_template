import 'package:freezed_annotation/freezed_annotation.dart';

import '../exceptions/xception.dart';

part 'async_value.freezed.dart';

@freezed

/// Class to mimic AsyncValue from Riverpod.
class AsyncValue<T> with _$AsyncValue<T> {
  const AsyncValue._();

  const factory AsyncValue.data(T data) = AsyncData<T>;
  const factory AsyncValue.loading() = AsyncLoading<T>;
  const factory AsyncValue.error(Xception error, {StackTrace? stackTrace}) =
      AsyncError<T>;

  bool get isLoading => this is AsyncLoading<T>;
  bool get isData => this is AsyncData<T>;
  bool get isError => this is AsyncError<T>;

  /// Returns data when it is ActorSuccess else throws error.
  ///
  /// Must not be used if this is not ActorSuccess.
  T get asData => (this as AsyncData<T>).data;

  /// Returns Xception when it is ActorError else throws error.
  ///
  /// Must not be used if this is not ActorError.
  Object get asError => (this as AsyncError<T>).error;
}
