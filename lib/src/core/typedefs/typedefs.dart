import 'package:fpdart/fpdart.dart';

import '../exceptions/xception.dart';

typedef EitherXception<T> = TaskEither<Xception, T>;
