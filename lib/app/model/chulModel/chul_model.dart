import 'package:freezed_annotation/freezed_annotation.dart';

part 'chul_model.freezed.dart';
part 'chul_model.g.dart';

@freezed
class ChulModel with _$ChulModel {
  const factory ChulModel({
    Header? header,
    @Default('') String resultCode,
    @Default('') String resultMessage,
    List<dynamic>? body,
    @Default(false) bool hasError,
  }) = _ChulModel;

  factory ChulModel.fromJson(Map<String, dynamic> json) => _$ChulModelFromJson(json);
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
    @Default('') String resultMessage,
    @Default('') String errorState,
    @Default('') String errorProcedure,
    @Default('') String returnMessage,
  }) = _BodyItem;

  factory BodyItem.fromJson(Map<String, dynamic> json) => _$BodyItemFromJson(json);
}

@freezed
class DetailItem with _$DetailItem {
  const factory DetailItem({
    @Default('') String pjtNm,
    @Default('') String soNo,
    @Default('') String bomChgSts,
    @Default('') String remark,
    @Default('') String otbNo,
    @Default('') delOrdTypeNm,
    @Default('') String otbPsbSts,
    @Default('') String delOrdNo,
    @Default('') String kitCfmSts,
    @Default('') String delPreDt,
    @Default('') String mstKey,
    @Default('') String delOrdType,
    @Default(false) bool selected,
  }) = _DetailItem;

  factory DetailItem.fromJson(Map<String, dynamic> json) => _$DetailItemFromJson(json);
}
