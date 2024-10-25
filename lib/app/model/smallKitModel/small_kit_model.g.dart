// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'small_kit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SmallKitModelImpl _$$SmallKitModelImplFromJson(Map<String, dynamic> json) =>
    _$SmallKitModelImpl(
      header: json['header'] == null
          ? null
          : Header.fromJson(json['header'] as Map<String, dynamic>),
      resultCode: json['resultCode'] as String? ?? '',
      resultMessage: json['resultMessage'] as String? ?? '',
      body: json['body'] as List<dynamic>?,
      hasError: json['hasError'] as bool? ?? false,
    );

Map<String, dynamic> _$$SmallKitModelImplToJson(_$SmallKitModelImpl instance) =>
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
      resultValue: json['resultValue'] as bool? ?? true,
      resultRowCount: (json['resultRowCount'] as num?)?.toInt() ?? 0,
      resultCode: json['resultCode'] as String? ?? '',
      resultMessage: json['resultMessage'] as String? ?? '',
      errorState: json['errorState'] as String? ?? '',
      errorProcedure: json['errorProcedure'] as String? ?? '',
      returnMessage: json['returnMessage'] as String? ?? '',
      innerBody: (json['innerBody'] as List<dynamic>?)
          ?.map((e) => InnerBodyItem.fromJson(e as Map<String, dynamic>))
          .toList(),
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
      'innerBody': instance.innerBody,
    };

_$InnerBodyItemImpl _$$InnerBodyItemImplFromJson(Map<String, dynamic> json) =>
    _$InnerBodyItemImpl(
      scanNo: json['scanNo'] as String? ?? '',
      scanSeq: json['scanSeq'] as String? ?? '',
      syncYn: json['syncYn'] as String? ?? '',
      remark: json['remark'] as String? ?? '',
      pitmNm: json['pitmNm'] as String? ?? '',
      cbxMaNo: json['cbxMaNo'] as String? ?? '',
      itemNm: json['itemNm'] as String? ?? '',
      splitSeq: (json['splitSeq'] as num?)?.toInt() ?? 0,
      wrkRemark: json['wrkRemark'] as String? ?? '',
      pjtNm2: json['pjtNm2'] as String? ?? '',
      wrkNo: json['wrkNo'] as String? ?? '',
      splitNo: (json['splitNo'] as num?)?.toInt() ?? 0,
      cbxSuNo: json['cbxSuNo'] as String? ?? '',
      vendNm: json['vendNm'] as String? ?? '',
      cbxSuNm: json['cbxSuNm'] as String? ?? '',
      cbxSuSeq: (json['cbxSuSeq'] as num?)?.toInt() ?? 0,
      sboxSpec: json['sboxSpec'] as String? ?? '',
      wrkdTagNo: json['wrkdTagNo'] as String? ?? '',
      wrkCfmYn: json['wrkCfmYn'] as String? ?? '',
      setCbxQty: (json['setCbxQty'] as num?)?.toDouble() ?? 0.0,
      wrkCfmDttm: json['wrkCfmDttm'] as String? ?? '',
      tagNo: json['tagNo'] as String? ?? '',
      itemCd: json['itemCd'] as String? ?? '',
      scanYn: json['scanYn'] as String? ?? '',
      pitmCd: json['pitmCd'] as String? ?? '',
      wrkQty: json['wrkQty'] as String? ?? '',
      cbxQty: (json['cbxQty'] as num?)?.toInt() ?? 0,
      setQty: (json['setQty'] as num?)?.toInt() ?? 0,
      wrkQtySync: json['wrkQtySync'] as String? ?? '',
      vendCd: json['vendCd'] as String? ?? '',
      qtyUnit: json['qtyUnit'] as String? ?? '',
      wrkTagNo: json['wrkTagNo'] as String? ?? '',
      wksNo: json['wksNo'] as String? ?? '',
      ncbxRmk: json['ncbxRmk'] as String? ?? '',
    );

Map<String, dynamic> _$$InnerBodyItemImplToJson(_$InnerBodyItemImpl instance) =>
    <String, dynamic>{
      'scanNo': instance.scanNo,
      'scanSeq': instance.scanSeq,
      'syncYn': instance.syncYn,
      'remark': instance.remark,
      'pitmNm': instance.pitmNm,
      'cbxMaNo': instance.cbxMaNo,
      'itemNm': instance.itemNm,
      'splitSeq': instance.splitSeq,
      'wrkRemark': instance.wrkRemark,
      'pjtNm2': instance.pjtNm2,
      'wrkNo': instance.wrkNo,
      'splitNo': instance.splitNo,
      'cbxSuNo': instance.cbxSuNo,
      'vendNm': instance.vendNm,
      'cbxSuNm': instance.cbxSuNm,
      'cbxSuSeq': instance.cbxSuSeq,
      'sboxSpec': instance.sboxSpec,
      'wrkdTagNo': instance.wrkdTagNo,
      'wrkCfmYn': instance.wrkCfmYn,
      'setCbxQty': instance.setCbxQty,
      'wrkCfmDttm': instance.wrkCfmDttm,
      'tagNo': instance.tagNo,
      'itemCd': instance.itemCd,
      'scanYn': instance.scanYn,
      'pitmCd': instance.pitmCd,
      'wrkQty': instance.wrkQty,
      'cbxQty': instance.cbxQty,
      'setQty': instance.setQty,
      'wrkQtySync': instance.wrkQtySync,
      'vendCd': instance.vendCd,
      'qtyUnit': instance.qtyUnit,
      'wrkTagNo': instance.wrkTagNo,
      'wksNo': instance.wksNo,
      'ncbxRmk': instance.ncbxRmk,
    };
