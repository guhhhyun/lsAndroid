import 'package:freezed_annotation/freezed_annotation.dart';

part 'etc_ipgo_model.freezed.dart';
part 'etc_ipgo_model.g.dart';

@freezed
class EtcIpgoModel with _$EtcIpgoModel {
  const factory EtcIpgoModel({
    Header? header,
    @Default('') String resultCode,
    @Default('') String resultMessage,
    List<dynamic>? body,
    @Default(false) bool hasError,
  }) = _EtcIpgoModel;

  factory EtcIpgoModel.fromJson(Map<String, dynamic> json) =>
      _$EtcIpgoModelFromJson(json);
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
    @Default(0) int zoneNmRowspan,
    @Default('') String inbNo,
    @Default('') String pjtNm,
    @Default('') String grpKey,
    @Default('') String whNm,
    @Default('') String remark,
    @Default(0) int tagTypeNmRowspan,
    @Default('') String itemNm,
    @Default(0) int selectedRowspan,
    @Default('') String usrNm,
    @Default(0) int vendNmRowspan,
    @Default('') String vendNm,
    @Default(0) int prtDtRowspan,
    @Default(0) int tagSeq,
    @Default(0) int pjtNmRowspan,
    @Default(0) int selected,
    @Default(0) int whNmRowspan,
    @Default(0) int inbNoRowspan,
    @Default(0) int remarkRowspan,
    @Default('') String locCd,
    @Default('') String tagNo,
    String? itemCd,
    @Default(0) int locCdRowspan,
    @Default(0) int tagNoRowspan,
    @Default('') String zoneNm,
    @Default('') String inbDt,
    int? setQty,
    @Default(0) int usrNmRowspan,
    @Default(0) int inbDtRowspan,
    @Default(0.0) double qty,
    @Default('') String tagTypeNm,
    @Default('') String qtyUnit,
    @Default('') String prtDt,
  }) = _DataItem;

  factory DataItem.fromJson(Map<String, dynamic> json) =>
      _$DataItemFromJson(json);
}
