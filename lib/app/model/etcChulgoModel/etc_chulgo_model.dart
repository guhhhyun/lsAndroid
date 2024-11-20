import 'package:freezed_annotation/freezed_annotation.dart';

part 'etc_chulgo_model.freezed.dart';
part 'etc_chulgo_model.g.dart';

@freezed
class EtcChulgoModel with _$EtcChulgoModel {
  const factory EtcChulgoModel({
     Header? header,
    @Default('') String resultCode,
    @Default('') String resultMessage,
     List<dynamic>? body,
  }) = _EtcChulgoModel;

  factory EtcChulgoModel.fromJson(Map<String, dynamic> json) =>
      _$EtcChulgoModelFromJson(json);
}

@freezed
class Header with _$Header {
  const factory Header({
    @Default(0) int currentPage,
    @Default(0) int pageSize,
    @Default(0) int totalRecords,
    @Default('') String orders,
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
class NestedItem with _$NestedItem {
  const factory NestedItem({
    @Default(1) int tagTypeRowspan,
    @Default('') String grpKey,
    @Default('') String qtyUnitMaster,
    @Default('') String itemNm,
    @Default(0) int selectedRowspan,
    @Default(1) int prtDtRowspan,
    @Default('') String tagSeq,
    @Default(1) int pjtNmRowspan,
    @Default(false) bool selected,
    @Default(0.0) double qtyUse,
    @Default(1) int remarkRowspan,
    @Default(1) int qtyUseRowspan,
    @Default('') String whCd,
    @Default(1) int qtyRemainRowspan,
    @Default(1) int otbNoRowspan,
    @Default(1) int otbDtRowspan,
    @Default(1) int tagNoRowspan,
    @Default('') String plant,
    @Default(0.0) double qty,
    @Default(0) int setQtyRowspan,
    @Default('') String prtDt,
    @Default(0) int qtyUnitMasterRowspan,
    @Default(0) int no,
    @Default(0) int zoneNmRowspan,
    @Default('') String pjtNm,
    @Default('') String whNm,
    @Default(0) int qtyRowspan,
    @Default('') String remark,
    @Default(0) int tagTypeNmRowspan,
    @Default('') String usrNm,
    @Default(0) int vendNmRowspan,
    @Default(0) int noRowspan,
    @Default('') String tagType,
    @Default('') String dtlKey,
    @Default('') String vendNm,
    @Default(0) int whNmRowspan,
    @Default('') String otbDt,
    @Default('') String locCd,
    @Default('') String tagNo,
    @Default('') String itemCd,
    @Default('') String otbNo,
    @Default(0) int locCdRowspan,
    @Default('') String zoneNm,
    @Default(0) int setQty,
    @Default(0) int usrNmRowspan,
    @Default('') String tagTypeNm,
    @Default('') String mstKey,
    @Default(0.0) double qtyRemain,
    @Default('') String qtyUnitDetail,
  }) = _NestedItem;

  factory NestedItem.fromJson(Map<String, dynamic> json) =>
      _$NestedItemFromJson(json);
}
