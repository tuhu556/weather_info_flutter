import 'package:equatable/equatable.dart';

class CoordinateEntity extends Equatable {
  const CoordinateEntity({
    this.lon,
    this.lat,
  });

  final double? lat;
  final double? lon;

  @override
  List<Object?> get props => <Object?>[lon, lat];
}
