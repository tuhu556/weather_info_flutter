import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_info_flutter/core/commondomain/entities/based_api_result/api_result_model.dart';
import 'package:weather_info_flutter/core/commondomain/entities/based_api_result/api_result_state.dart';
import 'package:weather_info_flutter/core/commondomain/entities/based_api_result/error_result_model.dart';
import 'package:weather_info_flutter/core/commondomain/usecases/base_params_usecase.dart';

class BaseViewModel extends ChangeNotifier {
  final StreamController<bool> _toggleLoading =
      StreamController<bool>.broadcast();

  StreamController<bool> get toggleLoading => _toggleLoading;

  Future<ApiResultState<Type>?> executeParamsUseCase<Type, Params>(
      {required BaseParamsUseCase<Type, Params> useCase,
      Params? query,
      bool launchLoader = true}) async {
    showLoadingIndicator(launchLoader);
    final ApiResultModel<Type> apiResult = await useCase(query);
    return apiResult.when(
      success: (Type data) {
        showLoadingIndicator(launchLoader);
        return ApiResultState<Type>.data(data: data);
      },
      failure: (ErrorResultModel errorResultEntity) {
        showLoadingIndicator(launchLoader);
        return ApiResultState<Type>.error(
          errorResultModel: ErrorResultModel(
              message: errorResultEntity.message,
              statusCode: errorResultEntity.statusCode),
        );
      },
    );
  }

  void showLoadingIndicator(bool show) {
    _toggleLoading.add(show);
  }

  void onDispose() {}

  @override
  void dispose() {
    _toggleLoading.close();
    onDispose();
    super.dispose();
  }
}
