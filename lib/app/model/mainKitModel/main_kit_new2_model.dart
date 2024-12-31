import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_kit_new2_model.freezed.dart';
part 'main_kit_new2_model.g.dart';

@freezed
class MainKitNew2Model with _$MainKitNew2Model {
  const factory MainKitNew2Model({
    Header? header,
    @Default('') String resultCode,
    @Default('') String resultMessage,
    List<dynamic>? body,
  }) = _MainKitNew2Model;

  factory MainKitNew2Model.fromJson(Map<String, dynamic> json) =>
      _$MainKitNew2ModelFromJson(json);
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
    @Default(0) int cbxQty,
    @Default(0) int cbxMaSeq,
    @Default(0) int setQty,
    @Default('') String qtyUnit,
    @Default('') String cbxSuNo,
    @Default(0) int cbxSuCnt,
    @Default('') String itemCd,
    @Default('') String cbxMaNo,
    @Default('') String itemNm,
    @Default('') String sboxNo,
    @Default(0.0) double bomQty

  }) = _SubBodyItem;

  factory SubBodyItem.fromJson(Map<String, dynamic> json) =>
      _$SubBodyItemFromJson(json);
}
