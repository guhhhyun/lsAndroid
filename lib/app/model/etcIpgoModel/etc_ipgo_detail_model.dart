import 'package:freezed_annotation/freezed_annotation.dart';

part 'etc_ipgo_detail_model.freezed.dart';
part 'etc_ipgo_detail_model.g.dart';

@freezed
class EtcIpgoDetailModel with _$EtcIpgoDetailModel {
  const factory EtcIpgoDetailModel({
    Header? header,
    @Default('') String resultCode,
    @Default('') String resultMessage,
    List<dynamic>? body,
    @Default(false) bool hasError,
  }) = _EtcIpgoDetailModel;

  factory EtcIpgoDetailModel.fromJson(Map<String, dynamic> json) =>
      _$EtcIpgoDetailModelFromJson(json);
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
  @Default('') String pjtNm,
  @Default(0) int inbSeq,
  @Default(0) int tagTypeNmRowspan,
  @Default('') String tagNo,
  @Default('') String itemCd,
  @Default('') String itemNm,
  @Default(0) int tagNoRowspan,
  @Default(0) int setQty,
  @Default(0) int qty,
  @Default('') String tagTypeNm,
  @Default('') String qtyUnit,
  @Default('') String vendNm,
  @Default(0) int tagSeq,
  @Default('') String prtDt,
  @Default('') String INB_NO,

  }) = _DataItem;

  factory DataItem.fromJson(Map<String, dynamic> json) =>
      _$DataItemFromJson(json);
}
