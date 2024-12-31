import 'dart:ffi';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'etc_chulgo_second_detail_model.freezed.dart';
part 'etc_chulgo_second_detail_model.g.dart';

@freezed
class EtcChulgoSecondDetailModel with _$EtcChulgoSecondDetailModel {
  const factory EtcChulgoSecondDetailModel({
    Header? header,
    @Default('') String resultCode,
    @Default('') String resultMessage,
    List<dynamic>? body,
    @Default(false) bool hasError,
  }) = _EtcChulgoSecondDetailModel;

  factory EtcChulgoSecondDetailModel.fromJson(Map<String, dynamic> json) => _$EtcChulgoSecondDetailModelFromJson(json);
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
    List<SubBodyItem>? items,
  }) = _BodyItem;

  factory BodyItem.fromJson(Map<String, dynamic> json) => _$BodyItemFromJson(json);
}

@freezed
class SubBodyItem with _$SubBodyItem {
  const factory SubBodyItem({
    @Default('') String wht,
    @Default(0) int tagId,
    @Default('') String WH_NM,
    @Default('') String pjtNm,
    @Default('') String grpKey,
    @Default('') String LOC_CD,
    @Default('') String expDt,
    @Default('') String remark,
    @Default('') String itemNm,
    @Default('') String lotNo,
    @Default('') String usrNm,
    @Default('') String tagType,
    @Default('') String vendNm,
    @Default(0) int tagSeq,
    @Default('') String whCd,
    @Default('') String tagNo,
    @Default('') String itemCd,
    @Default('') String whtUnit,
    @Default('') String setQty,
    @Default('') String plant,
    @Default('') String qrNo,
    @Default('') String qty,
    @Default('') String tagTypeNm,
    @Default('') String qtyUnit,
    @Default('') String prtDt,

  }) = _SubBodyItem;

  factory SubBodyItem.fromJson(Map<String, dynamic> json) => _$SubBodyItemFromJson(json);
}
