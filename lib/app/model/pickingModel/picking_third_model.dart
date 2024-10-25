import 'package:freezed_annotation/freezed_annotation.dart';

part 'picking_third_model.freezed.dart';
part 'picking_third_model.g.dart';

@freezed
class PickingThirdModel with _$PickingThirdModel {
  const factory PickingThirdModel({
    Header? header,
    @Default('') String resultCode,
    @Default('') String resultMessage,
    List<dynamic>? body,
    @Default(false) bool hasError,
  }) = _PickingThirdModel;

  factory PickingThirdModel.fromJson(Map<String, dynamic> json) => _$PickingThirdModelFromJson(json);
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
class BodyResult with _$BodyResult {
  const factory BodyResult({
    @Default(false) bool resultValue,
    @Default(0) int resultRowCount,
    @Default('') String resultCode,
    @Default('') String resultMessage,
    @Default('') String errorState,
    @Default('') String errorProcedure,
    @Default('') String returnMessage,
  }) = _BodyResult;

  factory BodyResult.fromJson(Map<String, dynamic> json) => _$BodyResultFromJson(json);
}

@freezed
class BodyItem with _$BodyItem {
  const factory BodyItem({
    @Default('') String locCd,
    @Default('') String whCd,
    @Default('') String pjtNm,
    @Default(0) int locSeq,
    @Default('') String itemCd,
    @Default('') String tagNo,
    @Default('') String pitmNm,
    @Default('') String itemNm,
    @Default('') String pitmCd,
    @Default('') String zoneCd,
    @Default('') String inbLotNo,
    @Default('') String wrkNo,
    @Default('') lotNo,
    @Default('') boxNo,
    @Default('') String plant,
    @Default(0.0) double qty,
    @Default('') String mstKey,
    @Default(0) int inbLotSeq,
    @Default(false) bool selected,
    @Default(0) int pickQty,
  }) = _BodyItem;

  factory BodyItem.fromJson(Map<String, dynamic> json) => _$BodyItemFromJson(json);
}
