// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'small_kit_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SmallKitItemModelImpl _$$SmallKitItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SmallKitItemModelImpl(
      currentPage: (json['currentPage'] as num?)?.toInt() ?? 0,
      pageSize: (json['pageSize'] as num?)?.toInt() ?? 0,
      totalRecords: (json['totalRecords'] as num?)?.toInt() ?? 0,
      orders: json['orders'] as String? ?? '',
      chnlCd: json['chnlCd'] as String? ?? '',
      resultCode: json['resultCode'] as String? ?? '',
      resultMessage: json['resultMessage'] as String? ?? '',
      body: json['body'] as List<dynamic>?,
      hasError: json['hasError'] as bool? ?? false,
    );

Map<String, dynamic> _$$SmallKitItemModelImplToJson(
        _$SmallKitItemModelImpl instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'pageSize': instance.pageSize,
      'totalRecords': instance.totalRecords,
      'orders': instance.orders,
      'chnlCd': instance.chnlCd,
      'resultCode': instance.resultCode,
      'resultMessage': instance.resultMessage,
      'body': instance.body,
      'hasError': instance.hasError,
    };

_$BodyItemImpl _$$BodyItemImplFromJson(Map<String, dynamic> json) =>
    _$BodyItemImpl(
      resultValue: json['resultValue'] as bool? ?? true,
      resultRowCount: (json['resultRowCount'] as num?)?.toInt() ?? 0,
      resultCode: json['resultCode'] as String? ?? '',
      resultMessage: json['resultMessage'] as String? ?? '',
      errorState: json['errorState'] as String? ?? '',
      errorProcedure: json['errorProcedure'] as String? ?? '',
      returnMessage: json['returnMessage'] as String? ?? '',
      body: (json['body'] as List<dynamic>?)
              ?.map((e) => InnerBodyItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
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
      'body': instance.body,
    };

_$InnerBodyItemImpl _$$InnerBodyItemImplFromJson(Map<String, dynamic> json) =>
    _$InnerBodyItemImpl(
      cbxSuSeq: (json['cbxSuSeq'] as num?)?.toInt() ?? 0,
      sboxSpec: json['sboxSpec'] as String? ?? '',
      setCbxQty: (json['setCbxQty'] as num?)?.toDouble() ?? 0.0,
      tagNo: json['tagNo'] as String? ?? '',
      itemCd: json['itemCd'] as String? ?? '',
      cbxMaNo: json['cbxMaNo'] as String? ?? '',
      itemNm: json['itemNm'] as String? ?? '',
      pitmCd: json['pitmCd'] as String? ?? '',
      splitSeq: (json['splitSeq'] as num?)?.toInt() ?? 0,
      cbxQty: (json['cbxQty'] as num?)?.toInt() ?? 0,
      wrkNo: json['wrkNo'] as String? ?? '',
      splitNo: (json['splitNo'] as num?)?.toInt() ?? 0,
      setQty: (json['setQty'] as num?)?.toInt() ?? 0,
      qtyUnit: json['qtyUnit'] as String? ?? '',
      cbxSuNo: json['cbxSuNo'] as String? ?? '',
      cbxSuNm: json['cbxSuNm'] as String? ?? '',
      wksNo: json['wksNo'] as String? ?? '',
    );

Map<String, dynamic> _$$InnerBodyItemImplToJson(_$InnerBodyItemImpl instance) =>
    <String, dynamic>{
      'cbxSuSeq': instance.cbxSuSeq,
      'sboxSpec': instance.sboxSpec,
      'setCbxQty': instance.setCbxQty,
      'tagNo': instance.tagNo,
      'itemCd': instance.itemCd,
      'cbxMaNo': instance.cbxMaNo,
      'itemNm': instance.itemNm,
      'pitmCd': instance.pitmCd,
      'splitSeq': instance.splitSeq,
      'cbxQty': instance.cbxQty,
      'wrkNo': instance.wrkNo,
      'splitNo': instance.splitNo,
      'setQty': instance.setQty,
      'qtyUnit': instance.qtyUnit,
      'cbxSuNo': instance.cbxSuNo,
      'cbxSuNm': instance.cbxSuNm,
      'wksNo': instance.wksNo,
    };
