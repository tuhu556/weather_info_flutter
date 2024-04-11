import 'package:objectbox/objectbox.dart';
import 'package:weather_info_flutter/core/utils/mapper/data_mapper.dart';
import 'package:weather_info_flutter/features/weather_info/domain/entities/weather_remote_info_response_entity/coordinate_entity.dart';

@Entity()
class CoordinateLocalEntity extends DataMapper<CoordinateEntity> {
  CoordinateLocalEntity({
    this.lon,
    this.lat,
    this.id,
  });

  int? id;
  double? lon;
  double? lat;

  @override
  CoordinateEntity mapToEntity() {
    return CoordinateEntity(
      lat: lat,
      lon: lon,
    );
  }
}
