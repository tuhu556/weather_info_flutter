// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:weather_info_flutter/core/utils/helpers/app_configurations_helper/app_configurations_helper.dart'
    as _i6;
import 'package:weather_info_flutter/core/utils/helpers/app_flavor_helper/app_flavors_helper.dart'
    as _i5;
import 'package:weather_info_flutter/core/utils/helpers/connectivity_helper/connectivity_checker_helper.dart'
    as _i3;
import 'package:weather_info_flutter/core/utils/helpers/http_strategy_helper/http_request_context.dart'
    as _i7;
import 'package:weather_info_flutter/core/utils/helpers/responsive_ui_helper/responsive_config.dart'
    as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.ConnectivityCheckerHelper>(
        () => _i3.ConnectivityCheckerHelper());
    gh.singleton<_i4.ResponsiveUiConfig>(() => _i4.ResponsiveUiConfig());
    gh.singleton<_i5.AppFlavorsHelper>(() => _i5.AppFlavorsHelper());
    gh.singleton<_i6.AppConfigurations>(() => _i6.AppConfigurations());
    gh.factory<_i7.HttpRequestContext>(
        () => _i7.HttpRequestContext(gh<_i3.ConnectivityCheckerHelper>()));
    return this;
  }
}
