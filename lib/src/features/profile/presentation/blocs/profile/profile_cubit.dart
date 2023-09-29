import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/exceptions/xception.dart';
import '../../../data/models/profile_model/profile_model.dart';
import '../../../data/models/profile_request_dto/profile_request_dto.dart';
import '../../../domain/repository/profile_repository.dart';

part 'profile_cubit.freezed.dart';

part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._profileRepository) : super(const ProfileState.initial());

  final ProfileRepository _profileRepository;

  Future<void> getProfileDetail() async {
    emit(const ProfileState.loading());

    final res = await _profileRepository.getUserProfile().run();

    res.fold(
      (xception) => emit(ProfileState.error(xception: xception)),
      (profileModel) => emit(ProfileState.success(profileModel: profileModel)),
    );
  }

  Future<void> updateUserProfile(ProfileRequestDto profileRequestDto) async {
    emit(const ProfileState.loading());
    final res =
        await _profileRepository.updateUserProfile(profileRequestDto).run();

    res.fold(
      (xception) => emit(ProfileState.error(xception: xception)),
      (profileModel) => emit(ProfileState.success(profileModel: profileModel)),
    );
  }
}
