import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_kit_new_model.freezed.dart';
part 'main_kit_new_model.g.dart';

@freezed
class MainKitNewModel with _$MainKitNewModel {
  const factory MainKitNewModel({
    Header? header,
    @Default('') String resultCode,
    @Default('') String resultMessage,
    List<dynamic>? body,
  }) = _MainKitNewModel;

  factory MainKitNewModel.fromJson(Map<String, dynamic> json) =>
      _$MainKitNewModelFromJson(json);
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
    @Default('') String wrkCfmYn,
    @Default('') String wrkCfmDttm,
    @Default('') String boxWht2,
    @Default('') String tagNo,
    @Default('') String cbxMaNo,
    @Default('') String pitmNm,
    @Default('') String pitmCd,
    @Default('') String wrkRemark,
    @Default('') String pjtNm2,
    @Default(0) int setQty,
    @Default('') String boxWht,
    @Default('') String qrNo,
    @Default('') String tagType,
    @Default('') String otbDt,

  }) = _SubBodyItem;

  factory SubBodyItem.fromJson(Map<String, dynamic> json) =>
      _$SubBodyItemFromJson(json);
}
