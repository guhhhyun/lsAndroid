import 'package:freezed_annotation/freezed_annotation.dart';
part 'ipgo_qr_model.freezed.dart';
part 'ipgo_qr_model.g.dart';


// 전체 응답 모델
@freezed
class IpgoQrModel with _$IpgoQrModel {
  factory IpgoQrModel({
    Header? header,
    @Default('false') String resultCode,
    @Default('') String resultMessage,
    List<dynamic>? body, // body는 서로 다른 두 타입을 포함하므로 dynamic으로 선언
    @Default(false) bool hasError,
  }) = _IpgoQrModel;

  factory IpgoQrModel.fromJson(Map<String, dynamic> json) => _$IpgoQrModelFromJson(json);
}

// Header 모델
@freezed
class Header with _$Header {
  factory Header({
    @Default(0) int currentPage,
    @Default(0) int pageSize,
    @Default(0) int totalRecords,
    String? orders,
    String? chnlCd,
  }) = _Header;

  factory Header.fromJson(Map<String, dynamic> json) => _$HeaderFromJson(json);
}

// BodyItem 내부 리스트의 첫 번째 객체
@freezed
class BodyItem with _$BodyItem {
  factory BodyItem({
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

// 두 번째 리스트의 객체
@freezed
class SubBodyItem with _$SubBodyItem {
  factory SubBodyItem({
    @Default(0) int no,
    String? wht,
    String? custCd,
    String? extrVal,
    String? pjtNm,
    @Default('') String grpKey,
    String? pjtNo,
    String? expDt,
    String? remark,
    @Default(0) int tagTypeNmRowspan,
    String? prtNo,
    @Default('') String itemNm,
    @Default(0) int selectedRowspan,
    @Default(false) bool inEdit,
    @Default('') String lotNo,
    @Default(0) int noRowspan,
    @Default('') String tagType,
    String? vendNm,
    @Default(0) int dQty,
    @Default(false) bool selected,
    @Default('') String itemCd,
    @Default('') String tagNo,
    String? totWht,
    String? whtUnit,
    String? setQty,
    String? boxWht,
    @Default('') String qrNo,
    @Default(0.0) double qty,
    String? vendCd,
    @Default('') String qtyUnit,
    @Default('') String tagTypeNm,
    @Default('') String mstKey,
    @Default(0) int setQtyRowspan,
    String? prtDt,
  }) = _SubBodyItem;

  factory SubBodyItem.fromJson(Map<String, dynamic> json) => _$SubBodyItemFromJson(json);
}

