// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'small_kit_new3_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SmallKitNew3ModelImpl _$$SmallKitNew3ModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SmallKitNew3ModelImpl(
      header: json['header'] == null
          ? null
          : Header.fromJson(json['header'] as Map<String, dynamic>),
      resultCode: json['resultCode'] as String? ?? '',
      resultMessage: json['resultMessage'] as String? ?? '',
      body: json['body'] as List<dynamic>?,
    );

Map<String, dynamic> _$$SmallKitNew3ModelImplToJson(
        _$SmallKitNew3ModelImpl instance) =>
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

_$BodyItemImpl _$$BodyItemImplFromJson(Map<String, dynamic> json) =>
    _$BodyItemImpl(
      resultValue: json['resultValue'] as bool? ?? false,
      resultRowCount: (json['resultRowCount'] as num?)?.toInt() ?? 0,
      resultCode: json['resultCode'] as String? ?? '',
      resultMessage: json['resultMessage'] ?? '',
      errorState: json['errorState'] ?? '',
      errorProcedure: json['errorProcedure'] ?? '',
      returnMessage: json['returnMessage'] ?? '',
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

_$SubBodyItemImpl _$$SubBodyItemImplFromJson(Map<String, dynamic> json) =>
    _$SubBodyItemImpl(
      scanNo: json['scanNo'] as String? ?? '',
      wrkSeq: (json['wrkSeq'] as num?)?.toInt() ?? 0,
      qtyUnit: json['qtyUnit'] as String? ?? '',
      syncYn: json['syncYn'] as String? ?? '',
      itemCd: json['itemCd'] as String? ?? '',
      cbxSuNo: json['cbxSuNo'] as String? ?? '',
      cbxSuSeq: json['cbxSuSeq'] as String? ?? '',
      itemNm: json['itemNm'] as String? ?? '',
      btn: json['btn'] as String? ?? '',
      wrkQty: (json['wrkQty'] as num?)?.toInt() ?? 0,
      ncbxRmk: json['ncbxRmk'] as String? ?? '',
      vendNm: json['vendNm'] as String? ?? '',
      sboxNo: json['sboxNo'] as String? ?? '',
      bomQty: (json['bomQty'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$SubBodyItemImplToJson(_$SubBodyItemImpl instance) =>
    <String, dynamic>{
      'scanNo': instance.scanNo,
      'wrkSeq': instance.wrkSeq,
      'qtyUnit': instance.qtyUnit,
      'syncYn': instance.syncYn,
      'itemCd': instance.itemCd,
      'cbxSuNo': instance.cbxSuNo,
      'cbxSuSeq': instance.cbxSuSeq,
      'itemNm': instance.itemNm,
      'btn': instance.btn,
      'wrkQty': instance.wrkQty,
      'ncbxRmk': instance.ncbxRmk,
      'vendNm': instance.vendNm,
      'sboxNo': instance.sboxNo,
      'bomQty': instance.bomQty,
    };
