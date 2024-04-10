import 'package:weather_info_flutter/core/di/app_component/app_component.dart';
import 'package:weather_info_flutter/core/utils/helpers/responsive_ui_helper/responsive_config.dart';

extension ExtensionsOnNum on num {
  static final ResponsiveUiConfig _responsiveUiConfig =
      locator<ResponsiveUiConfig>();

  double get w => _responsiveUiConfig.setWidth(this);
  double get h => _responsiveUiConfig.setHeight(this);
}
