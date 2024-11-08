// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chul_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChulModelImpl _$$ChulModelImplFromJson(Map<String, dynamic> json) =>
    _$ChulModelImpl(
      header: json['header'] == null
          ? null
          : Header.fromJson(json['header'] as Map<String, dynamic>),
      resultCode: json['resultCode'] as String? ?? '',
      resultMessage: json['resultMessage'] as String? ?? '',
      body: json['body'] as List<dynamic>?,
      hasError: json['hasError'] as bool? ?? false,
    );

Map<String, dynamic> _$$ChulModelImplToJson(_$ChulModelImpl instance) =>
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
      pjtNm: json['pjtNm'] as String? ?? '',
      soNo: json['soNo'] as String? ?? '',
      bomChgSts: json['bomChgSts'] as String? ?? '',
      remark: json['remark'] as String? ?? '',
      otbNo: json['otbNo'] as String? ?? '',
      delOrdTypeNm: json['delOrdTypeNm'] ?? '',
      otbPsbSts: json['otbPsbSts'] as String? ?? '',
      delOrdNo: json['delOrdNo'] as String? ?? '',
      kitCfmSts: json['kitCfmSts'] as String? ?? '',
      delPreDt: json['delPreDt'] as String? ?? '',
      mstKey: json['mstKey'] as String? ?? '',
      delOrdType: json['delOrdType'] as String? ?? '',
      selected: json['selected'] as bool? ?? false,
    );

Map<String, dynamic> _$$DetailItemImplToJson(_$DetailItemImpl instance) =>
    <String, dynamic>{
      'pjtNm': instance.pjtNm,
      'soNo': instance.soNo,
      'bomChgSts': instance.bomChgSts,
      'remark': instance.remark,
      'otbNo': instance.otbNo,
      'delOrdTypeNm': instance.delOrdTypeNm,
      'otbPsbSts': instance.otbPsbSts,
      'delOrdNo': instance.delOrdNo,
      'kitCfmSts': instance.kitCfmSts,
      'delPreDt': instance.delPreDt,
      'mstKey': instance.mstKey,
      'delOrdType': instance.delOrdType,
      'selected': instance.selected,
    };
