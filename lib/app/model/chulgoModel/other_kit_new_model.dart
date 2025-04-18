import 'package:freezed_annotation/freezed_annotation.dart';

part 'other_kit_new_model.freezed.dart';
part 'other_kit_new_model.g.dart';

@freezed
class OtherKitNewModel with _$OtherKitNewModel {
  const factory OtherKitNewModel({
    Header? header,
    @Default('') String resultCode,
    @Default('') String resultMessage,
    List<dynamic>? body,
  }) = _OtherKitNewModel;

  factory OtherKitNewModel.fromJson(Map<String, dynamic> json) =>
      _$OtherKitNewModelFromJson(json);
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
    @Default(0) int cbxExSeq,
    @Default('') String tagNo,
    @Default(0) int cancleFlag,
    @Default(0) double convQty,
    @Default(0) int wrkQty,
    @Default(0) int oderQty,
    @Default('') String qrNo,
  }) = _SubBodyItem;

  factory SubBodyItem.fromJson(Map<String, dynamic> json) =>
      _$SubBodyItemFromJson(json);
}
