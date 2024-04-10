import 'package:json_annotation/json_annotation.dart';
import 'package:weather_info_flutter/core/utils/mapper/data_mapper.dart';
import 'package:weather_info_flutter/features/weather_info/domain/weather_remote_info_response_entity/clouds_entity.dart';
part 'clouds_response_model.g.dart';

@JsonSerializable()
class CloudsResponseModel extends DataMapper<CloudsEntity> {
  CloudsResponseModel({this.all});

  factory CloudsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CloudsResponseModelFromJson(json);

  final int? all;

  @override
  CloudsEntity mapToEntity() {
    return CloudsEntity(all: all ?? 0);
  }
}
