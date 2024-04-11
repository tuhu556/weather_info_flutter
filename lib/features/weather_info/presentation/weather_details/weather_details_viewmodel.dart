import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:weather_info_flutter/core/basecomponents/base_view_model.dart';
import 'package:weather_info_flutter/core/commondomain/entities/based_api_result/api_result_state.dart';
import 'package:weather_info_flutter/features/weather_info/domain/entities/weather_remote_info_response_entity/weather_info_entity.dart';
import 'package:weather_info_flutter/features/weather_info/domain/usecases/get_weather_data_by_coordinates.dart';
import 'package:weather_info_flutter/features/weather_info/utils/request_models/weather_by_coordinates_request_model.dart';

@injectable
class WeatherDetailsViewModel extends BaseViewModel {
  final GetWeatherDataByCoordinates getWeatherDataByCoordinates;
  final StreamController<ApiResultState<WeatherInfoEntity?>?> _weatherResult =
      StreamController<ApiResultState<WeatherInfoEntity?>?>.broadcast();

  WeatherDetailsViewModel({required this.getWeatherDataByCoordinates});

  StreamController<ApiResultState<WeatherInfoEntity?>?> get weatherResult =>
      _weatherResult;
  Future<void> getWeatherByCoordinates(
      {WeatherByCoordinatesRequestModel?
          weatherByCoordinatesRequestModel}) async {
    final ApiResultState<WeatherInfoEntity?>? result =
        await executeParamsUseCase(
            useCase: getWeatherDataByCoordinates,
            query: weatherByCoordinatesRequestModel);
    _weatherResult.add(result);
  }

  @override
  void onDispose() {
    super.onDispose();
    _weatherResult.close();
  }
}
