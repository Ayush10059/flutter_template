part of 'app_cubit.dart';

@freezed
class AppState with _$AppState {
  const AppState._();

  const factory AppState.unknown() = _Unknown;
  const factory AppState.authenticated() = _Authenticated;
  const factory AppState.unAuthenticated() = _UnAuthenticated;

  bool get isAuthenticated => this is _Authenticated;
}
