// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_kit_new2_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MainKitNew2ModelImpl _$$MainKitNew2ModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MainKitNew2ModelImpl(
      header: json['header'] == null
          ? null
          : Header.fromJson(json['header'] as Map<String, dynamic>),
      resultCode: json['resultCode'] as String? ?? '',
      resultMessage: json['resultMessage'] as String? ?? '',
      body: json['body'] as List<dynamic>?,
    );

Map<String, dynamic> _$$MainKitNew2ModelImplToJson(
        _$MainKitNew2ModelImpl instance) =>
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
      cbxQty: (json['cbxQty'] as num?)?.toInt() ?? 0,
      cbxMaSeq: (json['cbxMaSeq'] as num?)?.toInt() ?? 0,
      setQty: (json['setQty'] as num?)?.toInt() ?? 0,
      qtyUnit: json['qtyUnit'] as String? ?? '',
      cbxSuNo: json['cbxSuNo'] as String? ?? '',
      cbxSuCnt: (json['cbxSuCnt'] as num?)?.toInt() ?? 0,
      itemCd: json['itemCd'] as String? ?? '',
      cbxMaNo: json['cbxMaNo'] as String? ?? '',
      itemNm: json['itemNm'] as String? ?? '',
      sboxNo: json['sboxNo'] as String? ?? '',
      bomQty: (json['bomQty'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$SubBodyItemImplToJson(_$SubBodyItemImpl instance) =>
    <String, dynamic>{
      'cbxQty': instance.cbxQty,
      'cbxMaSeq': instance.cbxMaSeq,
      'setQty': instance.setQty,
      'qtyUnit': instance.qtyUnit,
      'cbxSuNo': instance.cbxSuNo,
      'cbxSuCnt': instance.cbxSuCnt,
      'itemCd': instance.itemCd,
      'cbxMaNo': instance.cbxMaNo,
      'itemNm': instance.itemNm,
      'sboxNo': instance.sboxNo,
      'bomQty': instance.bomQty,
    };
