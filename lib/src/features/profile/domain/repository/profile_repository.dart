import '../../../../core/typedefs/typedefs.dart';
import '../../data/models/profile_model/profile_model.dart';
import '../../data/models/profile_request_dto/profile_request_dto.dart';

abstract class ProfileRepository {
  EitherXception<ProfileModel> getUserProfile();

  EitherXception<ProfileModel> updateUserProfile(
      ProfileRequestDto profileRequestDto);
}
