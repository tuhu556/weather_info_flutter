import 'package:injectable/injectable.dart';
import 'package:weather_info_flutter/features/weather_info/data/datasources/local_datasource/local_database.dart';

@module
abstract class AppModule {
  @preResolve
  Future<AppLocalDatabase> get preft => AppLocalDatabase.create();
}
