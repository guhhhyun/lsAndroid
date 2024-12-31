// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rack_ipgo_today_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RackIpgoTodayModelImpl _$$RackIpgoTodayModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RackIpgoTodayModelImpl(
      header: json['header'] == null
          ? null
          : Header.fromJson(json['header'] as Map<String, dynamic>),
      resultCode: json['resultCode'] as String? ?? '',
      resultMessage: json['resultMessage'] as String? ?? '',
      body: json['body'] as List<dynamic>?,
      hasError: json['hasError'] as bool? ?? false,
    );

Map<String, dynamic> _$$RackIpgoTodayModelImplToJson(
        _$RackIpgoTodayModelImpl instance) =>
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

_$BodyDataImpl _$$BodyDataImplFromJson(Map<String, dynamic> json) =>
    _$BodyDataImpl(
      resultValue: json['resultValue'] as bool? ?? false,
      resultRowCount: (json['resultRowCount'] as num?)?.toInt() ?? 0,
      resultCode: json['resultCode'] as String? ?? '',
      resultMessage: json['resultMessage'] as String? ?? '',
      errorState: json['errorState'] as String? ?? '',
      errorProcedure: json['errorProcedure'] as String? ?? '',
      returnMessage: json['returnMessage'] as String? ?? '',
    );

Map<String, dynamic> _$$BodyDataImplToJson(_$BodyDataImpl instance) =>
    <String, dynamic>{
      'resultValue': instance.resultValue,
      'resultRowCount': instance.resultRowCount,
      'resultCode': instance.resultCode,
      'resultMessage': instance.resultMessage,
      'errorState': instance.errorState,
      'errorProcedure': instance.errorProcedure,
      'returnMessage': instance.returnMessage,
    };

_$ItemDataImpl _$$ItemDataImplFromJson(Map<String, dynamic> json) =>
    _$ItemDataImpl(
      qtyUnit: json['qtyUnit'] as String? ?? '',
      qty: json['qty'] as String? ?? '',
      itemNm: json['itemNm'] as String? ?? '',
      locCd: json['locCd'] as String? ?? '',
      itemCd: json['itemCd'] as String? ?? '',
      updDttm: json['updDttm'] as String? ?? '',
    );

Map<String, dynamic> _$$ItemDataImplToJson(_$ItemDataImpl instance) =>
    <String, dynamic>{
      'qtyUnit': instance.qtyUnit,
      'qty': instance.qty,
      'itemNm': instance.itemNm,
      'locCd': instance.locCd,
      'itemCd': instance.itemCd,
      'updDttm': instance.updDttm,
    };
