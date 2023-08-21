import 'package:envied/envied.dart';

import '../base/env.dart';
import '../constants/env_keys.dart';

part 'staging_env.g.dart';

@Envied(name: EnvKeys.stageEnv, path: EnvKeys.stageEnvPath)
class StagingEnv extends EnvVars {
  @EnviedField(varName: EnvKeys.baseUrlKey, obfuscate: true)
  String baseUrl = _StagingEnv.baseUrl;
}
