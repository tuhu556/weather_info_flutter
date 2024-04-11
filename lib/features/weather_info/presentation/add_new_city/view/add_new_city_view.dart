import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:weather_info_flutter/core/basecomponents/base_responsive_widget.dart';
import 'package:weather_info_flutter/core/basecomponents/base_view_model_view.dart';
import 'package:weather_info_flutter/core/commondomain/entities/based_api_result/api_result_state.dart';
import 'package:weather_info_flutter/core/commondomain/entities/based_api_result/error_result_model.dart';
import 'package:weather_info_flutter/core/utils/helpers/app_configurations_helper/app_configurations_helper.dart';
import 'package:weather_info_flutter/core/utils/helpers/extension_functions/extension_function.dart';
import 'package:weather_info_flutter/core/utils/helpers/responsive_ui_helper/responsive_config.dart';
import 'package:weather_info_flutter/features/weather_info/domain/entities/weather_remote_info_response_entity/weather_info_entity.dart';
import 'package:weather_info_flutter/features/weather_info/presentation/add_new_city/add_new_city_viewmodel.dart';
import 'package:weather_info_flutter/features/weather_info/presentation/add_new_city/widgets/add_new_city_box_details/add_new_city_box_details_widget.dart';
import 'package:weather_info_flutter/features/weather_info/presentation/add_new_city/widgets/add_new_city_header/add_new_city_header_widget.dart';
import 'package:weather_info_flutter/features/weather_info/presentation/add_new_city/widgets/search_city/search_city_widget.dart';
import 'package:weather_info_flutter/features/weather_info/presentation/weather_details/view/weather_details.dart';

@RoutePage()
class AddNewCityView extends StatefulWidget {
  const AddNewCityView({
    super.key,
  });

  @override
  State<AddNewCityView> createState() => _AddNewCityViewState();
}

class _AddNewCityViewState extends State<AddNewCityView> {
  final List<WeatherInfoEntity?> _citiesWeatherList = <WeatherInfoEntity?>[];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  AddNewCityViewModel? _provider;

  bool _checkItemInList() {
    bool itemFound = false;
    for (var item in _citiesWeatherList) {
      if (_controller.text.isEqual(item?.name)) {
        itemFound = true;
      }
      continue;
    }
    return itemFound;
  }

  void _listenToNewCityData() {
    _provider?.weatherResult.stream
        .listen((ApiResultState<WeatherInfoEntity?>? result) {
      result?.when(
        data: (WeatherInfoEntity? data) {
          if (!_citiesWeatherList
              .any((WeatherInfoEntity? element) => element?.id == data?.id)) {
            setState(() {
              _citiesWeatherList.add(data);
            });
          }
        },
        error: (ErrorResultModel error) {},
      );
    });
  }

  void _listenToInitialLocalData() {
    _provider?.weatherLocalResult.stream
        .listen((ApiResultState<List<WeatherInfoEntity?>?>? result) {
      result?.when(
        data: (List<WeatherInfoEntity?>? data) {
          if (data != null) {
            if (!mounted) {
              return;
            }
            setState(() {
              _citiesWeatherList.addAll(data);
            });
          }
        },
        error: (ErrorResultModel error) {},
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseResponsiveWidget(
      buildWidget: (BuildContext context, ResponsiveUiConfig responsiveUiConfig,
              AppConfigurations appConfigurations) =>
          Scaffold(
        backgroundColor: appConfigurations.appTheme.primaryColor,
        body: SafeArea(
          child: BaseViewModelView<AddNewCityViewModel>(
            onInitState: (AddNewCityViewModel provider) async {
              _provider = provider;
              _listenToInitialLocalData();
              _listenToNewCityData();
              await provider.getAllLocalWeathersData();
            },
            buildWidget: (AddNewCityViewModel provider) {
              return ListView.builder(
                itemCount: _citiesWeatherList.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  switch (index) {
                    case 0:
                      {
                        return const AddNewCityHeaderWidget();
                      }
                    default:
                      {
                        return _citiesWeatherList.isNotEmpty
                            ? AddNewCityBoxDetailsWidget(
                                onClickBox:
                                    (WeatherInfoEntity? weatherInfoEntity) {
                                  context.pushRoute(
                                    WeatherDetailsView(
                                        weatherInfoEntity:
                                            weatherInfoEntity) as PageRouteInfo,
                                  );
                                },
                                weatherInfoEntity:
                                    _citiesWeatherList[index - 1],
                              )
                            : Container();
                      }
                  }
                },
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: appConfigurations.appTheme.secondaryColor,
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return SearchCityWidget(
                  controller: _controller,
                  onTapFunction: () async {
                    if (_controller.text.isNotEmpty && !_checkItemInList()) {
                      await _provider?.getWeatherByCity(
                          cityName: _controller.text);
                    }
                  },
                );
              },
            );
          },
          child: const Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
