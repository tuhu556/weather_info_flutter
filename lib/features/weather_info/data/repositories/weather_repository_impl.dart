import 'package:injectable/injectable.dart';
import 'package:weather_info_flutter/core/commondomain/entities/based_api_result/api_result_model.dart';
import 'package:weather_info_flutter/core/commondomain/entities/based_api_result/error_result_model.dart';
import 'package:weather_info_flutter/core/utils/helpers/custom_exeptions/custom_connection_exception.dart';
import 'package:weather_info_flutter/features/weather_info/data/datasources/local_datasource/weather_local_datasource.dart';
import 'package:weather_info_flutter/features/weather_info/data/datasources/remote_datasource/weather_remote_datasource.dart';
import 'package:weather_info_flutter/features/weather_info/data/models/weather_info_remote_response_model/weather_info_response_model.dart';
import 'package:weather_info_flutter/features/weather_info/domain/entities/weather_remote_info_response_entity/weather_info_entity.dart';
import 'package:weather_info_flutter/features/weather_info/domain/repositories/weather_repository.dart';
import 'package:weather_info_flutter/features/weather_info/utils/request_models/weather_by_coordinates_request_model.dart';

@Injectable(as: WeatherRepository)
class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  final WeatherRemoteDataSource remoteDataSource;

  final WeatherLocalDataSource localDataSource;

  @override
  Future<ApiResultModel<WeatherInfoEntity?>> getWeatherDataByCity(
      {String? cityName}) async {
    try {
      final ApiResultModel<WeatherInfoResponseModel?> result =
          await remoteDataSource.getWeatherDataByCity(cityName: cityName);
      return result.when(
        success: (WeatherInfoResponseModel? weatherInfoResponseModel) async {
          if (weatherInfoResponseModel != null) {
            _cacheLocalData(weatherInfoResponseModel);
          }
          return ApiResultModel<WeatherInfoEntity?>.success(
            data: weatherInfoResponseModel?.mapToEntity(),
          );
        },
        failure: (ErrorResultModel errorResultModel) {
          return ApiResultModel<WeatherInfoEntity>.failure(
            errorResultEntity: errorResultModel,
          );
        },
      );
    } on CustomConnectionException catch (_) {
      final ApiResultModel<WeatherInfoEntity?> result0 =
          await _getLastLocalWeatherInfo();
      return result0;
    }
  }

  Future<ApiResultModel<WeatherInfoEntity?>> _getLastLocalWeatherInfo() async {
    final WeatherInfoEntity? localResult =
        await localDataSource.getLastWeatherInfo();
    return ApiResultModel<WeatherInfoEntity?>.success(
      data: localResult,
    );
  }

  @override
  Future<ApiResultModel<WeatherInfoEntity?>> getWeatherDataByCoordinates(
      {WeatherByCoordinatesRequestModel?
          weatherByCoordinatesRequestModel}) async {
    try {
      final ApiResultModel<WeatherInfoResponseModel?> result =
          await remoteDataSource.getWeatherDataByCoordinates(
              weatherByCoordinatesRequestModel:
                  weatherByCoordinatesRequestModel);
      return result.when(
        success: (WeatherInfoResponseModel? weatherInfoResponseModel) async {
          if (weatherInfoResponseModel != null) {
            _cacheLocalData(weatherInfoResponseModel);
          }
          return ApiResultModel<WeatherInfoEntity?>.success(
            data: weatherInfoResponseModel?.mapToEntity(),
          );
        },
        failure: (ErrorResultModel errorResultModel) {
          return ApiResultModel<WeatherInfoEntity>.failure(
            errorResultEntity: errorResultModel,
          );
        },
      );
    } on CustomConnectionException catch (_) {
      final ApiResultModel<WeatherInfoEntity?> result0 =
          await _getLastLocalWeatherInfo();
      return result0;
    }
  }

  void _cacheLocalData(WeatherInfoResponseModel? weatherData) {
    localDataSource.cacheWeatherInfo(weatherData);
  }

  @override
  Future<ApiResultModel<List<WeatherInfoEntity?>?>>
      getAllLocalWeathers() async {
    final List<WeatherInfoEntity?>? result =
        await localDataSource.getAllLocalWeathers();
    return ApiResultModel<List<WeatherInfoEntity?>?>.success(
      data: result,
    );
  }
}
