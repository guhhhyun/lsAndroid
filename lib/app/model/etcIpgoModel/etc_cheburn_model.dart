import 'package:freezed_annotation/freezed_annotation.dart';

part 'etc_cheburn_model.freezed.dart';
part 'etc_cheburn_model.g.dart';

@freezed
class EtcCheburnModel with _$EtcCheburnModel {
  const factory EtcCheburnModel({
    Header? header,
    @Default('') String resultCode,
    @Default('') String resultMessage,
    List<dynamic>? body,
    @Default(false) bool hasError,
  }) = _EtcCheburnModel;

  factory EtcCheburnModel.fromJson(Map<String, dynamic> json) =>
      _$EtcCheburnModelFromJson(json);
}

@freezed
class Header with _$Header {
  const factory Header({
    @Default(0) int currentPage,
    @Default(0) int pageSize,
    @Default(0) int totalRecords,
    List<dynamic>? orders,
    @Default('') String chnlCd,
  }) = _Header;

  factory Header.fromJson(Map<String, dynamic> json) => _$HeaderFromJson(json);
}

@freezed
class BodyItem with _$BodyItem {
  const factory BodyItem({
    @Default(false) bool resultValue,
    @Default(0) int resultRowCount,
    @Default('') String resultCode,
    @Default('') String resultMessage,
    @Default('') String errorState,
    @Default('') String errorProcedure,
    @Default('') String returnMessage,
  }) = _BodyItem;

  factory BodyItem.fromJson(Map<String, dynamic> json) =>
      _$BodyItemFromJson(json);
}

@freezed
class DataItem with _$DataItem {
  const factory DataItem({
    @JsonKey(name: '') required String value,

  }) = _DataItem;

  factory DataItem.fromJson(Map<String, dynamic> json) =>
      _$DataItemFromJson(json);
}
