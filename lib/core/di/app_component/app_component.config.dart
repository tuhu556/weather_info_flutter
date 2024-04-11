// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:weather_info_flutter/core/di/app_component/app_module.dart'
    as _i20;
import 'package:weather_info_flutter/core/utils/helpers/app_configurations_helper/app_configurations_helper.dart'
    as _i7;
import 'package:weather_info_flutter/core/utils/helpers/app_flavor_helper/app_flavors_helper.dart'
    as _i6;
import 'package:weather_info_flutter/core/utils/helpers/connectivity_helper/connectivity_checker_helper.dart'
    as _i4;
import 'package:weather_info_flutter/core/utils/helpers/http_strategy_helper/http_request_context.dart'
    as _i8;
import 'package:weather_info_flutter/core/utils/helpers/responsive_ui_helper/responsive_config.dart'
    as _i5;
import 'package:weather_info_flutter/features/weather_info/data/datasources/local_datasource/local_database.dart'
    as _i3;
import 'package:weather_info_flutter/features/weather_info/data/datasources/local_datasource/weather_local_datasource.dart'
    as _i11;
import 'package:weather_info_flutter/features/weather_info/data/datasources/local_datasource/weather_local_datasource_impl.dart'
    as _i12;
import 'package:weather_info_flutter/features/weather_info/data/datasources/remote_datasource/weather_remote_datasource.dart'
    as _i9;
import 'package:weather_info_flutter/features/weather_info/data/datasources/remote_datasource/weather_remote_datasource_impl.dart'
    as _i10;
import 'package:weather_info_flutter/features/weather_info/data/repositories/weather_repository_impl.dart'
    as _i14;
import 'package:weather_info_flutter/features/weather_info/domain/repositories/weather_repository.dart'
    as _i13;
import 'package:weather_info_flutter/features/weather_info/domain/usecases/get_all_local_weathers.dart'
    as _i17;
import 'package:weather_info_flutter/features/weather_info/domain/usecases/get_weather_data_by_city.dart'
    as _i16;
import 'package:weather_info_flutter/features/weather_info/domain/usecases/get_weather_data_by_coordinates.dart'
    as _i15;
import 'package:weather_info_flutter/features/weather_info/presentation/add_new_city/add_new_city_viewmodel.dart'
    as _i19;
import 'package:weather_info_flutter/features/weather_info/presentation/weather_details/weather_details_viewmodel.dart'
    as _i18;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    await gh.factoryAsync<_i3.AppLocalDatabase>(
      () => appModule.preft,
      preResolve: true,
    );
    gh.factory<_i4.ConnectivityCheckerHelper>(
        () => _i4.ConnectivityCheckerHelper());
    gh.singleton<_i5.ResponsiveUiConfig>(() => _i5.ResponsiveUiConfig());
    gh.singleton<_i6.AppFlavorsHelper>(() => _i6.AppFlavorsHelper());
    gh.singleton<_i7.AppConfigurations>(() => _i7.AppConfigurations());
    gh.factory<_i8.HttpRequestContext>(
        () => _i8.HttpRequestContext(gh<_i4.ConnectivityCheckerHelper>()));
    gh.factory<_i9.WeatherRemoteDataSource>(
        () => _i10.WeatherRemoteDataSourceImpl(gh<_i8.HttpRequestContext>()));
    gh.factory<_i11.WeatherLocalDataSource>(
        () => _i12.WeatherRemoteDataSourceImpl(gh<_i3.AppLocalDatabase>()));
    gh.factory<_i13.WeatherRepository>(() => _i14.WeatherRepositoryImpl(
          remoteDataSource: gh<_i9.WeatherRemoteDataSource>(),
          localDataSource: gh<_i11.WeatherLocalDataSource>(),
        ));
    gh.factory<_i15.GetWeatherDataByCoordinates>(
        () => _i15.GetWeatherDataByCoordinates(gh<_i13.WeatherRepository>()));
    gh.factory<_i16.GetWeatherDataByCity>(
        () => _i16.GetWeatherDataByCity(gh<_i13.WeatherRepository>()));
    gh.factory<_i17.GetAllLocalWeathers>(
        () => _i17.GetAllLocalWeathers(gh<_i13.WeatherRepository>()));
    gh.factory<_i18.WeatherDetailsViewModel>(() => _i18.WeatherDetailsViewModel(
        getWeatherDataByCoordinates: gh<_i15.GetWeatherDataByCoordinates>()));
    gh.factory<_i19.AddNewCityViewModel>(() => _i19.AddNewCityViewModel(
          gh<_i16.GetWeatherDataByCity>(),
          gh<_i17.GetAllLocalWeathers>(),
        ));
    return this;
  }
}

class _$AppModule extends _i20.AppModule {}
