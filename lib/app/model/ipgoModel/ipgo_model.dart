import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:collection/collection.dart';

part 'ipgo_model.freezed.dart';
part 'ipgo_model.g.dart';

@freezed
class IpgoModel with _$IpgoModel {
  const factory IpgoModel({
    Header? header,
    @Default('false') String resultCode,
    @Default('') String resultMessage,
    List<dynamic>? body,
  }) = _IpgoModel;

  factory IpgoModel.fromJson(Map<String, dynamic> json) => _$IpgoModelFromJson(json);
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

  factory Header.fromJson(Map<String, dynamic> json) => _$HeaderFromJson(json);
}

@freezed
class BodyItem1 with _$BodyItem1 {
  const factory BodyItem1({
    List<BodyItem>? body
  }) = _BodyItem1;

  factory BodyItem1.fromJson(Map<String, dynamic> json) => _$BodyItem1FromJson(json);
}

@freezed
class BodyItem with _$BodyItem {
  const factory BodyItem({
    @Default(0) int no,
    @Default(0) int doc1Rowspan,
    @Default(0) int doc1Seq,
    @Default('') String pjtNm,
    @Default('') String grpKey,
    dynamic pjtNo,
    @Default('') String inbType,
    dynamic soNo,
    @Default('') String itemNm,
    @Default(0) int selectedRowspan,
    @Default(0) int grDtRowspan,
    @Default('') sapQtyUnit,
    dynamic pjtNm2,
    @Default(0) int vendNmRowspan,
    dynamic doc2,
    @Default(0) int noRowspan,
    @Default('') String doc1,
    @Default(0.0) rmnQty,
    @Default('') String vendNm,
    @Default(0) int pjtNmRowspan,
    @Default(false) bool selected,
    @Default(0.0) wmsQty,
    dynamic doc2Seq,
    @Default('') String whCd,
    dynamic pkNo,
    @Default('') String grDt,
    @Default('') String itemCd,
    dynamic appDttm,
    dynamic lgort,
    @Default('') String plant,
    dynamic wmsQtyUnit,
    dynamic vendCd,
    @Default('') String mstKey,
    @Default(0.0) sapQty,
  }) = _BodyItem;

  factory BodyItem.fromJson(Map<String, dynamic> json) => _$BodyItemFromJson(json);
}
