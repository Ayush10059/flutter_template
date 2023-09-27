import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../domain/repository/profile_repository.dart';
import '../source/profile_remote_source.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl(this._remoteSource);

  final ProfileRemoteSource _remoteSource;
}
