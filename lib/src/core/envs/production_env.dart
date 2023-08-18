import '../base/env.dart';

class ProductionEnv extends EnvVars {
  @override
  String get baseUrl => '';

  @override
  String get graphqlEndPoint => '/graphql';
}
