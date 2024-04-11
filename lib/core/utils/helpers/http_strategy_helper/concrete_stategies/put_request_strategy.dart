import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_info_flutter/core/commondomain/entities/based_api_result/api_result_model.dart';
import 'package:weather_info_flutter/core/utils/constans/app_constants.dart';
import 'package:weather_info_flutter/core/utils/helpers/extension_functions/http_response_extensions.dart';
import 'package:weather_info_flutter/core/utils/helpers/http_strategy_helper/http_request_strategy.dart';

class PutRequestStrategy implements HttpRequestStrategy {
  @override
  Future<ApiResultModel<http.Response>> executeRequest(
      {required String uri,
      Map<String, String> headers = const <String, String>{},
      Map<String, dynamic> requestData = const <String, dynamic>{}}) async {
    final String encodedJson = json.encode(requestData);
    final http.Response response = await http
        .put(Uri.parse(uri), headers: headers, body: encodedJson)
        .timeout(timeOutDuration);

    return response.performHttpRequest();
  }
}
