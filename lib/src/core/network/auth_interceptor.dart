import 'package:dio/dio.dart';
import 'package:hive_local_storage/hive_local_storage.dart';
import 'package:injectable/injectable.dart';

import 'token_service.dart';

@lazySingleton
class AuthInterceptor extends QueuedInterceptorsWrapper {
  AuthInterceptor(this._storage, this._tokenService);

  final LocalStorage _storage;
  final TokenService _tokenService;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (_storage.hasSession) {
      final _accessToken = _storage.accessToken!;
      options.headers.addAll({'Authorization': 'Bearer ${_accessToken}'});
    }
    handler.next(options);
  }
}
