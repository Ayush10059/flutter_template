import 'package:injectable/injectable.dart';
import 'package:ferry/ferry.dart';

import '../../../../core/base/base_remote_source.dart';

abstract class CalendarRemoteSource {}

@LazySingleton(as: CalendarRemoteSource)
class CalendarRemoteSourceImpl extends BaseRemoteSource
    implements CalendarRemoteSource {
  CalendarRemoteSourceImpl(Client super.client);
}
