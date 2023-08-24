import 'package:calendar/src/core/typedefs/typedefs.dart';

import '../../data/models/login_request_dto/login_request_dto.dart';

abstract class AuthRepository {
  Stream<bool> get isLoggedIn;

  EitherXeption<String> login(LoginRequestDto loginRequestDto);
}
