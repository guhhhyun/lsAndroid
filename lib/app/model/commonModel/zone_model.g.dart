// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zone_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ZoneModelImpl _$$ZoneModelImplFromJson(Map<String, dynamic> json) =>
    _$ZoneModelImpl(
      header: json['header'] == null
          ? null
          : Header.fromJson(json['header'] as Map<String, dynamic>),
      resultCode: json['resultCode'] as String? ?? '',
      resultMessage: json['resultMessage'] as String? ?? '',
      body: json['body'] as List<dynamic>?,
      hasError: json['hasError'] as bool? ?? false,
    );

Map<String, dynamic> _$$ZoneModelImplToJson(_$ZoneModelImpl instance) =>
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
      orders: json['orders'] as String? ?? '',
      chnlCd: json['chnlCd'] as String? ?? '',
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

_$ZoneImpl _$$ZoneImplFromJson(Map<String, dynamic> json) => _$ZoneImpl(
      PLANT: json['PLANT'] as String? ?? '',
      UPD_USR_IP: json['UPD_USR_IP'] ?? '',
      REG_USR_IP: json['REG_USR_IP'] ?? '',
      WH_CD: json['WH_CD'] as String? ?? '',
      REG_DTTM: json['REG_DTTM'] ?? '',
      UPD_DTTM: json['UPD_DTTM'] ?? '',
      DEL_USR_IP: json['DEL_USR_IP'] ?? '',
      ZONE_RANK: json['ZONE_RANK'] ?? '',
      REG_USR_ID: json['REG_USR_ID'] ?? '',
      DEL_YN: json['DEL_YN'] as String? ?? '',
      USE_YN: json['USE_YN'] as String? ?? '',
      DEL_DTTM: json['DEL_DTTM'] ?? '',
      UPD_USR_ID: json['UPD_USR_ID'] ?? '',
      ZONE_NM: json['ZONE_NM'] as String? ?? '',
      DEL_USR_ID: json['DEL_USR_ID'] ?? '',
      SORT_NO: json['SORT_NO'] as String? ?? '',
      REMARK: json['REMARK'] ?? '',
      ZONE_CD: json['ZONE_CD'] as String? ?? '',
      ZONE_TYPE: json['ZONE_TYPE'] as String? ?? '',
    );

Map<String, dynamic> _$$ZoneImplToJson(_$ZoneImpl instance) =>
    <String, dynamic>{
      'PLANT': instance.PLANT,
      'UPD_USR_IP': instance.UPD_USR_IP,
      'REG_USR_IP': instance.REG_USR_IP,
      'WH_CD': instance.WH_CD,
      'REG_DTTM': instance.REG_DTTM,
      'UPD_DTTM': instance.UPD_DTTM,
      'DEL_USR_IP': instance.DEL_USR_IP,
      'ZONE_RANK': instance.ZONE_RANK,
      'REG_USR_ID': instance.REG_USR_ID,
      'DEL_YN': instance.DEL_YN,
      'USE_YN': instance.USE_YN,
      'DEL_DTTM': instance.DEL_DTTM,
      'UPD_USR_ID': instance.UPD_USR_ID,
      'ZONE_NM': instance.ZONE_NM,
      'DEL_USR_ID': instance.DEL_USR_ID,
      'SORT_NO': instance.SORT_NO,
      'REMARK': instance.REMARK,
      'ZONE_CD': instance.ZONE_CD,
      'ZONE_TYPE': instance.ZONE_TYPE,
    };
