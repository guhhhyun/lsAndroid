import 'package:freezed_annotation/freezed_annotation.dart';
part 'rack_ipgo_today_model.freezed.dart';
part 'rack_ipgo_today_model.g.dart';

@freezed
class RackIpgoTodayModel with _$RackIpgoTodayModel {
  factory RackIpgoTodayModel({
    Header? header,
    @Default('') String resultCode,
    @Default('') String resultMessage,
    List<dynamic>? body,
    @Default(false) bool hasError,
  }) = _RackIpgoTodayModel;

  factory RackIpgoTodayModel.fromJson(Map<String, dynamic> json) =>
      _$RackIpgoTodayModelFromJson(json);
}

@freezed
class Header with _$Header {
  factory Header({
    @Default(0) int currentPage,
    @Default(0) int pageSize,
    @Default(0) int totalRecords,
    @Default('') orders,
    @Default('') chnlCd,
  }) = _Header;

  factory Header.fromJson(Map<String, dynamic> json) => _$HeaderFromJson(json);
}

@freezed
class BodyData with _$BodyData {
  factory BodyData({
    @Default(false) bool resultValue,
    @Default(0) int resultRowCount,
    @Default('') String resultCode,
    @Default('') String resultMessage,
    @Default('') String errorState,
    @Default('') String errorProcedure,
    @Default('') String returnMessage,
  }) = _BodyData;

  factory BodyData.fromJson(Map<String, dynamic> json) => _$BodyDataFromJson(json);
}

@freezed
class ItemData with _$ItemData {
  factory ItemData({
    @Default('') String qtyUnit,
    @Default('') String qty,
    @Default('') String itemNm,
    @Default('') String locCd,
    @Default('') String itemCd,
    @Default('') String updDttm,
  }) = _ItemData;

  factory ItemData.fromJson(Map<String, dynamic> json) => _$ItemDataFromJson(json);
}