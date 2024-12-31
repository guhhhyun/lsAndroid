// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'etc_chulgo_second_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EtcChulgoSecondDetailModelImpl _$$EtcChulgoSecondDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EtcChulgoSecondDetailModelImpl(
      header: json['header'] == null
          ? null
          : Header.fromJson(json['header'] as Map<String, dynamic>),
      resultCode: json['resultCode'] as String? ?? '',
      resultMessage: json['resultMessage'] as String? ?? '',
      body: json['body'] as List<dynamic>?,
      hasError: json['hasError'] as bool? ?? false,
    );

Map<String, dynamic> _$$EtcChulgoSecondDetailModelImplToJson(
        _$EtcChulgoSecondDetailModelImpl instance) =>
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
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => SubBodyItem.fromJson(e as Map<String, dynamic>))
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
      'items': instance.items,
    };

_$SubBodyItemImpl _$$SubBodyItemImplFromJson(Map<String, dynamic> json) =>
    _$SubBodyItemImpl(
      wht: json['wht'] as String? ?? '',
      tagId: (json['tagId'] as num?)?.toInt() ?? 0,
      WH_NM: json['WH_NM'] as String? ?? '',
      pjtNm: json['pjtNm'] as String? ?? '',
      grpKey: json['grpKey'] as String? ?? '',
      LOC_CD: json['LOC_CD'] as String? ?? '',
      expDt: json['expDt'] as String? ?? '',
      remark: json['remark'] as String? ?? '',
      itemNm: json['itemNm'] as String? ?? '',
      lotNo: json['lotNo'] as String? ?? '',
      usrNm: json['usrNm'] as String? ?? '',
      tagType: json['tagType'] as String? ?? '',
      vendNm: json['vendNm'] as String? ?? '',
      tagSeq: (json['tagSeq'] as num?)?.toInt() ?? 0,
      whCd: json['whCd'] as String? ?? '',
      tagNo: json['tagNo'] as String? ?? '',
      itemCd: json['itemCd'] as String? ?? '',
      whtUnit: json['whtUnit'] as String? ?? '',
      setQty: json['setQty'] as String? ?? '',
      plant: json['plant'] as String? ?? '',
      qrNo: json['qrNo'] as String? ?? '',
      qty: json['qty'] as String? ?? '',
      tagTypeNm: json['tagTypeNm'] as String? ?? '',
      qtyUnit: json['qtyUnit'] as String? ?? '',
      prtDt: json['prtDt'] as String? ?? '',
    );

Map<String, dynamic> _$$SubBodyItemImplToJson(_$SubBodyItemImpl instance) =>
    <String, dynamic>{
      'wht': instance.wht,
      'tagId': instance.tagId,
      'WH_NM': instance.WH_NM,
      'pjtNm': instance.pjtNm,
      'grpKey': instance.grpKey,
      'LOC_CD': instance.LOC_CD,
      'expDt': instance.expDt,
      'remark': instance.remark,
      'itemNm': instance.itemNm,
      'lotNo': instance.lotNo,
      'usrNm': instance.usrNm,
      'tagType': instance.tagType,
      'vendNm': instance.vendNm,
      'tagSeq': instance.tagSeq,
      'whCd': instance.whCd,
      'tagNo': instance.tagNo,
      'itemCd': instance.itemCd,
      'whtUnit': instance.whtUnit,
      'setQty': instance.setQty,
      'plant': instance.plant,
      'qrNo': instance.qrNo,
      'qty': instance.qty,
      'tagTypeNm': instance.tagTypeNm,
      'qtyUnit': instance.qtyUnit,
      'prtDt': instance.prtDt,
    };
