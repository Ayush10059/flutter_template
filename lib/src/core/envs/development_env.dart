import 'package:envied/envied.dart';

import '../base/env.dart';
import '../constants/env_keys.dart';

part 'development_env.g.dart';

@Envied(name: EnvKeys.devEnv, path: EnvKeys.devEnvPath)
class DevelopmentEnv extends EnvVars {
  @EnviedField(varName: EnvKeys.baseUrlKey, obfuscate: true)
  String baseUrl = _DevelopmentEnv.baseUrl;
}
