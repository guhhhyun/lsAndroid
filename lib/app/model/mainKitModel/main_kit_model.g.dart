// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_kit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MainKitModelImpl _$$MainKitModelImplFromJson(Map<String, dynamic> json) =>
    _$MainKitModelImpl(
      header: json['header'] == null
          ? null
          : Header.fromJson(json['header'] as Map<String, dynamic>),
      resultCode: json['resultCode'] as String? ?? '',
      resultMessage: json['resultMessage'] as String? ?? '',
      body: json['body'] as List<dynamic>?,
    );

Map<String, dynamic> _$$MainKitModelImplToJson(_$MainKitModelImpl instance) =>
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
      scanNo: json['scanNo'] ?? '',
      scanSeq: json['scanSeq'] ?? 0,
      dTagNo: json['dTagNo'] ?? '',
      syncYn: json['syncYn'] ?? '',
      remark: json['remark'] ?? '',
      chkDtm: json['chkDtm'] == null
          ? null
          : DateTime.parse(json['chkDtm'] as String),
      pitmNm: json['pitmNm'] ?? '',
      cbxMaNo: json['cbxMaNo'] ?? '',
      itemNm: json['itemNm'] ?? '',
      wrkRemark: json['wrkRemark'] ?? '',
      dScanNo: json['dScanNo'] ?? '',
      pjtNm2: json['pjtNm2'] ?? '',
      wrkNo: json['wrkNo'] ?? '',
      cbxMaSeq: json['cbxMaSeq'] ?? 0,
      cbxSuNo: json['cbxSuNo'] ?? '',
      cbxSuNm: json['cbxSuNm'] ?? '',
      cbxSuSeq: json['cbxSuSeq'] ?? 0,
      sboxSpec: json['sboxSpec'] ?? '',
      wrkCfmYn: json['wrkCfmYn'] ?? '',
      setCbxQty: json['setCbxQty'] ?? 0.0,
      wrkCfmDttm: json['wrkCfmDttm'] == null
          ? null
          : DateTime.parse(json['wrkCfmDttm'] as String),
      itemCd: json['itemCd'] ?? '',
      tagNo: json['tagNo'] ?? '',
      scanYn: json['scanYn'] ?? '',
      pitmCd: json['pitmCd'] ?? '',
      wrkQty: json['wrkQty'] ?? 0.0,
      cbxQty: json['cbxQty'] ?? 0,
      setQty: json['setQty'] ?? 0,
      wrkQtySync: json['wrkQtySync'] ?? 0.0,
      dWrkQty: json['dWrkQty'] ?? 0.0,
      pdtNo: json['pdtNo'] ?? '',
      qtyUnit: json['qtyUnit'] ?? '',
      mboxExcluded: json['mboxExcluded'] ?? '',
      itemNmNonKit: json['itemNmNonKit'] ?? '',
      wksNo: json['wksNo'] ?? '',
      ncbxRmk: json['ncbxRmk'] ?? '',
    );

Map<String, dynamic> _$$SubBodyItemImplToJson(_$SubBodyItemImpl instance) =>
    <String, dynamic>{
      'scanNo': instance.scanNo,
      'scanSeq': instance.scanSeq,
      'dTagNo': instance.dTagNo,
      'syncYn': instance.syncYn,
      'remark': instance.remark,
      'chkDtm': instance.chkDtm?.toIso8601String(),
      'pitmNm': instance.pitmNm,
      'cbxMaNo': instance.cbxMaNo,
      'itemNm': instance.itemNm,
      'wrkRemark': instance.wrkRemark,
      'dScanNo': instance.dScanNo,
      'pjtNm2': instance.pjtNm2,
      'wrkNo': instance.wrkNo,
      'cbxMaSeq': instance.cbxMaSeq,
      'cbxSuNo': instance.cbxSuNo,
      'cbxSuNm': instance.cbxSuNm,
      'cbxSuSeq': instance.cbxSuSeq,
      'sboxSpec': instance.sboxSpec,
      'wrkCfmYn': instance.wrkCfmYn,
      'setCbxQty': instance.setCbxQty,
      'wrkCfmDttm': instance.wrkCfmDttm?.toIso8601String(),
      'itemCd': instance.itemCd,
      'tagNo': instance.tagNo,
      'scanYn': instance.scanYn,
      'pitmCd': instance.pitmCd,
      'wrkQty': instance.wrkQty,
      'cbxQty': instance.cbxQty,
      'setQty': instance.setQty,
      'wrkQtySync': instance.wrkQtySync,
      'dWrkQty': instance.dWrkQty,
      'pdtNo': instance.pdtNo,
      'qtyUnit': instance.qtyUnit,
      'mboxExcluded': instance.mboxExcluded,
      'itemNmNonKit': instance.itemNmNonKit,
      'wksNo': instance.wksNo,
      'ncbxRmk': instance.ncbxRmk,
    };
