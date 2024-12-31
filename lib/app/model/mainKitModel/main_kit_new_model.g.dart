// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_kit_new_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MainKitNewModelImpl _$$MainKitNewModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MainKitNewModelImpl(
      header: json['header'] == null
          ? null
          : Header.fromJson(json['header'] as Map<String, dynamic>),
      resultCode: json['resultCode'] as String? ?? '',
      resultMessage: json['resultMessage'] as String? ?? '',
      body: json['body'] as List<dynamic>?,
    );

Map<String, dynamic> _$$MainKitNewModelImplToJson(
        _$MainKitNewModelImpl instance) =>
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
      wrkCfmYn: json['wrkCfmYn'] as String? ?? '',
      wrkCfmDttm: json['wrkCfmDttm'] as String? ?? '',
      boxWht2: json['boxWht2'] as String? ?? '',
      tagNo: json['tagNo'] as String? ?? '',
      cbxMaNo: json['cbxMaNo'] as String? ?? '',
      pitmNm: json['pitmNm'] as String? ?? '',
      pitmCd: json['pitmCd'] as String? ?? '',
      wrkRemark: json['wrkRemark'] as String? ?? '',
      pjtNm2: json['pjtNm2'] as String? ?? '',
      setQty: (json['setQty'] as num?)?.toInt() ?? 0,
      boxWht: json['boxWht'] as String? ?? '',
      qrNo: json['qrNo'] as String? ?? '',
      tagType: json['tagType'] as String? ?? '',
      otbDt: json['otbDt'] as String? ?? '',
    );

Map<String, dynamic> _$$SubBodyItemImplToJson(_$SubBodyItemImpl instance) =>
    <String, dynamic>{
      'wrkCfmYn': instance.wrkCfmYn,
      'wrkCfmDttm': instance.wrkCfmDttm,
      'boxWht2': instance.boxWht2,
      'tagNo': instance.tagNo,
      'cbxMaNo': instance.cbxMaNo,
      'pitmNm': instance.pitmNm,
      'pitmCd': instance.pitmCd,
      'wrkRemark': instance.wrkRemark,
      'pjtNm2': instance.pjtNm2,
      'setQty': instance.setQty,
      'boxWht': instance.boxWht,
      'qrNo': instance.qrNo,
      'tagType': instance.tagType,
      'otbDt': instance.otbDt,
    };
