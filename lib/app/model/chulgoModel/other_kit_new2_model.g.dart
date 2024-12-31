// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'other_kit_new2_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OtherKitNew2ModelImpl _$$OtherKitNew2ModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OtherKitNew2ModelImpl(
      header: json['header'] == null
          ? null
          : Header.fromJson(json['header'] as Map<String, dynamic>),
      resultCode: json['resultCode'] as String? ?? '',
      resultMessage: json['resultMessage'] as String? ?? '',
      body: json['body'] as List<dynamic>?,
    );

Map<String, dynamic> _$$OtherKitNew2ModelImplToJson(
        _$OtherKitNew2ModelImpl instance) =>
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
      pitmNm: json['pitmNm'] as String? ?? '',
      cbxMaNo: json['cbxMaNo'] as String? ?? '',
      itemNm: json['itemNm'] as String? ?? '',
      splitSeq: (json['splitSeq'] as num?)?.toInt() ?? 0,
      wrkRemark: json['wrkRemark'] as String? ?? '',
      pjtNm2: json['pjtNm2'] as String? ?? '',
      wrkNo: json['wrkNo'] as String? ?? '',
      splitNo: json['splitNo'] as String? ?? '',
      cbxExNo: json['cbxExNo'] as String? ?? '',
      id: (json['id'] as num?)?.toInt() ?? 0,
      cbxExNm: json['cbxExNm'] as String? ?? '',
      bomQty: (json['bomQty'] as num?)?.toDouble() ?? 0.0,
      cbxSuSeq: (json['cbxSuSeq'] as num?)?.toInt() ?? 0,
      sboxSpec: json['sboxSpec'] as String? ?? '',
      wrkCfmYn: json['wrkCfmYn'] as String? ?? '',
      setCbxQty: (json['setCbxQty'] as num?)?.toDouble() ?? 0.0,
      wrkCfmDttm: json['wrkCfmDttm'] as String? ?? '',
      tagNo: json['tagNo'] as String? ?? '',
      itemCd: json['itemCd'] as String? ?? '',
      pitmCd: json['pitmCd'] as String? ?? '',
      wksNo: json['wksNo'] as String? ?? '',
      qtyUnit: json['qtyUnit'] as String? ?? '',
      wrkQty: (json['wrkQty'] as num?)?.toInt() ?? 0,
      cbxQty: (json['cbxQty'] as num?)?.toInt() ?? 0,
      setQty: (json['setQty'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$SubBodyItemImplToJson(_$SubBodyItemImpl instance) =>
    <String, dynamic>{
      'pitmNm': instance.pitmNm,
      'cbxMaNo': instance.cbxMaNo,
      'itemNm': instance.itemNm,
      'splitSeq': instance.splitSeq,
      'wrkRemark': instance.wrkRemark,
      'pjtNm2': instance.pjtNm2,
      'wrkNo': instance.wrkNo,
      'splitNo': instance.splitNo,
      'cbxExNo': instance.cbxExNo,
      'id': instance.id,
      'cbxExNm': instance.cbxExNm,
      'bomQty': instance.bomQty,
      'cbxSuSeq': instance.cbxSuSeq,
      'sboxSpec': instance.sboxSpec,
      'wrkCfmYn': instance.wrkCfmYn,
      'setCbxQty': instance.setCbxQty,
      'wrkCfmDttm': instance.wrkCfmDttm,
      'tagNo': instance.tagNo,
      'itemCd': instance.itemCd,
      'pitmCd': instance.pitmCd,
      'wksNo': instance.wksNo,
      'qtyUnit': instance.qtyUnit,
      'wrkQty': instance.wrkQty,
      'cbxQty': instance.cbxQty,
      'setQty': instance.setQty,
    };
