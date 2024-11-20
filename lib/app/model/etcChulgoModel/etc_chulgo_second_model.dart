import 'package:freezed_annotation/freezed_annotation.dart';

part 'etc_chulgo_second_model.freezed.dart';
part 'etc_chulgo_second_model.g.dart';

@freezed
class EtcChulgoSecondModel with _$EtcChulgoSecondModel {
  const factory EtcChulgoSecondModel({
    Header? header,
    @Default('') String resultCode,
    @Default('') String resultMessage,
    List<dynamic>? body,
    @Default(false) bool hasError,
  }) = _EtcChulgoSecondModel;

  factory EtcChulgoSecondModel.fromJson(Map<String, dynamic> json) =>
      _$EtcChulgoSecondModelFromJson(json);
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

  factory BodyItem.fromJson(Map<String, dynamic> json) => _$BodyItemFromJson(json);
}

@freezed
class Detail with _$Detail {
  const factory Detail({
    @Default(0) int checkBoxRowspan,
    @Default(0) int tagTypeRowspan,
    @Default('') String grpKey,
    @Default('') String qtyUnitMaster,
    @Default('') String itemNm,
    @Default(0) int selectedRowspan,
    @Default(0) int prtDtRowspan,
    @Default(0) int tagSeq,
    @Default(0) int pjtNmRowspan,
    @Default(false) bool selected,
    @Default(false) qtyUse,
    @Default(0) int remarkRowspan,
    @Default(0) int qtyUseRowspan,
    @Default('') String whCd,
    @Default(0) int qtyRemainRowspan,
    @Default(0) int otbNoRowspan,
    @Default(0) int otbDtRowspan,
    @Default(0) int tagNoRowspan,
    @Default('') String plant,
    @Default(0) int qty,
    @Default(0) int setQtyRowspan,
    @Default('') String prtDt,
    @Default(0) int qtyUnitMasterRowspan,
    @Default(0) int no,
    @Default(0) int zoneNmRowspan,
    @Default(0) int wht,
    @Default(0) int tagId,
    @Default('') String pjtNm,
    @Default('') String whNm,
    @Default(0) int qtyRowspan,
    @Default('') String expDt,
    @Default('') String remark,
    @Default(0) int tagTypeNmRowspan,
    @Default('') String lotNo,
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
    @Default('') String whtUnit,
    @Default('') String zoneNm,
    @Default(0) int setQty,
    @Default('') String qrNo,
    @Default(0) int usrNmRowspan,
    @Default('') String tagTypeNm,
    @Default('') String mstKey,
    @Default('') String qtyRemain,
    @Default('') String qtyUnitDetail,
  }) = _Detail;

  factory Detail.fromJson(Map<String, dynamic> json) => _$DetailFromJson(json);
}
