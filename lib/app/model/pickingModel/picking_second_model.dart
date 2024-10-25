import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';

part 'picking_second_model.freezed.dart';
part 'picking_second_model.g.dart';

@freezed
class PickingSecondModel with _$PickingSecondModel {
  const factory PickingSecondModel({
    Header? header,
    @Default('') String resultCode,
    @Default('')String resultMessage,
    List<dynamic>? body,
  }) = _PickingSecondModel;

  factory PickingSecondModel.fromJson(Map<String, dynamic> json) => _$PickingSecondModelFromJson(json);
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
class Body with _$Body {
  const factory Body({
    @Default(false) bool resultValue,
    @Default(0) int resultRowCount,
    @Default('') String resultCode,
    @Default('') String resultMessage,
    @Default('') String errorState,
    @Default('') String errorProcedure,
    @Default('') String returnMessage,
    List<FreedomTableBodyCell>? rows,
  }) = _Body;

  factory Body.fromJson(Map<String, dynamic> json) => _$BodyFromJson(json);
}

@freezed
class FreedomTableBodyCell with _$FreedomTableBodyCell {
  const factory FreedomTableBodyCell({
    @Default(0) int pickRank,
    @Default(0) int pickOrdQtyRowspan,
    @Default('') String rackOutBtn,
    @Default('') String pjtNm,
    @Default('') String grpKey,
    @Default('') String soNo,
    @Default('') String pitmNm,
    @Default('') String itemNm,
    @Default(0) int pickOrdQty,
    @Default(0) int pitmCdRowspan,
    @Default('') String wrkNo,
    @Default(0) int wrkNoRowspan,
    @Default('') String pickNo,
    @Default('') String othRackOutBtn,
    @Default(0) int soNoRowspan,
    @Default(0) int pjtNmRowspan,
    @Default(false) bool selected,
    @Default(0) int pickQty,
    @Default(0) int pickRankRowspan,
    @Default('') String kYn,
    @Default(0) int othRackOutBtnRowspan,
    @Default('') String locCd,
    @Default(0) int btnHeight,
    @Default(0) int pickQtyRowspan,
    @Default(0) int pitmNmRowspan,
    @Default(0) int rackOutBtnRowspan,
    @Default(0) int cbxSeq,
    @Default('') String itemCd,
    @Default('') String pitmCd,
    @Default(0) int locCdRowspan,
    @Default(0) int pickSeq,
    @Default('') String plant,
    @Default(false) bool othRackOutBtnVisible,
    @Default(0) int pickNoRowspan,
    @Default('') String mstKey,
    @Default('') String cbxNo,
  }) = _FreedomTableBodyCell;

  factory FreedomTableBodyCell.fromJson(Map<String, dynamic> json) => _$FreedomTableBodyCellFromJson(json);
}

