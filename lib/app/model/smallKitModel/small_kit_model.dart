import 'package:freezed_annotation/freezed_annotation.dart';

part 'small_kit_model.freezed.dart';
part 'small_kit_model.g.dart';

@freezed
class SmallKitModel with _$SmallKitModel {
  factory SmallKitModel({
    Header? header,
    @Default('') String resultCode,
    @Default('') String resultMessage,
    List<dynamic>? body,
    @Default(false) bool hasError,
  }) = _SmallKitModel;

  factory SmallKitModel.fromJson(Map<String, dynamic> json) =>
      _$SmallKitModelFromJson(json);
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
    @Default('') String scanNo,
    @Default('') String scanSeq,
    @Default('') String syncYn,
    @Default('') String remark,
    @Default('') String pitmNm,
    @Default('') String cbxMaNo,
    @Default('') String itemNm,
    @Default(0) int splitSeq,
    @Default('') String wrkRemark,
    @Default('') String pjtNm2,
    @Default('') String wrkNo,
    @Default(0) int splitNo,
    @Default('') String cbxSuNo,
    @Default('') String vendNm,
    @Default('') String cbxSuNm,
    @Default(0) int cbxSuSeq,
    @Default('') String sboxSpec,
    @Default('') String wrkdTagNo,
    @Default('') String wrkCfmYn,
    @Default(0.0) double setCbxQty,
    @Default('') String wrkCfmDttm,
    @Default('') String tagNo,
    @Default('') String itemCd,
    @Default('') String scanYn,
    @Default('') String pitmCd,
    @Default('') String wrkQty,
    @Default(0) int cbxQty,
    @Default(0) int setQty,
    @Default('') String wrkQtySync,
    @Default('') String vendCd,
    @Default('') String qtyUnit,
    @Default('') String wrkTagNo,
    @Default('') String wksNo,
    @Default('') String ncbxRmk,
  }) = _InnerBodyItem;

  factory InnerBodyItem.fromJson(Map<String, dynamic> json) =>
      _$InnerBodyItemFromJson(json);
}