import 'package:dio/dio.dart';
import 'package:ferry/ferry.dart';
import 'package:calendar/src/core/base/env.dart';
import 'package:calendar/src/core/routes/app_router.dart';
import 'package:gql_dio_link/gql_dio_link.dart';
import 'package:hive_local_storage/hive_local_storage.dart';
import 'package:injectable/injectable.dart';

import '../logging/logger.dart';
import '../network/auth_interceptor.dart';

@module
abstract class RegisterModules {
  @singleton
  AppRouter get router => AppRouter();

  @singleton
  @preResolve
  Future<LocalStorage> get storage async => await LocalStorage.getInstance();

  @lazySingleton
  Dio dio(AuthInterceptor authInterceptor) => Dio(BaseOptions(
        baseUrl: Env.instance.baseUrl,
        receiveTimeout: const Duration(seconds: 60),
        connectTimeout: const Duration(seconds: 60),
        responseType: ResponseType.json,
        headers: <String, dynamic>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ))
        ..interceptors.addAll([
          LogInterceptor(logPrint: logger.d),
          authInterceptor,
        ]);

  @lazySingleton
  Client client(Dio dio) {
    return Client(
      link: DioLink(Env.instance.baseUrl, client: dio),
      defaultFetchPolicies: {
        OperationType.query: FetchPolicy.NetworkOnly,
        OperationType.mutation: FetchPolicy.NetworkOnly,
      },
    );
  }
}
