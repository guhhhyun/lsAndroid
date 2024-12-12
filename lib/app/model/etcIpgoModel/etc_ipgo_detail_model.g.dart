// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'etc_ipgo_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EtcIpgoDetailModelImpl _$$EtcIpgoDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EtcIpgoDetailModelImpl(
      header: json['header'] == null
          ? null
          : Header.fromJson(json['header'] as Map<String, dynamic>),
      resultCode: json['resultCode'] as String? ?? '',
      resultMessage: json['resultMessage'] as String? ?? '',
      body: json['body'] as List<dynamic>?,
      hasError: json['hasError'] as bool? ?? false,
    );

Map<String, dynamic> _$$EtcIpgoDetailModelImplToJson(
        _$EtcIpgoDetailModelImpl instance) =>
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
      orders: json['orders'] as List<dynamic>?,
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

_$DataItemImpl _$$DataItemImplFromJson(Map<String, dynamic> json) =>
    _$DataItemImpl(
      pjtNm: json['pjtNm'] as String? ?? '',
      inbSeq: (json['inbSeq'] as num?)?.toInt() ?? 0,
      tagTypeNmRowspan: (json['tagTypeNmRowspan'] as num?)?.toInt() ?? 0,
      tagNo: json['tagNo'] as String? ?? '',
      itemCd: json['itemCd'] as String? ?? '',
      itemNm: json['itemNm'] as String? ?? '',
      tagNoRowspan: (json['tagNoRowspan'] as num?)?.toInt() ?? 0,
      setQty: (json['setQty'] as num?)?.toInt() ?? 0,
      qty: (json['qty'] as num?)?.toInt() ?? 0,
      tagTypeNm: json['tagTypeNm'] as String? ?? '',
      qtyUnit: json['qtyUnit'] as String? ?? '',
      vendNm: json['vendNm'] as String? ?? '',
      tagSeq: (json['tagSeq'] as num?)?.toInt() ?? 0,
      prtDt: json['prtDt'] as String? ?? '',
      INB_NO: json['INB_NO'] as String? ?? '',
    );

Map<String, dynamic> _$$DataItemImplToJson(_$DataItemImpl instance) =>
    <String, dynamic>{
      'pjtNm': instance.pjtNm,
      'inbSeq': instance.inbSeq,
      'tagTypeNmRowspan': instance.tagTypeNmRowspan,
      'tagNo': instance.tagNo,
      'itemCd': instance.itemCd,
      'itemNm': instance.itemNm,
      'tagNoRowspan': instance.tagNoRowspan,
      'setQty': instance.setQty,
      'qty': instance.qty,
      'tagTypeNm': instance.tagTypeNm,
      'qtyUnit': instance.qtyUnit,
      'vendNm': instance.vendNm,
      'tagSeq': instance.tagSeq,
      'prtDt': instance.prtDt,
      'INB_NO': instance.INB_NO,
    };
