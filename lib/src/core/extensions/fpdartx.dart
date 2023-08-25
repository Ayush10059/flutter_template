import 'package:fpdart/fpdart.dart';

extension EitherX<L extends Object, R> on Either<L, R> {
  R unwrap() => fold((l) => throw l, (r) => r);
}

extension TaskEitherX<L extends Object, R> on TaskEither<L, R> {
  Future<R> runUnwrapped() => run().then((value) => value.unwrap());
}
