import 'package:freezed_annotation/freezed_annotation.dart';

part 'ipgo_cancel_model.freezed.dart';
part 'ipgo_cancel_model.g.dart';

// 전체 응답 모델
@freezed
class IpgoCancelModel with _$IpgoCancelModel {
  factory IpgoCancelModel({
    Header? header,
    @Default('') String resultCode,
    @Default('') String resultMessage,
    List<dynamic>? body, // body는 다양한 타입의 요소들을 포함하므로 dynamic으로 설정
    @Default(false) bool hasError,
  }) = _IpgoCancelModel;

  factory IpgoCancelModel.fromJson(Map<String, dynamic> json) => _$IpgoCancelModelFromJson(json);
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
    @Default(0) int no,
    @Default('') String inbNo,
    String? pjtNm,
    @Default('') String grpKey,
    @Default('') String inbType,
    @Default('') remark,
    @Default('') String itemNm,
    @Default('') String lotNo,
    @Default('') String InbDt,
    @Default(false) bool checked,
    @Default('') vendNm,
    @Default('') docDt,
    @Default(false) bool selected,
    @Default('') String inbUserNm,
    @Default('') String locCd,
    @Default('') String whCd,
    @Default(0) int inbSeq,
    @Default('') String itemCd,
    @Default('') docNo,
    @Default('') String plant,
    @Default(0.0) qty,
    @Default('') String inbUser,
    @Default('') vendCd,
    @Default('') String qtyUnit,
    @Default('') String mstKey,
    @Default('') String inbTypeNm,
  }) = _InboundItem;

  factory InboundItem.fromJson(Map<String, dynamic> json) => _$InboundItemFromJson(json);
}


