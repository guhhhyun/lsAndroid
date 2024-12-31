// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'other_kit_new_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OtherKitNewModelImpl _$$OtherKitNewModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OtherKitNewModelImpl(
      header: json['header'] == null
          ? null
          : Header.fromJson(json['header'] as Map<String, dynamic>),
      resultCode: json['resultCode'] as String? ?? '',
      resultMessage: json['resultMessage'] as String? ?? '',
      body: json['body'] as List<dynamic>?,
    );

Map<String, dynamic> _$$OtherKitNewModelImplToJson(
        _$OtherKitNewModelImpl instance) =>
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
      cbxExSeq: (json['cbxExSeq'] as num?)?.toInt() ?? 0,
      tagNo: json['tagNo'] as String? ?? '',
      cancleFlag: (json['cancleFlag'] as num?)?.toInt() ?? 0,
      convQty: (json['convQty'] as num?)?.toDouble() ?? 0,
      wrkQty: (json['wrkQty'] as num?)?.toInt() ?? 0,
      oderQty: (json['oderQty'] as num?)?.toInt() ?? 0,
      qrNo: json['qrNo'] as String? ?? '',
    );

Map<String, dynamic> _$$SubBodyItemImplToJson(_$SubBodyItemImpl instance) =>
    <String, dynamic>{
      'cbxExSeq': instance.cbxExSeq,
      'tagNo': instance.tagNo,
      'cancleFlag': instance.cancleFlag,
      'convQty': instance.convQty,
      'wrkQty': instance.wrkQty,
      'oderQty': instance.oderQty,
      'qrNo': instance.qrNo,
    };
