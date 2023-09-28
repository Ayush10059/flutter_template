import 'package:ferry/ferry.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/base/base_remote_source.dart';

abstract class ProfileRemoteSource {}

@LazySingleton(as: ProfileRemoteSource)
class ProfileRemoteSourceImpl extends BaseRemoteSource
    implements ProfileRemoteSource {
  ProfileRemoteSourceImpl(Client super.client);
}
