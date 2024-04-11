import 'package:json_annotation/json_annotation.dart';
import 'package:weather_info_flutter/core/utils/mapper/data_mapper.dart';
import 'package:weather_info_flutter/features/weather_info/domain/entities/weather_remote_info_response_entity/coordinate_entity.dart';

part 'coordinate_response_model.g.dart';

@JsonSerializable()
class CoordinateResponseModel extends DataMapper<CoordinateEntity> {
  CoordinateResponseModel({
    this.lon,
    this.lat,
  });
  factory CoordinateResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CoordinateResponseModelFromJson(json);

  final double? lon;
  final double? lat;

  @override
  CoordinateEntity mapToEntity() {
    return CoordinateEntity(lat: lat ?? 0.0, lon: lon ?? 0.0);
  }
}
