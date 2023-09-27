import 'package:injectable/injectable.dart';
import 'package:ferry/ferry.dart';
import 'package:calendar/src/core/base/base_remote_source.dart';

abstract class ProfileRemoteSource {}

@LazySingleton(as: ProfileRemoteSource)
class ProfileRemoteSourceImpl extends BaseRemoteSource
    implements ProfileRemoteSource {
  ProfileRemoteSourceImpl(Client super.client);
}
