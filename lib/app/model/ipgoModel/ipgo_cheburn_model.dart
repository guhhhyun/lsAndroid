import 'package:freezed_annotation/freezed_annotation.dart';
part 'ipgo_cheburn_model.freezed.dart';
part 'ipgo_cheburn_model.g.dart';

@freezed
class IpgoCheburnModel with _$IpgoCheburnModel {
  factory IpgoCheburnModel({
    Header? header,
    @Default('') String resultCode,
    @Default('') String resultMessage,
    List<dynamic>? body,
    @Default(false) bool hasError,
  }) = _IpgoCheburnModel;

  factory IpgoCheburnModel.fromJson(Map<String, dynamic> json) =>
      _$IpgoCheburnModelFromJson(json);
}

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

@freezed
class BodyData with _$BodyData {
  factory BodyData({
    @Default(false) bool resultValue,
    @Default(0) int resultRowCount,
    @Default('') String resultCode,
    @Default('') String resultMessage,
    @Default('') String errorState,
    @Default('') String errorProcedure,
    @Default('') String returnMessage,
  }) = _BodyData;

  factory BodyData.fromJson(Map<String, dynamic> json) => _$BodyDataFromJson(json);
}

@freezed
class InbLot with _$InbLot {
  factory InbLot({
    @Default('') String inbLotNo,
    @Default('') String inbNo,
  }) = _InbLot;

  factory InbLot.fromJson(Map<String, dynamic> json) => _$InbLotFromJson(json);
}
