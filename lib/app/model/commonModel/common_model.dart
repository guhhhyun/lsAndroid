import 'package:freezed_annotation/freezed_annotation.dart';

part 'common_model.freezed.dart';
part 'common_model.g.dart';

@freezed
class CommonModel with _$CommonModel {
  const factory CommonModel({
    Header? header,
    @Default('') String resultCode,
    @Default('') String resultMessage,
    List<dynamic>? body,
    @Default(false) bool hasError,
  }) = _CommonModel;

  factory CommonModel.fromJson(Map<String, dynamic> json) =>
      _$CommonModelFromJson(json);
}

@freezed
class Header with _$Header {
  const factory Header({
    @Default(0) int currentPage,
    @Default(0) int pageSize,
    @Default(0) int totalRecords,
    dynamic orders,
    dynamic chnlCd,
  }) = _Header;

  factory Header.fromJson(Map<String, dynamic> json) =>
      _$HeaderFromJson(json);
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

  factory BodyItem.fromJson(Map<String, dynamic> json) =>
      _$BodyItemFromJson(json);
}

@freezed
class BodyDetail with _$BodyDetail {
  const factory BodyDetail({
    @Default('') String UPD_USR_IP,
    @Default('') String REG_DTTM,
    dynamic LCLS_CD,
    @Default('') String DTL_CD,
    @Default('') String GRP_CD,
    dynamic CD_DESC,
    dynamic MCLS_NM,
    @Default('') String CD_NM,
    dynamic UPR_DTL_CD,
    @Default('') String USE_YN,
    dynamic ETC1,
    dynamic ETC2,
    dynamic ETC3,
    dynamic ETC4,
    dynamic ETC5,
    @Default('') String REG_USR_IP,
    dynamic UPR_GRP_CD,
    dynamic LCLS_NM,
    @Default('') String UPD_DTTM,
    @Default(0) int SRT_NO,
    @Default('') String GRP_NM,
    @Default(0) int CD_LEN,
    dynamic MCLS_CD,
    @Default('') String REG_USR_ID,
    dynamic RMK,
    @Default('') String UPD_USR_ID,
  }) = _BodyDetail;

  factory BodyDetail.fromJson(Map<String, dynamic> json) =>
      _$BodyDetailFromJson(json);
}
