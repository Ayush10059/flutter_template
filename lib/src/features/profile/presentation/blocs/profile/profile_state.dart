part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loading() = _Loading;
  const factory ProfileState.error({required Xception xception}) = _Error;
  const factory ProfileState.success({required ProfileModel profileModel}) =
      _Success;
}
