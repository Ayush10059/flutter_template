import 'dart:async';

import 'package:dio/dio.dart';
import 'package:ferry/ferry.dart';
import 'package:calendar/src/core/base/env.dart';
import 'package:gql_dio_link/gql_dio_link.dart';
import 'package:hive_local_storage/hive_local_storage.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class TokenService {
  TokenService(this._storage) {
    final _dio = Dio(BaseOptions(
      baseUrl: Env.instance.baseUrl,
      receiveTimeout: const Duration(seconds: 60),
      connectTimeout: const Duration(seconds: 60),
      responseType: ResponseType.json,
      headers: <String, dynamic>{
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ));

    _client = Client(
      link: DioLink(Env.instance.baseUrl, client: _dio),
      defaultFetchPolicies: {
        OperationType.query: FetchPolicy.NetworkOnly,
        OperationType.mutation: FetchPolicy.NetworkOnly,
      },
    );
  }

  final LocalStorage _storage;
  late Client _client;

  Future<void> refreshToken() async {
    //TODO: implement your own logics for refresh token
  }
}
