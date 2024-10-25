// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'small_kit_save_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SmallKitSaveModelImpl _$$SmallKitSaveModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SmallKitSaveModelImpl(
      header: json['header'] == null
          ? null
          : Header.fromJson(json['header'] as Map<String, dynamic>),
      resultCode: json['resultCode'] as String? ?? '',
      resultMessage: json['resultMessage'] as String? ?? '',
      body: json['body'] as List<dynamic>?,
      hasError: json['hasError'] as bool? ?? false,
    );

Map<String, dynamic> _$$SmallKitSaveModelImplToJson(
        _$SmallKitSaveModelImpl instance) =>
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
      wht: json['wht'] as String? ?? '',
      custCd: json['custCd'] as String? ?? '',
      extrVal: json['extrVal'] as String? ?? '',
      pjtNm: json['pjtNm'] as String? ?? '',
      pjtNo: json['pjtNo'] as String? ?? '',
      expDt: json['expDt'] as String? ?? '',
      remark: json['remark'] as String? ?? '',
      prtNo: json['prtNo'] as String? ?? '',
      itemNm: json['itemNm'] as String? ?? '',
      lotNo: json['lotNo'] as String? ?? '',
      locDt: json['locDt'] as String? ?? '',
      tagType: json['tagType'] as String? ?? '',
      vendNm: json['vendNm'] as String? ?? '',
      dQty: json['dQty'] as String? ?? '',
      locCd: json['locCd'] as String? ?? '',
      inbYn: json['inbYn'] as String? ?? '',
      itemCd: json['itemCd'] as String? ?? '',
      tagNo: json['tagNo'] as String? ?? '',
      totWht: json['totWht'] as String? ?? '',
      whtUnit: json['whtUnit'] as String? ?? '',
      boxNm: json['boxNm'] as String? ?? '',
      boxNo: json['boxNo'] as String? ?? '',
      setQty: json['setQty'] as String? ?? '',
      boxWht: json['boxWht'] as String? ?? '',
      qrNo: json['qrNo'] as String? ?? '',
      qty: (json['qty'] as num?)?.toDouble() ?? 0.0,
      vendCd: json['vendCd'] as String? ?? '',
      qtyUnit: json['qtyUnit'] as String? ?? '',
      prtDt: json['prtDt'] as String? ?? '',
    );

Map<String, dynamic> _$$InnerBodyItemImplToJson(_$InnerBodyItemImpl instance) =>
    <String, dynamic>{
      'wht': instance.wht,
      'custCd': instance.custCd,
      'extrVal': instance.extrVal,
      'pjtNm': instance.pjtNm,
      'pjtNo': instance.pjtNo,
      'expDt': instance.expDt,
      'remark': instance.remark,
      'prtNo': instance.prtNo,
      'itemNm': instance.itemNm,
      'lotNo': instance.lotNo,
      'locDt': instance.locDt,
      'tagType': instance.tagType,
      'vendNm': instance.vendNm,
      'dQty': instance.dQty,
      'locCd': instance.locCd,
      'inbYn': instance.inbYn,
      'itemCd': instance.itemCd,
      'tagNo': instance.tagNo,
      'totWht': instance.totWht,
      'whtUnit': instance.whtUnit,
      'boxNm': instance.boxNm,
      'boxNo': instance.boxNo,
      'setQty': instance.setQty,
      'boxWht': instance.boxWht,
      'qrNo': instance.qrNo,
      'qty': instance.qty,
      'vendCd': instance.vendCd,
      'qtyUnit': instance.qtyUnit,
      'prtDt': instance.prtDt,
    };
