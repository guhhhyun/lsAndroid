import 'package:freezed_annotation/freezed_annotation.dart';

part 'small_kit_save_model.g.dart';
part 'small_kit_save_model.freezed.dart';

@freezed
class SmallKitSaveModel with _$SmallKitSaveModel {
  factory SmallKitSaveModel({
    Header? header,
    @Default('') String resultCode,
    @Default('') String resultMessage,
    List<dynamic>? body,
    @Default(false) bool hasError,
  }) = _SmallKitSaveModel;

  factory SmallKitSaveModel.fromJson(Map<String, dynamic> json) =>
      _$SmallKitSaveModelFromJson(json);
}

@freezed
class Header with _$Header {
  factory Header({
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
  factory BodyItem({
    @Default(true) bool resultValue,
    @Default(0) int resultRowCount,
    @Default('') String resultCode,
    @Default('') String resultMessage,
    @Default('') String errorState,
    @Default('') String errorProcedure,
    @Default('') String returnMessage,
    List<InnerBodyItem>? innerBody,
  }) = _BodyItem;

  factory BodyItem.fromJson(Map<String, dynamic> json) => _$BodyItemFromJson(json);
}

@freezed
class InnerBodyItem with _$InnerBodyItem {
  factory InnerBodyItem({
    @Default('') String wht,
    @Default('') String custCd,
    @Default('') String extrVal,
    @Default('') String pjtNm,
    @Default('') String pjtNo,
    @Default('') String expDt,
    @Default('') String remark,
    @Default('') String prtNo,
    @Default('') String itemNm,
    @Default('') String lotNo,
    @Default('') String locDt,
    @Default('') String tagType,
    @Default('') String vendNm,
    @Default('') String dQty,
    @Default('') String locCd,
    @Default('') String inbYn,
    @Default('') String itemCd,
    @Default('') String tagNo,
    @Default('') String totWht,
    @Default('') String whtUnit,
    @Default('') String boxNm,
    @Default('') String boxNo,
    @Default('') String setQty,
    @Default('') String boxWht,
    @Default('') String qrNo,
    @Default(0.0) double qty,
    @Default('') String vendCd,
    @Default('') String qtyUnit,
    @Default('') String prtDt,
  }) = _InnerBodyItem;

  factory InnerBodyItem.fromJson(Map<String, dynamic> json) =>
      _$InnerBodyItemFromJson(json);
}
