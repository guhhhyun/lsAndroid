import 'package:freezed_annotation/freezed_annotation.dart';
part 'rack_ipgo_model.freezed.dart';
part 'rack_ipgo_model.g.dart';

@freezed
class RackIpgoModel with _$RackIpgoModel {
  factory RackIpgoModel({
    Header? header,
    @Default('') String resultCode,
    @Default('') String resultMessage,
    List<dynamic>? body,
    @Default(false) bool hasError,
  }) = _RackIpgoModel;

  factory RackIpgoModel.fromJson(Map<String, dynamic> json) =>
      _$RackIpgoModelFromJson(json);
}

@freezed
class Header with _$Header {
  factory Header({
    @Default(0) int currentPage,
    @Default(0) int pageSize,
    @Default(0) int totalRecords,
    @Default('') orders,
    @Default('') chnlCd,
  }) = _Header;

  factory Header.fromJson(Map<String, dynamic> json) => _$HeaderFromJson(json);
}

@freezed
class BodyData with _$BodyData {
  factory BodyData({
    @Default(false) bool resultValue,
    @Default(0) int resultRowCount,
    @Default('') String resultCode,
    @Default('') String resultMessage,
    @Default('') String errorState,
    @Default('') String errorProcedure,
    @Default('') String returnMessage,
  }) = _BodyData;

  factory BodyData.fromJson(Map<String, dynamic> json) => _$BodyDataFromJson(json);
}

@freezed
class ItemData with _$ItemData {
  factory ItemData({
    @Default('') String QTY_UNIT,
    @Default('') String QR_NO,
    @Default('') String ITEM_NM,
    @Default('') String LOC_CD,
    @Default('') String LAST_LOC,
    @Default('') CUST_CD,
    @Default(0.0) double QTY,
    @Default('') VEND_NM,
    @Default('') String ZONE_NM,
    @Default('') REMARK,
    @Default('') WHT_UNIT,
    @Default('') PRT_NO,
    @Default('') BOX_WHT,
    @Default('') WHT,
    @Default('') String ITEM_CD,
    @Default('') String LOC_DT,
    @Default('') String TAG_NO,
    @Default('') String INB_YN,
    @Default('') EXP_DT,
    @Default('') EXTR_VAL,
    @Default(0) int D_QTY,
    @Default('') BOX_NM,
    @Default('') PRT_DT,
    @Default('') SET_QTY,
    @Default('') BOX_NO,
    @Default('') PJT_NO,
    @Default('') PJT_NM,
    @Default('') VEND_CD,
    @Default('') TOT_WHT,
    @Default('') String TAG_TYPE,
    @Default('') String LOT_NO,
    @Default('') String ZONE_CD,
    @Default('') String INB_NO,
  }) = _ItemData;

  factory ItemData.fromJson(Map<String, dynamic> json) => _$ItemDataFromJson(json);
}