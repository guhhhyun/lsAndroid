import 'package:freezed_annotation/freezed_annotation.dart';

part 'chul_third_model.freezed.dart';
part 'chul_third_model.g.dart';

@freezed
class ChulThirdModel with _$ChulThirdModel {
  const factory ChulThirdModel({
    Header? header,
    @Default('') String resultCode,
    @Default('') String resultMessage,
    List<dynamic>? body,
    @Default(false) bool hasError,
  }) = _ChulThirdModel;

  factory ChulThirdModel.fromJson(Map<String, dynamic> json) => _$ChulThirdModelFromJson(json);
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
    @Default('') String resultMessage,
    @Default('') String errorState,
    @Default('') String errorProcedure,
    @Default('') String returnMessage,
  }) = _BodyItem;

  factory BodyItem.fromJson(Map<String, dynamic> json) => _$BodyItemFromJson(json);
}

@freezed
class Tag with _$Tag {
  const factory Tag({
    @Default('') String plant,
    @Default('') String tagNo,
  }) = _Tag;

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
}
