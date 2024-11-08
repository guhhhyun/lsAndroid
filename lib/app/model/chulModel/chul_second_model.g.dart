// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chul_second_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChulSecondModelImpl _$$ChulSecondModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ChulSecondModelImpl(
      header: json['header'] == null
          ? null
          : Header.fromJson(json['header'] as Map<String, dynamic>),
      resultCode: json['resultCode'] as String? ?? '',
      resultMessage: json['resultMessage'] as String? ?? '',
      body: json['body'] as List<dynamic>?,
      hasError: json['hasError'] as bool? ?? false,
    );

Map<String, dynamic> _$$ChulSecondModelImplToJson(
        _$ChulSecondModelImpl instance) =>
    <String, dynamic>{
      'header': instance.header,
      'resultCode': instance.resultCode,
      'resultMessage': instance.resultMessage,
      'body': instance.body,
      'hasError': instance.hasError,
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

_$BodyItemImpl _$$BodyItemImplFromJson(Map<String, dynamic> json) =>
    _$BodyItemImpl(
      resultValue: json['resultValue'] as bool? ?? false,
      resultRowCount: (json['resultRowCount'] as num?)?.toInt() ?? 0,
      resultCode: json['resultCode'] as String? ?? '',
      resultMessage: json['resultMessage'] as String? ?? '',
      errorState: json['errorState'] as String? ?? '',
      errorProcedure: json['errorProcedure'] as String? ?? '',
      returnMessage: json['returnMessage'] as String? ?? '',
    );

Map<String, dynamic> _$$BodyItemImplToJson(_$BodyItemImpl instance) =>
    <String, dynamic>{
      'resultValue': instance.resultValue,
      'resultRowCount': instance.resultRowCount,
      'resultCode': instance.resultCode,
      'resultMessage': instance.resultMessage,
      'errorState': instance.errorState,
      'errorProcedure': instance.errorProcedure,
      'returnMessage': instance.returnMessage,
    };

_$DetailItemImpl _$$DetailItemImplFromJson(Map<String, dynamic> json) =>
    _$DetailItemImpl(
      otbYn: json['otbYn'] as String? ?? '',
      no: (json['no'] as num?)?.toInt() ?? 0,
      grpKey: json['grpKey'] as String? ?? '',
      scan: json['scan'] as bool? ?? false,
      pitmNm: json['pitmNm'] as String? ?? '',
      itemNm: json['itemNm'] ?? '',
      selectedRowspan: (json['selectedRowspan'] as num?)?.toInt() ?? 0,
      otbYnRowspan: (json['otbYnRowspan'] as num?)?.toInt() ?? 0,
      pitmCdRowspan: (json['pitmCdRowspan'] as num?)?.toInt() ?? 0,
      delOrdNo: json['delOrdNo'] as String? ?? '',
      wrkNo: json['wrkNo'] as String? ?? '',
      wrkNoRowspan: (json['wrkNoRowspan'] as num?)?.toInt() ?? 0,
      ordSortRowspan: (json['ordSortRowspan'] as num?)?.toInt() ?? 0,
      noRowspan: (json['noRowspan'] as num?)?.toInt() ?? 0,
      checked: json['checked'] as bool? ?? false,
      scanRowspan: (json['scanRowspan'] as num?)?.toInt() ?? 0,
      wrkCfmYnNm: json['wrkCfmYnNm'] as String? ?? '',
      ordSort: (json['ordSort'] as num?)?.toInt() ?? 0,
      selected: json['selected'] as bool? ?? false,
      delOrdSeq: (json['delOrdSeq'] as num?)?.toInt() ?? 0,
      locCd: json['locCd'] as String?,
      wrkCfmYn: json['wrkCfmYn'] as String? ?? '',
      checkedRowspan: (json['checkedRowspan'] as num?)?.toInt() ?? 0,
      boxNoRowspan: (json['boxNoRowspan'] as num?)?.toInt() ?? 0,
      boxNmRowspan: (json['boxNmRowspan'] as num?)?.toInt() ?? 0,
      pitmNmRowspan: (json['pitmNmRowspan'] as num?)?.toInt() ?? 0,
      tagNo: json['tagNo'] as String? ?? '',
      itemCd: json['itemCd'] as String? ?? '',
      wrkCfmYnNmRowspan: (json['wrkCfmYnNmRowspan'] as num?)?.toInt() ?? 0,
      pitmCd: json['pitmCd'] as String? ?? '',
      locCdRowspan: (json['locCdRowspan'] as num?)?.toInt() ?? 0,
      cbxQty: (json['cbxQty'] as num?)?.toInt() ?? 0,
      tagNoRowspan: (json['tagNoRowspan'] as num?)?.toInt() ?? 0,
      boxNm: json['boxNm'] ?? '',
      boxNo: json['boxNo'] as String? ?? '',
      plant: json['plant'] as String? ?? '',
      mstKey: json['mstKey'] as String? ?? '',
    );

Map<String, dynamic> _$$DetailItemImplToJson(_$DetailItemImpl instance) =>
    <String, dynamic>{
      'otbYn': instance.otbYn,
      'no': instance.no,
      'grpKey': instance.grpKey,
      'scan': instance.scan,
      'pitmNm': instance.pitmNm,
      'itemNm': instance.itemNm,
      'selectedRowspan': instance.selectedRowspan,
      'otbYnRowspan': instance.otbYnRowspan,
      'pitmCdRowspan': instance.pitmCdRowspan,
      'delOrdNo': instance.delOrdNo,
      'wrkNo': instance.wrkNo,
      'wrkNoRowspan': instance.wrkNoRowspan,
      'ordSortRowspan': instance.ordSortRowspan,
      'noRowspan': instance.noRowspan,
      'checked': instance.checked,
      'scanRowspan': instance.scanRowspan,
      'wrkCfmYnNm': instance.wrkCfmYnNm,
      'ordSort': instance.ordSort,
      'selected': instance.selected,
      'delOrdSeq': instance.delOrdSeq,
      'locCd': instance.locCd,
      'wrkCfmYn': instance.wrkCfmYn,
      'checkedRowspan': instance.checkedRowspan,
      'boxNoRowspan': instance.boxNoRowspan,
      'boxNmRowspan': instance.boxNmRowspan,
      'pitmNmRowspan': instance.pitmNmRowspan,
      'tagNo': instance.tagNo,
      'itemCd': instance.itemCd,
      'wrkCfmYnNmRowspan': instance.wrkCfmYnNmRowspan,
      'pitmCd': instance.pitmCd,
      'locCdRowspan': instance.locCdRowspan,
      'cbxQty': instance.cbxQty,
      'tagNoRowspan': instance.tagNoRowspan,
      'boxNm': instance.boxNm,
      'boxNo': instance.boxNo,
      'plant': instance.plant,
      'mstKey': instance.mstKey,
    };
