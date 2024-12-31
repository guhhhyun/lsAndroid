import 'dart:ffi';

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

  factory EtcChulgoSecondModel.fromJson(Map<String, dynamic> json) => _$EtcChulgoSecondModelFromJson(json);
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
    @Default('') String locCd,
    @Default('') String whCd,
    @Default('') String otbNo,
    @Default('') String grpKey,
    @Default('') String whNm,
    @Default('') String expDt,
    @Default('') String remark,
    @Default('') String tagNo,
    @Default('') String itemCd,
    @Default('') String whtUnit,
    @Default('') String lotNo,
    @Default('') String zoneNm,
    @Default('') String usrNm,
    @Default('') String otbDt,
    @Default('') String plant,
    @Default('') String qrNo,
    @Default(0.0) double qty,
    @Default('') String tagType,
    @Default('') String tagTypeNm,
    @Default('') String qtyUnit,
    @Default('') String prtDt,

  }) = _SubBodyItem;

  factory SubBodyItem.fromJson(Map<String, dynamic> json) => _$SubBodyItemFromJson(json);
}
