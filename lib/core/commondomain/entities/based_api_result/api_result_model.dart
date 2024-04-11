import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_info_flutter/core/commondomain/entities/based_api_result/error_result_model.dart';
part 'api_result_model.freezed.dart';

@freezed
class ApiResultModel<T> with _$ApiResultModel<T> {
  const factory ApiResultModel.success({required T data}) = Success<T>;

  const factory ApiResultModel.failure(
      {required ErrorResultModel errorResultEntity}) = Failure<T>;
}
