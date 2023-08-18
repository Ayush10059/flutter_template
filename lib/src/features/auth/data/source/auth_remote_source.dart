/*
 * Copyright (c) 2022.
 * Author: Kishor Mainali
 * Company: EB Pearls
 */

import 'package:dartz/dartz.dart';
import 'package:ferry/ferry.dart';
import 'package:calendar/src/core/base/base_remote_source.dart';
import 'package:injectable/injectable.dart';

abstract class AuthRemoteSource {
  Future<Unit> login(Map<String, dynamic> values);
}

@LazySingleton(as: AuthRemoteSource)
class AuthRemoteSourceImpl extends BaseRemoteSource
    implements AuthRemoteSource {
  AuthRemoteSourceImpl(Client super.client);

  @override
  Future<Unit> login(Map<String, dynamic> values) async {
    //TODO:
    throw UnimplementedError();
  }
}
