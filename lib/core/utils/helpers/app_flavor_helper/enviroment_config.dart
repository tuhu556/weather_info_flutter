import 'package:weather_info_flutter/core/utils/constans/app_constants.dart';

class EnvironmentConfig {
  static const String BUILD_VARIANT = String.fromEnvironment('BUILD_VARIANT',
      defaultValue: devEnvironmentString);
}
