import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_model.freezed.dart';
part 'location_model.g.dart';

// 전체 응답 모델
@freezed
class LocationModel with _$LocationModel {
  factory LocationModel({
    Header? header,
    @Default('') String resultCode,
    @Default('') String resultMessage,
    List<dynamic>? body, // body는 다양한 타입의 요소들을 포함하므로 dynamic으로 설정
    @Default(false) bool hasError,
  }) = _LocationModel;

  factory LocationModel.fromJson(Map<String, dynamic> json) => _$LocationModelFromJson(json);
}

// Header 모델
@freezed
class Header with _$Header {
  factory Header({
    @Default(0) int currentPage,
    @Default(0) int pageSize,
    @Default(0) int totalRecords,
    @Default('') orders,
    @Default('') chnlCd,
  }) = _Header;

  factory Header.fromJson(Map<String, dynamic> json) => _$HeaderFromJson(json);
}

// BodyItem 첫 번째 객체
@freezed
class BodyItem with _$BodyItem {
  factory BodyItem({
    required bool resultValue,
    @Default(0) int resultRowCount,
    @Default('') String resultCode,
    @Default('') String resultMessage,
    @Default('') String errorState,
    @Default('') String errorProcedure,
    @Default('') String returnMessage,
  }) = _BodyItem;

  factory BodyItem.fromJson(Map<String, dynamic> json) => _$BodyItemFromJson(json);
}

// Body의 두 번째 리스트의 객체
@freezed
class InboundItem with _$InboundItem {
  factory InboundItem({
    @Default('') String zoneCd,
    @Default('') String zoneNm,
    @Default('') String locCd,
  }) = _InboundItem;

  factory InboundItem.fromJson(Map<String, dynamic> json) => _$InboundItemFromJson(json);
}


