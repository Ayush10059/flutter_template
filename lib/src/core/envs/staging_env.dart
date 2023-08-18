import '../base/env.dart';

class StagingEnv extends EnvVars {
  @override
  String get baseUrl => '';

  @override
  String get graphqlEndPoint => '/graphql';
}
