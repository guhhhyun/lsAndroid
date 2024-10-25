// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rack_ipgo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RackIpgoModelImpl _$$RackIpgoModelImplFromJson(Map<String, dynamic> json) =>
    _$RackIpgoModelImpl(
      header: json['header'] == null
          ? null
          : Header.fromJson(json['header'] as Map<String, dynamic>),
      resultCode: json['resultCode'] as String? ?? '',
      resultMessage: json['resultMessage'] as String? ?? '',
      body: json['body'] as List<dynamic>?,
      hasError: json['hasError'] as bool? ?? false,
    );

Map<String, dynamic> _$$RackIpgoModelImplToJson(_$RackIpgoModelImpl instance) =>
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
      QTY_UNIT: json['QTY_UNIT'] as String? ?? '',
      QR_NO: json['QR_NO'] as String? ?? '',
      ITEM_NM: json['ITEM_NM'] as String? ?? '',
      LOC_CD: json['LOC_CD'] as String? ?? '',
      LAST_LOC: json['LAST_LOC'] as String? ?? '',
      CUST_CD: json['CUST_CD'] ?? '',
      QTY: (json['QTY'] as num?)?.toDouble() ?? 0.0,
      VEND_NM: json['VEND_NM'] ?? '',
      ZONE_NM: json['ZONE_NM'] as String? ?? '',
      REMARK: json['REMARK'] ?? '',
      WHT_UNIT: json['WHT_UNIT'] ?? '',
      PRT_NO: json['PRT_NO'] ?? '',
      BOX_WHT: json['BOX_WHT'] ?? '',
      WHT: json['WHT'] ?? '',
      ITEM_CD: json['ITEM_CD'] as String? ?? '',
      LOC_DT: json['LOC_DT'] as String? ?? '',
      TAG_NO: json['TAG_NO'] as String? ?? '',
      INB_YN: json['INB_YN'] as String? ?? '',
      EXP_DT: json['EXP_DT'] ?? '',
      EXTR_VAL: json['EXTR_VAL'] ?? '',
      D_QTY: (json['D_QTY'] as num?)?.toInt() ?? 0,
      BOX_NM: json['BOX_NM'] ?? '',
      PRT_DT: json['PRT_DT'] ?? '',
      SET_QTY: json['SET_QTY'] ?? '',
      BOX_NO: json['BOX_NO'] ?? '',
      PJT_NO: json['PJT_NO'] ?? '',
      PJT_NM: json['PJT_NM'] ?? '',
      VEND_CD: json['VEND_CD'] ?? '',
      TOT_WHT: json['TOT_WHT'] ?? '',
      TAG_TYPE: json['TAG_TYPE'] as String? ?? '',
      LOT_NO: json['LOT_NO'] as String? ?? '',
      ZONE_CD: json['ZONE_CD'] as String? ?? '',
      INB_NO: json['INB_NO'] as String? ?? '',
    );

Map<String, dynamic> _$$ItemDataImplToJson(_$ItemDataImpl instance) =>
    <String, dynamic>{
      'QTY_UNIT': instance.QTY_UNIT,
      'QR_NO': instance.QR_NO,
      'ITEM_NM': instance.ITEM_NM,
      'LOC_CD': instance.LOC_CD,
      'LAST_LOC': instance.LAST_LOC,
      'CUST_CD': instance.CUST_CD,
      'QTY': instance.QTY,
      'VEND_NM': instance.VEND_NM,
      'ZONE_NM': instance.ZONE_NM,
      'REMARK': instance.REMARK,
      'WHT_UNIT': instance.WHT_UNIT,
      'PRT_NO': instance.PRT_NO,
      'BOX_WHT': instance.BOX_WHT,
      'WHT': instance.WHT,
      'ITEM_CD': instance.ITEM_CD,
      'LOC_DT': instance.LOC_DT,
      'TAG_NO': instance.TAG_NO,
      'INB_YN': instance.INB_YN,
      'EXP_DT': instance.EXP_DT,
      'EXTR_VAL': instance.EXTR_VAL,
      'D_QTY': instance.D_QTY,
      'BOX_NM': instance.BOX_NM,
      'PRT_DT': instance.PRT_DT,
      'SET_QTY': instance.SET_QTY,
      'BOX_NO': instance.BOX_NO,
      'PJT_NO': instance.PJT_NO,
      'PJT_NM': instance.PJT_NM,
      'VEND_CD': instance.VEND_CD,
      'TOT_WHT': instance.TOT_WHT,
      'TAG_TYPE': instance.TAG_TYPE,
      'LOT_NO': instance.LOT_NO,
      'ZONE_CD': instance.ZONE_CD,
      'INB_NO': instance.INB_NO,
    };
