// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ipgo_cheburn_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IpgoCheburnModelImpl _$$IpgoCheburnModelImplFromJson(
        Map<String, dynamic> json) =>
    _$IpgoCheburnModelImpl(
      header: json['header'] == null
          ? null
          : Header.fromJson(json['header'] as Map<String, dynamic>),
      resultCode: json['resultCode'] as String? ?? '',
      resultMessage: json['resultMessage'] as String? ?? '',
      body: json['body'] as List<dynamic>?,
      hasError: json['hasError'] as bool? ?? false,
    );

Map<String, dynamic> _$$IpgoCheburnModelImplToJson(
        _$IpgoCheburnModelImpl instance) =>
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

_$InbLotImpl _$$InbLotImplFromJson(Map<String, dynamic> json) => _$InbLotImpl(
      inbLotNo: json['inbLotNo'] as String? ?? '',
      inbNo: json['inbNo'] as String? ?? '',
    );

Map<String, dynamic> _$$InbLotImplToJson(_$InbLotImpl instance) =>
    <String, dynamic>{
      'inbLotNo': instance.inbLotNo,
      'inbNo': instance.inbNo,
    };
