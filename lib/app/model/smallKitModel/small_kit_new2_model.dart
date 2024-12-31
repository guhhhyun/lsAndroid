import 'package:freezed_annotation/freezed_annotation.dart';

part 'small_kit_new2_model.freezed.dart';
part 'small_kit_new2_model.g.dart';

@freezed
class SmallKitNew2Model with _$SmallKitNew2Model {
  const factory SmallKitNew2Model({
    Header? header,
    @Default('') String resultCode,
    @Default('') String resultMessage,
    List<dynamic>? body,
  }) = _SmallKitNew2Model;

  factory SmallKitNew2Model.fromJson(Map<String, dynamic> json) =>
      _$SmallKitNew2ModelFromJson(json);
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
    @Default('') String pitmNm,
    @Default('') String cbxMaNo,
    @Default('') String itemNm,
    @Default(0) int splitSeq,
    @Default('') String wrkRemark,
    @Default('') String pjtNm2,
    @Default('') String wrkNo,
    @Default('') String splitNo,
    @Default('') String cbxSuNo,
    @Default(0) int id,
    @Default('') String cbxSuNm,
    @Default(0.0) double bomQty,
    @Default(0) int cbxSuSeq,
    @Default('') String sboxSpec,
    @Default('') String wrkCfmYn,
    @Default(0.0) double setCbxQty,
    @Default('') String wrkCfmDttm,
    @Default('') String tagNo,
    @Default('') String itemCd,
    @Default('') String pitmCd,
    @Default('') String wksNo,
    @Default('') String qtyUnit,
    @Default(0) int wrkQty,
    @Default(0) int cbxQty,
    @Default(0) int setQty,

  }) = _SubBodyItem;

  factory SubBodyItem.fromJson(Map<String, dynamic> json) =>
      _$SubBodyItemFromJson(json);
}
