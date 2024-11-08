import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_kit_model.freezed.dart';
part 'main_kit_model.g.dart';

@freezed
class MainKitModel with _$MainKitModel {
  const factory MainKitModel({
    Header? header,
    @Default('') String resultCode,
    @Default('') String resultMessage,
    List<dynamic>? body,
  }) = _MainKitModel;

  factory MainKitModel.fromJson(Map<String, dynamic> json) =>
      _$MainKitModelFromJson(json);
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
    @Default('') scanNo,
    @Default(0) scanSeq,
    @Default('') dTagNo,
    @Default('') syncYn,
    @Default('') remark,
    DateTime? chkDtm,
    @Default('') pitmNm,
    @Default('') cbxMaNo,
    @Default('') itemNm,
    @Default('') wrkRemark,
    @Default('') dScanNo,
    @Default('') pjtNm2,
    @Default('') wrkNo,
    @Default(0) cbxMaSeq,
    @Default('') cbxSuNo,
    @Default('') cbxSuNm,
    @Default(0) cbxSuSeq,
    @Default('') sboxSpec,
    @Default('') wrkCfmYn,
    @Default(0.0) setCbxQty,
    DateTime? wrkCfmDttm,
    @Default('') itemCd,
    @Default('') tagNo,
    @Default('') scanYn,
    @Default('') pitmCd,
    @Default(0.0) wrkQty,
    @Default(0) cbxQty,
    @Default(0) setQty,
    @Default(0.0) wrkQtySync,
    @Default(0.0) dWrkQty,
    @Default('') pdtNo,
    @Default('') qtyUnit,
    @Default('') mboxExcluded,
    @Default('') itemNmNonKit,
    @Default('') wksNo,
    @Default('') ncbxRmk,
  }) = _SubBodyItem;

  factory SubBodyItem.fromJson(Map<String, dynamic> json) =>
      _$SubBodyItemFromJson(json);
}
