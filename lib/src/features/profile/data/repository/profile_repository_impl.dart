import 'package:calendar/src/core/typedefs/typedefs.dart';
import 'package:hive_local_storage/hive_local_storage.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/storage_keys.dart';
import '../../../../core/network/xception_mixin.dart';
import '../../domain/repository/profile_repository.dart';
import '../models/profile_model/profile_model.dart';
import '../models/profile_request_dto/profile_request_dto.dart';
import '../source/profile_remote_source.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl with XceptionMixin implements ProfileRepository {
  ProfileRepositoryImpl(this._remoteSource, this._storage);

  final ProfileRemoteSource _remoteSource;
  final LocalStorage _storage;

  @override
  EitherXception<ProfileModel> getUserProfile() => tryCatch(
        () async {
          final ProfileModel profileModel =
              await _remoteSource.getUserProfile();

          _storage.put(
            key: StorageKeys.profileKey,
            value: profileModel,
          );

          return profileModel;
        },
      );

  @override
  EitherXception<ProfileModel> updateUserProfile(
          ProfileRequestDto profileRequestDto) =>
      tryCatch(
        () async {
          final ProfileModel profileModel =
              await _remoteSource.updateUserProfile(profileRequestDto);

          _storage.put(
            key: StorageKeys.profileKey,
            value: profileModel,
          );

          return profileModel;
        },
      );
}
