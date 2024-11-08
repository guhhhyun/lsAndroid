import 'package:freezed_annotation/freezed_annotation.dart';

part 'chul_second_model.freezed.dart';
part 'chul_second_model.g.dart';

@freezed
class ChulSecondModel with _$ChulSecondModel {
  const factory ChulSecondModel({
    Header? header,
    @Default('') String resultCode,
    @Default('') String resultMessage,
    List<dynamic>? body,
    @Default(false) bool hasError,
  }) = _ChulSecondModel;

  factory ChulSecondModel.fromJson(Map<String, dynamic> json) => _$ChulSecondModelFromJson(json);
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
class DetailItem with _$DetailItem {
  const factory DetailItem({
    @Default('') String otbYn,
    @Default(0) int no,
    @Default('') String grpKey,
    @Default(false) bool scan,
    @Default('') String pitmNm,
    @Default('') itemNm,
    @Default(0) int selectedRowspan,
    @Default(0) int otbYnRowspan,
    @Default(0) int pitmCdRowspan,
    @Default('') String delOrdNo,
    @Default('') String wrkNo,
    @Default(0) int wrkNoRowspan,
    @Default(0) int ordSortRowspan,
    @Default(0) int noRowspan,
    @Default(false) bool checked,
    @Default(0) int scanRowspan,
    @Default('') String wrkCfmYnNm,
    @Default(0) int ordSort,
    @Default(false) bool selected,
    @Default(0) int delOrdSeq,
    String? locCd,
    @Default('') String wrkCfmYn,
    @Default(0) int checkedRowspan,
    @Default(0) int boxNoRowspan,
    @Default(0) int boxNmRowspan,
    @Default(0) int pitmNmRowspan,
    @Default('') String tagNo,
    @Default('') String itemCd,
    @Default(0) int wrkCfmYnNmRowspan,
    @Default('') String pitmCd,
    @Default(0) int locCdRowspan,
    @Default(0) int cbxQty,
    @Default(0) int tagNoRowspan,
    @Default('') boxNm,
    @Default('') String boxNo,
    @Default('') String plant,
    @Default('') String mstKey,
  }) = _DetailItem;

  factory DetailItem.fromJson(Map<String, dynamic> json) => _$DetailItemFromJson(json);
}
