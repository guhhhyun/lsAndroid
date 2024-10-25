// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'picking_second_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PickingSecondModelImpl _$$PickingSecondModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PickingSecondModelImpl(
      header: json['header'] == null
          ? null
          : Header.fromJson(json['header'] as Map<String, dynamic>),
      resultCode: json['resultCode'] as String? ?? '',
      resultMessage: json['resultMessage'] as String? ?? '',
      body: json['body'] as List<dynamic>?,
    );

Map<String, dynamic> _$$PickingSecondModelImplToJson(
        _$PickingSecondModelImpl instance) =>
    <String, dynamic>{
      'header': instance.header,
      'resultCode': instance.resultCode,
      'resultMessage': instance.resultMessage,
      'body': instance.body,
    };

_$HeaderImpl _$$HeaderImplFromJson(Map<String, dynamic> json) => _$HeaderImpl(
      currentPage: (json['currentPage'] as num?)?.toInt() ?? 0,
      pageSize: (json['pageSize'] as num?)?.toInt() ?? 0,
      totalRecords: (json['totalRecords'] as num?)?.toInt() ?? 0,
      orders: json['orders'] ?? '',
      chnlCd: json['chnlCd'] ?? '',
    );

Map<String, dynamic> _$$HeaderImplToJson(_$HeaderImpl instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'pageSize': instance.pageSize,
      'totalRecords': instance.totalRecords,
      'orders': instance.orders,
      'chnlCd': instance.chnlCd,
    };

_$BodyImpl _$$BodyImplFromJson(Map<String, dynamic> json) => _$BodyImpl(
      resultValue: json['resultValue'] as bool? ?? false,
      resultRowCount: (json['resultRowCount'] as num?)?.toInt() ?? 0,
      resultCode: json['resultCode'] as String? ?? '',
      resultMessage: json['resultMessage'] as String? ?? '',
      errorState: json['errorState'] as String? ?? '',
      errorProcedure: json['errorProcedure'] as String? ?? '',
      returnMessage: json['returnMessage'] as String? ?? '',
      rows: (json['rows'] as List<dynamic>?)
          ?.map((e) => FreedomTableBodyCell.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BodyImplToJson(_$BodyImpl instance) =>
    <String, dynamic>{
      'resultValue': instance.resultValue,
      'resultRowCount': instance.resultRowCount,
      'resultCode': instance.resultCode,
      'resultMessage': instance.resultMessage,
      'errorState': instance.errorState,
      'errorProcedure': instance.errorProcedure,
      'returnMessage': instance.returnMessage,
      'rows': instance.rows,
    };

_$FreedomTableBodyCellImpl _$$FreedomTableBodyCellImplFromJson(
        Map<String, dynamic> json) =>
    _$FreedomTableBodyCellImpl(
      pickRank: (json['pickRank'] as num?)?.toInt() ?? 0,
      pickOrdQtyRowspan: (json['pickOrdQtyRowspan'] as num?)?.toInt() ?? 0,
      rackOutBtn: json['rackOutBtn'] as String? ?? '',
      pjtNm: json['pjtNm'] as String? ?? '',
      grpKey: json['grpKey'] as String? ?? '',
      soNo: json['soNo'] as String? ?? '',
      pitmNm: json['pitmNm'] as String? ?? '',
      itemNm: json['itemNm'] as String? ?? '',
      pickOrdQty: (json['pickOrdQty'] as num?)?.toInt() ?? 0,
      pitmCdRowspan: (json['pitmCdRowspan'] as num?)?.toInt() ?? 0,
      wrkNo: json['wrkNo'] as String? ?? '',
      wrkNoRowspan: (json['wrkNoRowspan'] as num?)?.toInt() ?? 0,
      pickNo: json['pickNo'] as String? ?? '',
      othRackOutBtn: json['othRackOutBtn'] as String? ?? '',
      soNoRowspan: (json['soNoRowspan'] as num?)?.toInt() ?? 0,
      pjtNmRowspan: (json['pjtNmRowspan'] as num?)?.toInt() ?? 0,
      selected: json['selected'] as bool? ?? false,
      pickQty: (json['pickQty'] as num?)?.toInt() ?? 0,
      pickRankRowspan: (json['pickRankRowspan'] as num?)?.toInt() ?? 0,
      kYn: json['kYn'] as String? ?? '',
      othRackOutBtnRowspan:
          (json['othRackOutBtnRowspan'] as num?)?.toInt() ?? 0,
      locCd: json['locCd'] as String? ?? '',
      btnHeight: (json['btnHeight'] as num?)?.toInt() ?? 0,
      pickQtyRowspan: (json['pickQtyRowspan'] as num?)?.toInt() ?? 0,
      pitmNmRowspan: (json['pitmNmRowspan'] as num?)?.toInt() ?? 0,
      rackOutBtnRowspan: (json['rackOutBtnRowspan'] as num?)?.toInt() ?? 0,
      cbxSeq: (json['cbxSeq'] as num?)?.toInt() ?? 0,
      itemCd: json['itemCd'] as String? ?? '',
      pitmCd: json['pitmCd'] as String? ?? '',
      locCdRowspan: (json['locCdRowspan'] as num?)?.toInt() ?? 0,
      pickSeq: (json['pickSeq'] as num?)?.toInt() ?? 0,
      plant: json['plant'] as String? ?? '',
      othRackOutBtnVisible: json['othRackOutBtnVisible'] as bool? ?? false,
      pickNoRowspan: (json['pickNoRowspan'] as num?)?.toInt() ?? 0,
      mstKey: json['mstKey'] as String? ?? '',
      cbxNo: json['cbxNo'] as String? ?? '',
    );

Map<String, dynamic> _$$FreedomTableBodyCellImplToJson(
        _$FreedomTableBodyCellImpl instance) =>
    <String, dynamic>{
      'pickRank': instance.pickRank,
      'pickOrdQtyRowspan': instance.pickOrdQtyRowspan,
      'rackOutBtn': instance.rackOutBtn,
      'pjtNm': instance.pjtNm,
      'grpKey': instance.grpKey,
      'soNo': instance.soNo,
      'pitmNm': instance.pitmNm,
      'itemNm': instance.itemNm,
      'pickOrdQty': instance.pickOrdQty,
      'pitmCdRowspan': instance.pitmCdRowspan,
      'wrkNo': instance.wrkNo,
      'wrkNoRowspan': instance.wrkNoRowspan,
      'pickNo': instance.pickNo,
      'othRackOutBtn': instance.othRackOutBtn,
      'soNoRowspan': instance.soNoRowspan,
      'pjtNmRowspan': instance.pjtNmRowspan,
      'selected': instance.selected,
      'pickQty': instance.pickQty,
      'pickRankRowspan': instance.pickRankRowspan,
      'kYn': instance.kYn,
      'othRackOutBtnRowspan': instance.othRackOutBtnRowspan,
      'locCd': instance.locCd,
      'btnHeight': instance.btnHeight,
      'pickQtyRowspan': instance.pickQtyRowspan,
      'pitmNmRowspan': instance.pitmNmRowspan,
      'rackOutBtnRowspan': instance.rackOutBtnRowspan,
      'cbxSeq': instance.cbxSeq,
      'itemCd': instance.itemCd,
      'pitmCd': instance.pitmCd,
      'locCdRowspan': instance.locCdRowspan,
      'pickSeq': instance.pickSeq,
      'plant': instance.plant,
      'othRackOutBtnVisible': instance.othRackOutBtnVisible,
      'pickNoRowspan': instance.pickNoRowspan,
      'mstKey': instance.mstKey,
      'cbxNo': instance.cbxNo,
    };
