import 'package:injectable/injectable.dart';
import 'package:weather_info_flutter/core/commondomain/entities/based_api_result/api_result_model.dart';
import 'package:weather_info_flutter/core/commondomain/usecases/base_params_usecase.dart';
import 'package:weather_info_flutter/features/weather_info/domain/entities/weather_remote_info_response_entity/weather_info_entity.dart';
import 'package:weather_info_flutter/features/weather_info/domain/repositories/weather_repository.dart';
import 'package:weather_info_flutter/features/weather_info/utils/request_models/weather_by_coordinates_request_model.dart';

@injectable
class GetWeatherDataByCoordinates
    implements
        BaseParamsUseCase<WeatherInfoEntity?,
            WeatherByCoordinatesRequestModel> {
  GetWeatherDataByCoordinates(this.weatherRepository);

  final WeatherRepository weatherRepository;

  @override
  Future<ApiResultModel<WeatherInfoEntity?>> call(
      WeatherByCoordinatesRequestModel? weatherByCoordinatesRequestModel) {
    return weatherRepository.getWeatherDataByCoordinates(
        weatherByCoordinatesRequestModel: weatherByCoordinatesRequestModel);
  }
}
