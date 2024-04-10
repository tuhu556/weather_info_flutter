import 'package:json_annotation/json_annotation.dart';
import 'package:weather_info_flutter/core/utils/helpers/extension_functions/extension_function.dart';
import 'package:weather_info_flutter/core/utils/mapper/data_mapper.dart';
import 'package:weather_info_flutter/features/weather_info/domain/weather_remote_info_response_entity/wind_info_entity.dart';

part 'wind_info_response_model.g.dart';

@JsonSerializable()
class WindInfoResponseModel extends DataMapper<WindInfoEntity> {
  WindInfoResponseModel({this.speed, this.deg});

  factory WindInfoResponseModel.fromJson(Map<String, dynamic> json) =>
      _$WindInfoResponseModelFromJson(json);

  final double? speed;
  final int? deg;

  @override
  WindInfoEntity mapToEntity() {
    return WindInfoEntity(
      speed: speed?.toWindSpeed(),
      deg: deg ?? 0,
    );
  }
}
