import 'package:weather_info_flutter/core/commondomain/entitties/based_api_result/error_result_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_result_state.freezed.dart';

@freezed
class ApiResultState<T> with _$ApiResultState<T> {
  const factory ApiResultState.data({required T data}) = Data<T>;

  const factory ApiResultState.error(
      {required ErrorResultModel errorResultModel}) = Error<T>;
}
