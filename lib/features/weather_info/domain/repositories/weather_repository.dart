import 'package:weather_info_flutter/core/commondomain/entities/based_api_result/api_result_model.dart';
import 'package:weather_info_flutter/features/weather_info/domain/entities/weather_remote_info_response_entity/weather_info_entity.dart';
import 'package:weather_info_flutter/features/weather_info/utils/request_models/weather_by_coordinates_request_model.dart';

abstract class WeatherRepository {
  Future<ApiResultModel<WeatherInfoEntity?>> getWeatherDataByCoordinates(
      {WeatherByCoordinatesRequestModel? weatherByCoordinatesRequestModel});

  Future<ApiResultModel<WeatherInfoEntity?>> getWeatherDataByCity(
      {String? cityName});

  Future<ApiResultModel<List<WeatherInfoEntity?>?>> getAllLocalWeathers();
}
