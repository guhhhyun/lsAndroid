import 'package:freezed_annotation/freezed_annotation.dart';

part 'inventory_cnt_qr_model.freezed.dart';
part 'inventory_cnt_qr_model.g.dart';

@freezed
class InventoryCntQrModel with _$InventoryCntQrModel {
  const factory InventoryCntQrModel({
    Header? header,
    @Default('') String resultCode,
    @Default('') String resultMessage,
    List<dynamic>? body,
  }) = _InventoryCntQrModel;

  factory InventoryCntQrModel.fromJson(Map<String, dynamic> json) =>
      _$InventoryCntQrModelFromJson(json);
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
    @Default('') String QTY_UNIT,
    @Default('') String QR_NO,
    @Default('') String ITEM_NM,
    @Default('') String LOC_CD,
    @Default('') String LAST_LOC,
    @Default('') CUST_CD,
    @Default(0) int QTY,
    @Default('') String VEND_NM,
    @Default('') String ZONE_NM,
    @Default('') String REMARK,
    @Default('') String WHT_UNIT,
    @Default('') String PRT_NO,
    @Default(0.0) double BOX_WHT,
    @Default(0.0) double WHT,
    @Default('') String ITEM_CD,
    @Default('') String LOC_DT,
    @Default('') String TAG_NO,
    @Default('') String INB_YN,
    @Default('') String EXP_DT,
    @Default('') String EXTR_VAL,
    @Default(0) int D_QTY,
    @Default('') String BOX_NM,
    @Default('') String PRT_DT,
    @Default(0) int SET_QTY,
    @Default('') String BOX_NO,
    @Default('') String PJT_NO,
    @Default('') String PJT_NM,
    @Default('') String VEND_CD,
    @Default(0.0) double TOT_WHT,
    @Default('') String TAG_TYPE,
    @Default('') String LOT_NO,
    @Default('') String ZONE_CD,
    @Default('') String INB_NO,
    @Default('') String MATNR,
    @Default('') String MEINS,

  }) = _SubBodyItem;

  factory SubBodyItem.fromJson(Map<String, dynamic> json) =>
      _$SubBodyItemFromJson(json);
}
