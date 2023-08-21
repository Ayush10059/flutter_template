import 'package:envied/envied.dart';

import '../base/env.dart';
import '../constants/env_keys.dart';

part 'production_env.g.dart';

@Envied(name: EnvKeys.prodEnv, path: EnvKeys.prodEnvPath)
class ProductionEnv extends EnvVars {
  @EnviedField(varName: EnvKeys.baseUrlKey, obfuscate: true)
  String baseUrl = _ProductionEnv.baseUrl;
}
