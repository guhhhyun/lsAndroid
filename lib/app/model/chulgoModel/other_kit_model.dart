import 'package:freezed_annotation/freezed_annotation.dart';

part 'other_kit_model.freezed.dart';
part 'other_kit_model.g.dart';

@freezed
class OtherKitModel with _$OtherKitModel {
  const factory OtherKitModel({
    Header? header,
    @Default('') String resultCode,
    @Default('')String resultMessage,
    List<Body>? body,
    @Default(false)bool hasError,
  }) = _OtherKitModel;

  factory OtherKitModel.fromJson(Map<String, dynamic> json) => _$OtherKitModelFromJson(json);
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
class Body with _$Body {
  const factory Body.result({
    @Default(false) bool resultValue,
    @Default(0) int resultRowCount,
    @Default('') String resultCode,
    @Default('') String resultMessage,
    @Default('') errorState,
    @Default('') errorProcedure,
    @Default('') returnMessage,
  }) = BodyResult;

  const factory Body.dataList(List<ItemData> items) = BodyDataList;

  factory Body.fromJson(Map<String, dynamic> json) => _$BodyFromJson(json);
}

@freezed
class ItemData with _$ItemData {
  const factory ItemData({
    @Default('') scanNo,
    @Default(0) pkgSeq,
    @Default(0) scanSeq,
    @Default('') dTagNo,
    @Default('') String syncYn,
    @Default('') remark,
    @Default('') pitmNm,
    @Default('') itemNm,
    @Default('') wrkRemark,
    @Default('') wrkItemCd,
    @Default('') dScanNo,
    @Default('') pjtNm2,
    @Default('') wrkCfmYn,
    @Default(0.0) setCbxQty,
    @Default('') wrkCfmDttm,
    @Default('') tagNo,
    @Default('') itemCd,
    @Default('') scanYn,
    @Default('') cbxExNo,
    @Default('') pitmCd,
    @Default(0) wrkQty,
    @Default('') pkgNo,
    @Default(0) cbxQty,
    @Default(0) cbxExSeq,
    @Default('') totWrkNo,
    @Default(0) setQty,
    @Default('') wrkItemNm,
    @Default(0) wrkQtySync,
    @Default(0) dWrkQty,
    @Default('') pdtNo,
    @Default('') qtyUnit,
    @Default('') itemNmNonKit,
    @Default('') wksNo,
    @Default('') ncbxRmk,
  }) = _ItemData;

  factory ItemData.fromJson(Map<String, dynamic> json) => _$ItemDataFromJson(json);
}
