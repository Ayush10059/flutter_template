abstract class EnvVars {
  String get baseUrl;
}

class Env implements EnvVars {
  Env._();

  static Env? _instance;
  late EnvVars _env;

  /// Returns an instance using the default [Env].
  static Env get instance {
    _instance ??= Env._();
    return _instance!;
  }

  void createEnv(EnvVars incomingEnv) => _env = incomingEnv;

  @override
  String get baseUrl => _env.baseUrl;
}
