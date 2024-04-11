import 'package:weather_info_flutter/core/commondomain/entities/based_api_result/api_result_model.dart';
import 'package:weather_info_flutter/features/weather_info/data/models/weather_info_remote_response_model/weather_info_response_model.dart';
import 'package:weather_info_flutter/features/weather_info/utils/request_models/weather_by_coordinates_request_model.dart';

abstract class WeatherRemoteDataSource {
  Future<ApiResultModel<WeatherInfoResponseModel?>> getWeatherDataByCoordinates(
      {WeatherByCoordinatesRequestModel? weatherByCoordinatesRequestModel});

  Future<ApiResultModel<WeatherInfoResponseModel?>> getWeatherDataByCity(
      {String? cityName});
}
