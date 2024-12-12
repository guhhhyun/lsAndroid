import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'ipgo_smallbox_item_model.freezed.dart';
part 'ipgo_smallbox_item_model.g.dart';

@freezed
class IpgoSmallboxItemModel with _$IpgoSmallboxItemModel {
  const factory IpgoSmallboxItemModel({
    Header? header,
    @Default('') String resultCode,
    @Default('') String resultMessage,
    List<dynamic>? body,
    @Default(false) bool hasError,
  }) = _IpgoSmallboxItemModel;

  factory IpgoSmallboxItemModel.fromJson(Map<String, dynamic> json) => _$IpgoSmallboxItemModelFromJson(json);
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
class SubItem with _$SubItem {
  const factory SubItem({
    @Default(0) int no,
    @Default('') String wht,
    @Default('') String custCd,
    @Default(0) int tagId,
    @Default('') String pjtNm,
    @Default('') String grpKey,
    @Default('') String pjtNo,
    @Default('') String expDt,
    @Default('') String remark,
    @Default('') String prtNo,
    @Default('') String itemNm,
    @Default('') String lotNo,
    @Default('') String tagType,
    @Default('') String vendNm,
    @Default('') String dQty,
    @Default(0.0) double wmsQty,
    @Default('') String itemCd,
    @Default('') String tagNo,
    @Default('') String totWht,
    @Default('') String whtUnit,
    @Default('') String setQty,
    @Default('') String boxWht,
    @Default('') String qrNo,
    @Default(0.0) double qty,
    @Default('') String wmsQtyUnit,
    @Default('') String vendCd,
    @Default('') String qtyUnit,
    @Default('') String tagTypeNm,
    @Default('') String mstKey,
    @Default('') String prtDt,
  }) = _SubItem;

  factory SubItem.fromJson(Map<String, dynamic> json) => _$SubItemFromJson(json);
}
