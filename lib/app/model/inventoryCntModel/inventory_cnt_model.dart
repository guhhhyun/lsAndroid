import 'package:freezed_annotation/freezed_annotation.dart';

part 'inventory_cnt_model.freezed.dart';
part 'inventory_cnt_model.g.dart';

@freezed
class InventoryCntModel with _$InventoryCntModel {
  const factory InventoryCntModel({
    Header? header,
    @Default('') String resultCode,
    @Default('') String resultMessage,
    List<dynamic>? body,
  }) = _InventoryCntModel;

  factory InventoryCntModel.fromJson(Map<String, dynamic> json) =>
      _$InventoryCntModelFromJson(json);
}

@freezed
class Header with _$Header {
  const factory Header({
    @Default(0) int currentPage,
    @Default(0) int pageSize,
    @Default(0) int totalRecords,
    @Default('') orders,
    @Default('') chnlCd,
  }) = _Header;

  factory Header.fromJson(Map<String, dynamic> json) => _$HeaderFromJson(json);
}

@freezed
class BodyItem with _$BodyItem {
  const factory BodyItem({
    @Default(false) bool resultValue,
    @Default(0) int resultRowCount,
    @Default('') String resultCode,
    @Default('') resultMessage,
    @Default('') errorState,
    @Default('') errorProcedure,
    @Default('') returnMessage,
  }) = _BodyItem;

  factory BodyItem.fromJson(Map<String, dynamic> json) =>
      _$BodyItemFromJson(json);
}

@freezed
class SubBodyItem with _$SubBodyItem {
  const factory SubBodyItem({
    @Default('') String invCntDt,
    @Default('') String invCntUser,
    @Default('') String invType,
    @Default('') String remark,
    @Default('') String invCntNm,

  }) = _SubBodyItem;

  factory SubBodyItem.fromJson(Map<String, dynamic> json) =>
      _$SubBodyItemFromJson(json);
}
