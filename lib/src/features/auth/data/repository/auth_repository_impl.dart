import 'package:hive_local_storage/hive_local_storage.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/storage_keys.dart';
import '../../../../core/network/xception_mixin.dart';
import '../../../../core/typedefs/typedefs.dart';
import '../../domain/repository/auth_repository.dart';
import '../models/login_request_dto/login_request_dto.dart';
import '../source/auth_remote_source.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl with XceptionMixin implements AuthRepository {
  AuthRepositoryImpl(this._remoteSource, this._storage);

  final AuthRemoteSource _remoteSource;
  final LocalStorage _storage;

  @override
  Stream<bool> get isLoggedIn => _storage.onSessionChange.map((event) => event);

// TODO: return model
  @override
  EitherXception<String> login(LoginRequestDto loginRequestDto) => tryCatch(
        () async {
          final loginModel = await _remoteSource.login(loginRequestDto);

          _storage.put(
            key: StorageKeys.authKey,
            value: loginModel.userModel,
          );

          _storage.saveToken(
            loginModel.accessToken,
            loginModel.refreshToken,
          );

          return 'login Success';
        },
      );

  @override
  EitherXception<String> logout() {
    return tryCatch(
      () async {
        await _remoteSource.logout();

        _storage.clearSession();

        return 'logout Success';
      },
    );
  }
}
