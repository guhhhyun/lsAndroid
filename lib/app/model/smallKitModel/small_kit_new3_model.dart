import 'package:freezed_annotation/freezed_annotation.dart';

part 'small_kit_new3_model.freezed.dart';
part 'small_kit_new3_model.g.dart';

@freezed
class SmallKitNew3Model with _$SmallKitNew3Model {
  const factory SmallKitNew3Model({
    Header? header,
    @Default('') String resultCode,
    @Default('') String resultMessage,
    List<dynamic>? body,
  }) = _SmallKitNew3Model;

  factory SmallKitNew3Model.fromJson(Map<String, dynamic> json) =>
      _$SmallKitNew3ModelFromJson(json);
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
    @Default('') String scanNo,
    @Default(0) int wrkSeq,
    @Default('') String qtyUnit,
    @Default('') String syncYn,
    @Default('') String itemCd,
    @Default('') String cbxSuNo,
    @Default('') String cbxSuSeq,
    @Default('') String itemNm,
    @Default('') String btn,
    @Default(0) int wrkQty,
    @Default('') String ncbxRmk,
    @Default('') String vendNm,
    @Default('') String sboxNo,
    @Default(0.0) double bomQty,

  }) = _SubBodyItem;

  factory SubBodyItem.fromJson(Map<String, dynamic> json) =>
      _$SubBodyItemFromJson(json);
}
