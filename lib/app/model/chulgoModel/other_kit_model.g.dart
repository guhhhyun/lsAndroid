// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'other_kit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OtherKitModelImpl _$$OtherKitModelImplFromJson(Map<String, dynamic> json) =>
    _$OtherKitModelImpl(
      header: json['header'] == null
          ? null
          : Header.fromJson(json['header'] as Map<String, dynamic>),
      resultCode: json['resultCode'] as String? ?? '',
      resultMessage: json['resultMessage'] as String? ?? '',
      body: (json['body'] as List<dynamic>?)
          ?.map((e) => Body.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasError: json['hasError'] as bool? ?? false,
    );

Map<String, dynamic> _$$OtherKitModelImplToJson(_$OtherKitModelImpl instance) =>
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

_$BodyResultImpl _$$BodyResultImplFromJson(Map<String, dynamic> json) =>
    _$BodyResultImpl(
      resultValue: json['resultValue'] as bool? ?? false,
      resultRowCount: (json['resultRowCount'] as num?)?.toInt() ?? 0,
      resultCode: json['resultCode'] as String? ?? '',
      resultMessage: json['resultMessage'] as String? ?? '',
      errorState: json['errorState'] ?? '',
      errorProcedure: json['errorProcedure'] ?? '',
      returnMessage: json['returnMessage'] ?? '',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$BodyResultImplToJson(_$BodyResultImpl instance) =>
    <String, dynamic>{
      'resultValue': instance.resultValue,
      'resultRowCount': instance.resultRowCount,
      'resultCode': instance.resultCode,
      'resultMessage': instance.resultMessage,
      'errorState': instance.errorState,
      'errorProcedure': instance.errorProcedure,
      'returnMessage': instance.returnMessage,
      'runtimeType': instance.$type,
    };

_$BodyDataListImpl _$$BodyDataListImplFromJson(Map<String, dynamic> json) =>
    _$BodyDataListImpl(
      (json['items'] as List<dynamic>)
          .map((e) => ItemData.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$BodyDataListImplToJson(_$BodyDataListImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
      'runtimeType': instance.$type,
    };

_$ItemDataImpl _$$ItemDataImplFromJson(Map<String, dynamic> json) =>
    _$ItemDataImpl(
      scanNo: json['scanNo'] ?? '',
      pkgSeq: json['pkgSeq'] ?? 0,
      scanSeq: json['scanSeq'] ?? 0,
      dTagNo: json['dTagNo'] ?? '',
      syncYn: json['syncYn'] as String? ?? '',
      remark: json['remark'] ?? '',
      pitmNm: json['pitmNm'] ?? '',
      itemNm: json['itemNm'] ?? '',
      wrkRemark: json['wrkRemark'] ?? '',
      wrkItemCd: json['wrkItemCd'] ?? '',
      dScanNo: json['dScanNo'] ?? '',
      pjtNm2: json['pjtNm2'] ?? '',
      wrkCfmYn: json['wrkCfmYn'] ?? '',
      setCbxQty: json['setCbxQty'] ?? 0.0,
      wrkCfmDttm: json['wrkCfmDttm'] ?? '',
      tagNo: json['tagNo'] ?? '',
      itemCd: json['itemCd'] ?? '',
      scanYn: json['scanYn'] ?? '',
      cbxExNo: json['cbxExNo'] ?? '',
      pitmCd: json['pitmCd'] ?? '',
      wrkQty: json['wrkQty'] ?? 0,
      pkgNo: json['pkgNo'] ?? '',
      cbxQty: json['cbxQty'] ?? 0,
      cbxExSeq: json['cbxExSeq'] ?? 0,
      totWrkNo: json['totWrkNo'] ?? '',
      setQty: json['setQty'] ?? 0,
      wrkItemNm: json['wrkItemNm'] ?? '',
      wrkQtySync: json['wrkQtySync'] ?? 0,
      dWrkQty: json['dWrkQty'] ?? 0,
      pdtNo: json['pdtNo'] ?? '',
      qtyUnit: json['qtyUnit'] ?? '',
      itemNmNonKit: json['itemNmNonKit'] ?? '',
      wksNo: json['wksNo'] ?? '',
      ncbxRmk: json['ncbxRmk'] ?? '',
    );

Map<String, dynamic> _$$ItemDataImplToJson(_$ItemDataImpl instance) =>
    <String, dynamic>{
      'scanNo': instance.scanNo,
      'pkgSeq': instance.pkgSeq,
      'scanSeq': instance.scanSeq,
      'dTagNo': instance.dTagNo,
      'syncYn': instance.syncYn,
      'remark': instance.remark,
      'pitmNm': instance.pitmNm,
      'itemNm': instance.itemNm,
      'wrkRemark': instance.wrkRemark,
      'wrkItemCd': instance.wrkItemCd,
      'dScanNo': instance.dScanNo,
      'pjtNm2': instance.pjtNm2,
      'wrkCfmYn': instance.wrkCfmYn,
      'setCbxQty': instance.setCbxQty,
      'wrkCfmDttm': instance.wrkCfmDttm,
      'tagNo': instance.tagNo,
      'itemCd': instance.itemCd,
      'scanYn': instance.scanYn,
      'cbxExNo': instance.cbxExNo,
      'pitmCd': instance.pitmCd,
      'wrkQty': instance.wrkQty,
      'pkgNo': instance.pkgNo,
      'cbxQty': instance.cbxQty,
      'cbxExSeq': instance.cbxExSeq,
      'totWrkNo': instance.totWrkNo,
      'setQty': instance.setQty,
      'wrkItemNm': instance.wrkItemNm,
      'wrkQtySync': instance.wrkQtySync,
      'dWrkQty': instance.dWrkQty,
      'pdtNo': instance.pdtNo,
      'qtyUnit': instance.qtyUnit,
      'itemNmNonKit': instance.itemNmNonKit,
      'wksNo': instance.wksNo,
      'ncbxRmk': instance.ncbxRmk,
    };
