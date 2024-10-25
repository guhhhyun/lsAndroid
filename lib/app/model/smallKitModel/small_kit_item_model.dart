import 'package:freezed_annotation/freezed_annotation.dart';

part 'small_kit_item_model.g.dart';
part 'small_kit_item_model.freezed.dart';

@freezed
class SmallKitItemModel with _$SmallKitItemModel {
  factory SmallKitItemModel({
    @Default(0) int currentPage,
    @Default(0) int pageSize,
    @Default(0) int totalRecords,
    @Default('') String orders,
    @Default('') String chnlCd,
    @Default('') String resultCode,
    @Default('') String resultMessage,
    List<dynamic>? body,
    @Default(false) bool hasError,
  }) = _SmallKitItemModel;

  factory SmallKitItemModel.fromJson(Map<String, dynamic> json) =>
      _$SmallKitItemModelFromJson(json);
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
    @Default([]) List<InnerBodyItem> body,
  }) = _BodyItem;

  factory BodyItem.fromJson(Map<String, dynamic> json) => _$BodyItemFromJson(json);
}

@freezed
class InnerBodyItem with _$InnerBodyItem {
  factory InnerBodyItem({
    @Default(0) int cbxSuSeq,
    @Default('') String sboxSpec,
    @Default(0.0) double setCbxQty,
    @Default('') String tagNo,
    @Default('') String itemCd,
    @Default('') String cbxMaNo,
    @Default('') String itemNm,
    @Default('') String pitmCd,
    @Default(0) int splitSeq,
    @Default(0) int cbxQty,
    @Default('') String wrkNo,
    @Default(0) int splitNo,
    @Default(0) int setQty,
    @Default('') String qtyUnit,
    @Default('') String cbxSuNo,
    @Default('') String cbxSuNm,
    @Default('') String wksNo,
  }) = _InnerBodyItem;

  factory InnerBodyItem.fromJson(Map<String, dynamic> json) =>
      _$InnerBodyItemFromJson(json);
}