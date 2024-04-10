import 'package:json_annotation/json_annotation.dart';
import 'package:weather_info_flutter/core/utils/helpers/extension_functions/date_extension_functions.dart';
import 'package:weather_info_flutter/core/utils/mapper/data_mapper.dart';
import 'package:weather_info_flutter/features/weather_info/domain/weather_remote_info_response_entity/sunset_sunrise_entity.dart';
part 'sunset_sunrise_response_model.g.dart';

@JsonSerializable()
class SunsetSunriseResponseModel extends DataMapper<SunsetSunriseEntity> {
  SunsetSunriseResponseModel(
      {this.type, this.id, this.country, this.sunrise, this.sunset});
  factory SunsetSunriseResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SunsetSunriseResponseModelFromJson(json);

  final int? type;
  final int? id;
  final String? country;
  final int? sunrise;
  final int? sunset;

  @override
  SunsetSunriseEntity mapToEntity() {
    return SunsetSunriseEntity(
        sunrise: sunrise?.fromTimestampToTime(),
        type: type ?? 0,
        id: id ?? 0,
        country: country ?? '',
        sunset: sunset.fromTimestampToTime());
  }
}
