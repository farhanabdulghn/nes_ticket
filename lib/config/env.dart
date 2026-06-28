import 'package:nes_ticket/config/base_config.dart';
import 'package:nes_ticket/config/dev_config.dart';
import 'package:nes_ticket/config/prod_config.dart';
import 'package:nes_ticket/config/staging_config.dart';

class Environment {
  Environment._internal();

  static final Environment instance = Environment._internal();

  static const String dev = 'dev';
  static const String staging = 'staging';
  static const String prod = 'prod';

  static late BaseConfig config;

  static void initConfig(String environment) {
    config = _getConfig(environment);
  }

  static BaseConfig _getConfig(String environment) {
    switch (environment) {
      case prod:
        return ProdConfig();
      case staging:
        return StagingConfig();
      default:
        return DevConfig();
    }
  }
}
