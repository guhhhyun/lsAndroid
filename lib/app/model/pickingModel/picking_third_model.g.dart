// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'picking_third_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PickingThirdModelImpl _$$PickingThirdModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PickingThirdModelImpl(
      header: json['header'] == null
          ? null
          : Header.fromJson(json['header'] as Map<String, dynamic>),
      resultCode: json['resultCode'] as String? ?? '',
      resultMessage: json['resultMessage'] as String? ?? '',
      body: json['body'] as List<dynamic>?,
      hasError: json['hasError'] as bool? ?? false,
    );

Map<String, dynamic> _$$PickingThirdModelImplToJson(
        _$PickingThirdModelImpl instance) =>
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

_$BodyResultImpl _$$BodyResultImplFromJson(Map<String, dynamic> json) =>
    _$BodyResultImpl(
      resultValue: json['resultValue'] as bool? ?? false,
      resultRowCount: (json['resultRowCount'] as num?)?.toInt() ?? 0,
      resultCode: json['resultCode'] as String? ?? '',
      resultMessage: json['resultMessage'] as String? ?? '',
      errorState: json['errorState'] as String? ?? '',
      errorProcedure: json['errorProcedure'] as String? ?? '',
      returnMessage: json['returnMessage'] as String? ?? '',
    );

Map<String, dynamic> _$$BodyResultImplToJson(_$BodyResultImpl instance) =>
    <String, dynamic>{
      'resultValue': instance.resultValue,
      'resultRowCount': instance.resultRowCount,
      'resultCode': instance.resultCode,
      'resultMessage': instance.resultMessage,
      'errorState': instance.errorState,
      'errorProcedure': instance.errorProcedure,
      'returnMessage': instance.returnMessage,
    };

_$BodyItemImpl _$$BodyItemImplFromJson(Map<String, dynamic> json) =>
    _$BodyItemImpl(
      locCd: json['locCd'] as String? ?? '',
      whCd: json['whCd'] as String? ?? '',
      pjtNm: json['pjtNm'] as String? ?? '',
      locSeq: (json['locSeq'] as num?)?.toInt() ?? 0,
      itemCd: json['itemCd'] as String? ?? '',
      tagNo: json['tagNo'] as String? ?? '',
      pitmNm: json['pitmNm'] as String? ?? '',
      itemNm: json['itemNm'] as String? ?? '',
      pitmCd: json['pitmCd'] as String? ?? '',
      zoneCd: json['zoneCd'] as String? ?? '',
      inbLotNo: json['inbLotNo'] as String? ?? '',
      wrkNo: json['wrkNo'] as String? ?? '',
      lotNo: json['lotNo'] ?? '',
      boxNo: json['boxNo'] ?? '',
      plant: json['plant'] as String? ?? '',
      qty: (json['qty'] as num?)?.toDouble() ?? 0.0,
      mstKey: json['mstKey'] as String? ?? '',
      inbLotSeq: (json['inbLotSeq'] as num?)?.toInt() ?? 0,
      selected: json['selected'] as bool? ?? false,
      pickQty: (json['pickQty'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$BodyItemImplToJson(_$BodyItemImpl instance) =>
    <String, dynamic>{
      'locCd': instance.locCd,
      'whCd': instance.whCd,
      'pjtNm': instance.pjtNm,
      'locSeq': instance.locSeq,
      'itemCd': instance.itemCd,
      'tagNo': instance.tagNo,
      'pitmNm': instance.pitmNm,
      'itemNm': instance.itemNm,
      'pitmCd': instance.pitmCd,
      'zoneCd': instance.zoneCd,
      'inbLotNo': instance.inbLotNo,
      'wrkNo': instance.wrkNo,
      'lotNo': instance.lotNo,
      'boxNo': instance.boxNo,
      'plant': instance.plant,
      'qty': instance.qty,
      'mstKey': instance.mstKey,
      'inbLotSeq': instance.inbLotSeq,
      'selected': instance.selected,
      'pickQty': instance.pickQty,
    };
