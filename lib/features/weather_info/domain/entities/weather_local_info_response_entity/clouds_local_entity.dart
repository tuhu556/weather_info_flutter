import 'package:objectbox/objectbox.dart';
import 'package:weather_info_flutter/core/utils/mapper/data_mapper.dart';
import 'package:weather_info_flutter/features/weather_info/domain/entities/weather_remote_info_response_entity/clouds_entity.dart';

@Entity()
class CloudsLocalEntity extends DataMapper<CloudsEntity> {
  CloudsLocalEntity({
    this.all,
    this.id,
  });

  int? all;
  int? id;

  @override
  CloudsEntity mapToEntity() {
    return CloudsEntity(
      all: all,
    );
  }
}
