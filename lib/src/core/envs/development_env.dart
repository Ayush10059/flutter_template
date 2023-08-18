import '../base/env.dart';

class DevelopmentEnv extends EnvVars {
  @override
  String get baseUrl => '';

  @override
  String get graphqlEndPoint => '/graphql';
}
