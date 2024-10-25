// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'picking_first_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PickingFirstModelImpl _$$PickingFirstModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PickingFirstModelImpl(
      header: json['header'] == null
          ? null
          : Header.fromJson(json['header'] as Map<String, dynamic>),
      resultCode: json['resultCode'] as String? ?? '',
      resultMessage: json['resultMessage'] as String? ?? '',
      body: json['body'] as List<dynamic>?,
      hasError: json['hasError'] as bool? ?? false,
    );

Map<String, dynamic> _$$PickingFirstModelImplToJson(
        _$PickingFirstModelImpl instance) =>
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

_$ResponseBodyImpl _$$ResponseBodyImplFromJson(Map<String, dynamic> json) =>
    _$ResponseBodyImpl(
      resultValue: json['resultValue'] as bool? ?? false,
      resultRowCount: (json['resultRowCount'] as num?)?.toInt() ?? 0,
      resultCode: json['resultCode'] as String? ?? '',
      resultMessage: json['resultMessage'] ?? '',
      errorState: json['errorState'] ?? '',
      errorProcedure: json['errorProcedure'] ?? '',
      returnMessage: json['returnMessage'] ?? '',
    );

Map<String, dynamic> _$$ResponseBodyImplToJson(_$ResponseBodyImpl instance) =>
    <String, dynamic>{
      'resultValue': instance.resultValue,
      'resultRowCount': instance.resultRowCount,
      'resultCode': instance.resultCode,
      'resultMessage': instance.resultMessage,
      'errorState': instance.errorState,
      'errorProcedure': instance.errorProcedure,
      'returnMessage': instance.returnMessage,
    };

_$ItemImpl _$$ItemImplFromJson(Map<String, dynamic> json) => _$ItemImpl(
      pickRank: (json['pickRank'] as num?)?.toInt() ?? 0,
      pickUser: json['pickUser'] as String? ?? '',
      rackOutBtn: json['rackOutBtn'] as String? ?? '',
      pjtNm: json['pjtNm'] as String? ?? '',
      grpKey: json['grpKey'] as String? ?? '',
      cbxSeq: (json['cbxSeq'] as num?)?.toInt() ?? 0,
      itemCd: json['itemCd'] as String? ?? '',
      itemNm: json['itemNm'] as String? ?? '',
      wrkNo: json['wrkNo'] as String? ?? '',
      pickSeq: (json['pickSeq'] as num?)?.toInt() ?? 0,
      plant: json['plant'] as String? ?? '',
      pickNo: json['pickNo'] as String? ?? '',
      pickUserNm: json['pickUserNm'] as String? ?? '',
      mstKey: json['mstKey'] as String? ?? '',
      cbxNo: json['cbxNo'] as String? ?? '',
      selected: json['selected'] as bool? ?? false,
    );

Map<String, dynamic> _$$ItemImplToJson(_$ItemImpl instance) =>
    <String, dynamic>{
      'pickRank': instance.pickRank,
      'pickUser': instance.pickUser,
      'rackOutBtn': instance.rackOutBtn,
      'pjtNm': instance.pjtNm,
      'grpKey': instance.grpKey,
      'cbxSeq': instance.cbxSeq,
      'itemCd': instance.itemCd,
      'itemNm': instance.itemNm,
      'wrkNo': instance.wrkNo,
      'pickSeq': instance.pickSeq,
      'plant': instance.plant,
      'pickNo': instance.pickNo,
      'pickUserNm': instance.pickUserNm,
      'mstKey': instance.mstKey,
      'cbxNo': instance.cbxNo,
      'selected': instance.selected,
    };
