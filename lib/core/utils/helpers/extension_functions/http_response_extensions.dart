import 'package:http/http.dart' as http;
import 'package:weather_info_flutter/core/commondomain/entitties/based_api_result/api_result_model.dart';
import 'package:weather_info_flutter/core/commondomain/entitties/based_api_result/error_result_model.dart';

extension ExtensionOnHttpResponse on http.Response {
  ApiResultModel<http.Response> performHttpRequest() {
    if (statusCode >= 200 && statusCode < 300) {
      return ApiResultModel<http.Response>.success(data: this);
    } else {
      return ApiResultModel<http.Response>.failure(
          errorResultEntity: ErrorResultModel(
        message: reasonPhrase,
        statusCode: statusCode,
      ));
    }
  }
}
