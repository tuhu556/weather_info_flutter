import 'package:flutter/material.dart';
import 'package:weather_info_flutter/core/basecomponents/base_responsive_widget.dart';
import 'package:weather_info_flutter/core/utils/helpers/app_configurations_helper/app_configurations_helper.dart';
import 'package:weather_info_flutter/core/utils/helpers/extension_functions/size_extension.dart';
import 'package:weather_info_flutter/core/utils/helpers/responsive_ui_helper/responsive_config.dart';
import 'package:weather_info_flutter/core/utils/values/styles.dart';

class AddNewCityHeaderWidget extends StatelessWidget {
  const AddNewCityHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseResponsiveWidget(
      buildWidget: (BuildContext context, ResponsiveUiConfig responsiveUiConfig,
              AppConfigurations appConfigurations) =>
          Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: appConfigurations.appTheme.primaryColor,
            ),
          ),
          Text(
            'Manage cities',
            style: poppinsMedium.copyWith(
              color: appConfigurations.appTheme.primaryColor,
              fontSize: 20.w,
            ),
          ),
        ],
      ),
    );
  }
}
