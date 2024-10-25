import 'package:freezed_annotation/freezed_annotation.dart';

part 'zone_model.freezed.dart';
part 'zone_model.g.dart';

@freezed
class ZoneModel with _$ZoneModel {
  const factory ZoneModel({
    Header? header,
    @Default('') String resultCode,
    @Default('') String resultMessage,
    List<dynamic>? body,
    @Default(false) bool hasError,
  }) = _ZoneModel;

  factory ZoneModel.fromJson(Map<String, dynamic> json) => _$ZoneModelFromJson(json);
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
    @Default('') String PLANT,
    @Default('') UPD_USR_IP,
    @Default('') REG_USR_IP,
    @Default('') String WH_CD,
    @Default('') REG_DTTM,
    @Default('') UPD_DTTM,
    @Default('') DEL_USR_IP,
    @Default('') ZONE_RANK,
    @Default('') REG_USR_ID,
    @Default('') String DEL_YN,
    @Default('') String USE_YN,
    @Default('') DEL_DTTM,
    @Default('') UPD_USR_ID,
    @Default('') String ZONE_NM,
    @Default('') DEL_USR_ID,
    @Default('') String SORT_NO,
    @Default('') REMARK,
    @Default('') String ZONE_CD,
    @Default('') String ZONE_TYPE,
  }) = _Zone;

  factory Zone.fromJson(Map<String, dynamic> json) => _$ZoneFromJson(json);
}
