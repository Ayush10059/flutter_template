/*
 * Copyright (c) 2022.
 * Author: Kishor Mainali
 * Company: EB Pearls
 */

import 'package:ferry/ferry.dart';
import 'package:calendar/src/core/base/base_remote_source.dart';
import 'package:injectable/injectable.dart';

abstract class DashboardRemoteSource {}

@LazySingleton(as: DashboardRemoteSource)
class DashboardRemoteSourceImpl extends BaseRemoteSource
    implements DashboardRemoteSource {
  DashboardRemoteSourceImpl(Client super.client);
}
