import 'package:fpdart/fpdart.dart';

import '../errors/app_error.dart';

typedef EitherResponse<T> = Future<Either<AppError, T>>;
