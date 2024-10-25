import 'package:freezed_annotation/freezed_annotation.dart';

part 'picking_first_model.freezed.dart';
part 'picking_first_model.g.dart';

@freezed
class PickingFirstModel with _$PickingFirstModel {
  const factory PickingFirstModel({
    Header? header,
    @Default('') String resultCode,
    @Default('') String resultMessage,
    List<dynamic>? body,
    @Default(false) bool hasError,
  }) = _PickingFirstModel;

  factory PickingFirstModel.fromJson(Map<String, dynamic> json) =>
      _$PickingFirstModelFromJson(json);
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
class ResponseBody with _$ResponseBody {
  const factory ResponseBody({
    @Default(false) bool resultValue,
    @Default(0) int resultRowCount,
    @Default('') String resultCode,
    @Default('') resultMessage,
    @Default('') errorState,
    @Default('') errorProcedure,
    @Default('') returnMessage,
  }) = _ResponseBody;

  factory ResponseBody.fromJson(Map<String, dynamic> json) =>
      _$ResponseBodyFromJson(json);
}

@freezed
class Item with _$Item {
  const factory Item({
    @Default(0) int pickRank,
    @Default('') String pickUser,
    @Default('') String rackOutBtn,
    @Default('') String pjtNm,
    @Default('') String grpKey,
    @Default(0) int cbxSeq,
    @Default('') String itemCd,
    @Default('') String itemNm,
    @Default('') String wrkNo,
    @Default(0) int pickSeq,
    @Default('') String plant,
    @Default('') String pickNo,
    @Default('') String pickUserNm,
    @Default('') String mstKey,
    @Default('') String cbxNo,
    @Default(false) bool selected,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}
