// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'etc_ipgo_second_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EtcIpgoSecondModelImpl _$$EtcIpgoSecondModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EtcIpgoSecondModelImpl(
      header: json['header'] == null
          ? null
          : Header.fromJson(json['header'] as Map<String, dynamic>),
      resultCode: json['resultCode'] as String? ?? '',
      resultMessage: json['resultMessage'] as String? ?? '',
      body: json['body'] as List<dynamic>?,
      hasError: json['hasError'] as bool? ?? false,
    );

Map<String, dynamic> _$$EtcIpgoSecondModelImplToJson(
        _$EtcIpgoSecondModelImpl instance) =>
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
      locCd: json['locCd'] as String? ?? '',
      whCd: json['whCd'] as String? ?? '',
      inbNo: json['inbNo'] as String? ?? '',
      grpKey: json['grpKey'] as String? ?? '',
      whNm: json['whNm'] as String? ?? '',
      expDt: json['expDt'] as String? ?? '',
      remark: json['remark'] as String? ?? '',
      tagNo: json['tagNo'] as String? ?? '',
      itemCd: json['itemCd'] as String? ?? '',
      whtUnit: json['whtUnit'] as String? ?? '',
      lotNo: json['lotNo'] as String? ?? '',
      zoneNm: json['zoneNm'] as String? ?? '',
      usrNm: json['usrNm'] as String? ?? '',
      inbDt: json['inbDt'] as String? ?? '',
      plant: json['plant'] as String? ?? '',
      qrNo: json['qrNo'] as String? ?? '',
      qty: (json['qty'] as num?)?.toDouble() ?? 0.0,
      tagType: json['tagType'] as String? ?? '',
      tagTypeNm: json['tagTypeNm'] as String? ?? '',
      qtyUnit: json['qtyUnit'] as String? ?? '',
      prtDt: json['prtDt'] as String? ?? '',
      stkIspSts: json['stkIspSts'] as String? ?? '',
    );

Map<String, dynamic> _$$SubBodyItemImplToJson(_$SubBodyItemImpl instance) =>
    <String, dynamic>{
      'wht': instance.wht,
      'tagId': instance.tagId,
      'locCd': instance.locCd,
      'whCd': instance.whCd,
      'inbNo': instance.inbNo,
      'grpKey': instance.grpKey,
      'whNm': instance.whNm,
      'expDt': instance.expDt,
      'remark': instance.remark,
      'tagNo': instance.tagNo,
      'itemCd': instance.itemCd,
      'whtUnit': instance.whtUnit,
      'lotNo': instance.lotNo,
      'zoneNm': instance.zoneNm,
      'usrNm': instance.usrNm,
      'inbDt': instance.inbDt,
      'plant': instance.plant,
      'qrNo': instance.qrNo,
      'qty': instance.qty,
      'tagType': instance.tagType,
      'tagTypeNm': instance.tagTypeNm,
      'qtyUnit': instance.qtyUnit,
      'prtDt': instance.prtDt,
      'stkIspSts': instance.stkIspSts,
    };
