// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommonModelImpl _$$CommonModelImplFromJson(Map<String, dynamic> json) =>
    _$CommonModelImpl(
      header: json['header'] == null
          ? null
          : Header.fromJson(json['header'] as Map<String, dynamic>),
      resultCode: json['resultCode'] as String? ?? '',
      resultMessage: json['resultMessage'] as String? ?? '',
      body: json['body'] as List<dynamic>?,
      hasError: json['hasError'] as bool? ?? false,
    );

Map<String, dynamic> _$$CommonModelImplToJson(_$CommonModelImpl instance) =>
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
      orders: json['orders'],
      chnlCd: json['chnlCd'],
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

_$BodyDetailImpl _$$BodyDetailImplFromJson(Map<String, dynamic> json) =>
    _$BodyDetailImpl(
      UPD_USR_IP: json['UPD_USR_IP'] as String? ?? '',
      REG_DTTM: json['REG_DTTM'] as String? ?? '',
      LCLS_CD: json['LCLS_CD'],
      DTL_CD: json['DTL_CD'] as String? ?? '',
      GRP_CD: json['GRP_CD'] as String? ?? '',
      CD_DESC: json['CD_DESC'],
      MCLS_NM: json['MCLS_NM'],
      CD_NM: json['CD_NM'] as String? ?? '',
      UPR_DTL_CD: json['UPR_DTL_CD'],
      USE_YN: json['USE_YN'] as String? ?? '',
      ETC1: json['ETC1'],
      ETC2: json['ETC2'],
      ETC3: json['ETC3'],
      ETC4: json['ETC4'],
      ETC5: json['ETC5'],
      REG_USR_IP: json['REG_USR_IP'] as String? ?? '',
      UPR_GRP_CD: json['UPR_GRP_CD'],
      LCLS_NM: json['LCLS_NM'],
      UPD_DTTM: json['UPD_DTTM'] as String? ?? '',
      SRT_NO: (json['SRT_NO'] as num?)?.toInt() ?? 0,
      GRP_NM: json['GRP_NM'] as String? ?? '',
      CD_LEN: (json['CD_LEN'] as num?)?.toInt() ?? 0,
      MCLS_CD: json['MCLS_CD'],
      REG_USR_ID: json['REG_USR_ID'] as String? ?? '',
      RMK: json['RMK'],
      UPD_USR_ID: json['UPD_USR_ID'] as String? ?? '',
    );

Map<String, dynamic> _$$BodyDetailImplToJson(_$BodyDetailImpl instance) =>
    <String, dynamic>{
      'UPD_USR_IP': instance.UPD_USR_IP,
      'REG_DTTM': instance.REG_DTTM,
      'LCLS_CD': instance.LCLS_CD,
      'DTL_CD': instance.DTL_CD,
      'GRP_CD': instance.GRP_CD,
      'CD_DESC': instance.CD_DESC,
      'MCLS_NM': instance.MCLS_NM,
      'CD_NM': instance.CD_NM,
      'UPR_DTL_CD': instance.UPR_DTL_CD,
      'USE_YN': instance.USE_YN,
      'ETC1': instance.ETC1,
      'ETC2': instance.ETC2,
      'ETC3': instance.ETC3,
      'ETC4': instance.ETC4,
      'ETC5': instance.ETC5,
      'REG_USR_IP': instance.REG_USR_IP,
      'UPR_GRP_CD': instance.UPR_GRP_CD,
      'LCLS_NM': instance.LCLS_NM,
      'UPD_DTTM': instance.UPD_DTTM,
      'SRT_NO': instance.SRT_NO,
      'GRP_NM': instance.GRP_NM,
      'CD_LEN': instance.CD_LEN,
      'MCLS_CD': instance.MCLS_CD,
      'REG_USR_ID': instance.REG_USR_ID,
      'RMK': instance.RMK,
      'UPD_USR_ID': instance.UPD_USR_ID,
    };
