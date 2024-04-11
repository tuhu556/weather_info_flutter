import 'package:auto_route/auto_route.dart';
import 'package:weather_info_flutter/core/utils/auto_router_setup/auto_route.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: WeatherDetailsView.page, initial: true),
        AutoRoute(
          page: AddNewCityView.page,
        )
      ];
}
