import 'package:calendar/src/core/base/base_repository.dart';
import 'package:calendar/src/features/dashboard/domain/repository/dashboard_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: DashboardRepository)
class DashboardRepositoryImpl extends BaseRepository
    implements DashboardRepository {}
