import 'package:ferry/ferry.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/base/base_remote_source.dart';
import '../models/profile_model/profile_model.dart';
import '../models/profile_request_dto/profile_request_dto.dart';

abstract class ProfileRemoteSource {
  Future<ProfileModel> getUserProfile();
  Future<ProfileModel> updateUserProfile(ProfileRequestDto profileRequestDto);
}

@LazySingleton(as: ProfileRemoteSource)
class ProfileRemoteSourceImpl extends BaseRemoteSource
    implements ProfileRemoteSource {
  ProfileRemoteSourceImpl(Client super.client);

  @override
  Future<ProfileModel> getUserProfile() async {
    /// TODO: @ayush bajracharya Mock User
    ProfileModel profile = const ProfileModel(
      name: 'Ayush Bajracharya',
      email: 'example.email@gmail.com',
      designation: 'Trainee',
      phone: '9809090098',
      preferredFloor: 'Ground Floor',
    );
    return profile;
  }

  @override
  Future<ProfileModel> updateUserProfile(
      ProfileRequestDto profileRequestDto) async {
    /// TODO: @ayush bajracharya Mock User
    ProfileModel profile = ProfileModel(
      name: profileRequestDto.name,
      email: profileRequestDto.email,
      designation: profileRequestDto.designation,
      phone: profileRequestDto.phone,
      preferredFloor: profileRequestDto.preferredFloor,
    );
    return profile;
  }
}
