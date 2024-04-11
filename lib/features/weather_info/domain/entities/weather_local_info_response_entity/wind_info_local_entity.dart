import 'package:objectbox/objectbox.dart';
import 'package:weather_info_flutter/core/utils/mapper/data_mapper.dart';
import 'package:weather_info_flutter/features/weather_info/domain/entities/weather_remote_info_response_entity/wind_info_entity.dart';

@Entity()
class WindInfoLocalEntity extends DataMapper<WindInfoEntity> {
  WindInfoLocalEntity({
    this.speed,
    this.deg,
    this.id,
  });

  int? id;
  String? speed;
  int? deg;

  @override
  WindInfoEntity mapToEntity() {
    return WindInfoEntity(
      deg: deg,
      speed: speed,
    );
  }
}
