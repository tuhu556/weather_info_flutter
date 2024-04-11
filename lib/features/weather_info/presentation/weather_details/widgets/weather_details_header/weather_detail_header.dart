import 'package:flutter/material.dart';
import 'package:weather_info_flutter/core/di/app_component/app_component.dart';
import 'package:weather_info_flutter/core/utils/helpers/app_configurations_helper/app_configurations_helper.dart';
import 'package:weather_info_flutter/core/utils/helpers/extension_functions/size_extension.dart';
import 'package:weather_info_flutter/core/utils/values/styles.dart';

class WeatherDetailsHeader extends StatelessWidget {
  const WeatherDetailsHeader({
    super.key,
    this.locationName,
    this.date,
  });
  final String? locationName;
  final String? date;

  @override
  Widget build(BuildContext context) {
    final AppConfigurations appConfigurations = locator<AppConfigurations>();
    return Padding(
      padding: EdgeInsets.only(
        top: 50.w,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            locationName ?? '',
            style: poppinsBold.copyWith(
              color: appConfigurations.appTheme.primaryColor,
              fontSize: 22.w,
            ),
          ),
          Text(
            date ?? '',
            style: poppinsRegular.copyWith(
              color: appConfigurations.appTheme.primaryColor,
              fontSize: 20.w,
            ),
          ),
        ],
      ),
    );
  }
}
