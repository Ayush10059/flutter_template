/*
 * Copyright (c) 2022.
 * Author: Kishor Mainali
 * Company: EB Pearls
 */

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
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (_storage.hasSession) {
      if (_storage.isTokenExpired) {
        /// TODO: implement refreshToken
        await _tokenService.refreshToken();
      }
      final token = _storage.getSession();
      options.headers.addAll({'Authorization': 'Bearer ${token!.accessToken}'});
    }
    handler.next(options);
  }
}
