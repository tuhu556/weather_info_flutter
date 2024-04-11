import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';
import 'package:weather_info_flutter/core/utils/mapper/data_mapper.dart';
import 'package:weather_info_flutter/features/weather_info/domain/entities/weather_remote_info_response_entity/weather_theme_entity.dart';

@Entity()
class WeatherThemeLocalEntity extends DataMapper<WeatherThemeEntity> {
  WeatherThemeLocalEntity({
    this.firstColorHex,
    this.secondColorHex,
    this.id,
  });
  int? firstColorHex;
  int? secondColorHex;
  int? id;

  @override
  WeatherThemeEntity mapToEntity() {
    return WeatherThemeEntity(
      secondColor: Color(secondColorHex ?? 0),
      firstColor: Color(firstColorHex ?? 0),
    );
  }
}
