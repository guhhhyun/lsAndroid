import 'package:freezed_annotation/freezed_annotation.dart';

part 'bom_model.freezed.dart';
part 'bom_model.g.dart';

@freezed
class BomModel with _$BomModel {
  const factory BomModel({
    Header? header,
    @Default('') String resultCode,
    @Default('') String resultMessage,
    List<dynamic>? body,
  }) = _BomModel;

  factory BomModel.fromJson(Map<String, dynamic> json) =>
      _$BomModelFromJson(json);
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
    @Default('') String bcAfUserId,
    @Default('') String BC_AF_RST,
    @Default('') String bcAfDtm,
    @Default('') String soNo,
    @Default('') String BC_TYPE,
    @Default('') String bcType,
    @Default('') String pitmCd,
    @Default(0) int bcId,
    @Default('') String BC_STATUS,
    @Default(0) int setQty,
    @Default('') String pdtNo,
    @Default('') String bxDtm,
    @Default('') String bcAfRst,
    @Default('') String bcRmk,
    @Default('') String bcStatus,
    @Default(0) int selected,

  }) = _SubBodyItem;

  factory SubBodyItem.fromJson(Map<String, dynamic> json) =>
      _$SubBodyItemFromJson(json);
}
