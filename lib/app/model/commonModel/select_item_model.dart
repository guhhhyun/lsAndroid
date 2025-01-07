import 'package:freezed_annotation/freezed_annotation.dart';

part 'select_item_model.freezed.dart';
part 'select_item_model.g.dart';

@freezed
class SelectItemModel with _$SelectItemModel {
  const factory SelectItemModel({
    Header? header,
    @Default('') String resultCode,
    @Default('') String resultMessage,
    List<dynamic>? body,
    @Default(false) bool hasError,
  }) = _SelectItemModel;

  factory SelectItemModel.fromJson(Map<String, dynamic> json) => _$SelectItemModelFromJson(json);
}

@freezed
class Header with _$Header {
  const factory Header({
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
  const factory BodyItem({
    @Default(false) bool resultValue,
    @Default(0) int resultRowCount,
    @Default('') String resultCode,
    @Default('') String resultMessage,
    @Default('') String errorState,
    @Default('') String errorProcedure,
    @Default('') String returnMessage,
  }) = _BodyItem;

  factory BodyItem.fromJson(Map<String, dynamic> json) => _$BodyItemFromJson(json);
}

@freezed
class Zone with _$Zone {
  const factory Zone({
    @Default(0) int no,
    @Default(0.0) double wht,
    @Default(0.0) double qtyRes,
    @Default('') String locCd,
    @Default('') String itemCd,
    @Default('') String tagNo,
    @Default('') String itemNm,
    @Default('') String whtUnit,
    @Default('') String zoneNm,
    @Default('') String locDt,
    @Default(0) int qty,
    @Default('') String qrNo,
    @Default(0) int checkBox,
    @Default(0) int selected
  }) = _Zone;

  factory Zone.fromJson(Map<String, dynamic> json) => _$ZoneFromJson(json);
}
