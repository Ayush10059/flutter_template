import 'package:ferry/ferry.dart';
import 'package:calendar/src/core/base/base_remote_source.dart';
import 'package:injectable/injectable.dart';

import '../models/login_model/login_model.dart';
import '../models/login_request_dto/login_request_dto.dart';
import '../models/user_model/user_model.dart';

abstract class AuthRemoteSource {
  Future<LoginModel> login(LoginRequestDto loginRequestDto);
}

@LazySingleton(as: AuthRemoteSource)
class AuthRemoteSourceImpl extends BaseRemoteSource
    implements AuthRemoteSource {
  AuthRemoteSourceImpl(Client super.client);

  @override
  Future<LoginModel> login(LoginRequestDto loginRequestDto) async {
    /// TODO: Mock User
    UserModel user = UserModel(
      id: '1',
      email: loginRequestDto.email,
      firstName: 'Bob',
      lastName: 'Mockman',
      address: ' Mock Lane, Mock City, Mockland',
      phoneNumber: '9849807666',
    );
    return LoginModel(accessToken: 'at', refreshToken: 'rt', userModel: user);
  }
}
