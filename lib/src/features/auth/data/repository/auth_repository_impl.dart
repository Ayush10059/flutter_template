import 'package:hive_local_storage/hive_local_storage.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/base/base_repository.dart';
import '../../../../core/constants/storage_keys.dart';
import '../../../../core/typedefs/typedefs.dart';
import '../../domain/repository/auth_repository.dart';
import '../models/login_request_dto/login_request_dto.dart';
import '../source/auth_remote_source.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl extends BaseRepository implements AuthRepository {
  AuthRepositoryImpl(this._remoteSource, this._storage);

  final AuthRemoteSource _remoteSource;
  final LocalStorage _storage;

  @override
  Stream<bool> get isLoggedIn => _storage.onSessionChange.map((event) => event);

  @override
  EitherResponse<String> login(LoginRequestDto loginRequestDto) async =>
      await handleNetworkCall(
        call: _remoteSource.login(loginRequestDto),
        onSuccess: (loginModel) {
          _storage.put(
            key: StorageKeys.authKey,
            value: loginModel.userModel,
          );

          _storage.saveToken(
            loginModel.accessToken,
            loginModel.refreshToken,
          );
// TODO:
          return 'Success';
        },
      );
}
