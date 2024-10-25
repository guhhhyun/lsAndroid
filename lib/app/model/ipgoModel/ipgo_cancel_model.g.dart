// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ipgo_cancel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IpgoCancelModelImpl _$$IpgoCancelModelImplFromJson(
        Map<String, dynamic> json) =>
    _$IpgoCancelModelImpl(
      header: json['header'] == null
          ? null
          : Header.fromJson(json['header'] as Map<String, dynamic>),
      resultCode: json['resultCode'] as String? ?? '',
      resultMessage: json['resultMessage'] as String? ?? '',
      body: json['body'] as List<dynamic>?,
      hasError: json['hasError'] as bool? ?? false,
    );

Map<String, dynamic> _$$IpgoCancelModelImplToJson(
        _$IpgoCancelModelImpl instance) =>
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

_$BodyItemImpl _$$BodyItemImplFromJson(Map<String, dynamic> json) =>
    _$BodyItemImpl(
      resultValue: json['resultValue'] as bool,
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

_$InboundItemImpl _$$InboundItemImplFromJson(Map<String, dynamic> json) =>
    _$InboundItemImpl(
      no: (json['no'] as num?)?.toInt() ?? 0,
      inbNo: json['inbNo'] as String? ?? '',
      pjtNm: json['pjtNm'] as String?,
      grpKey: json['grpKey'] as String? ?? '',
      inbType: json['inbType'] as String? ?? '',
      remark: json['remark'] ?? '',
      itemNm: json['itemNm'] as String? ?? '',
      lotNo: json['lotNo'] as String? ?? '',
      InbDt: json['InbDt'] as String? ?? '',
      checked: json['checked'] as bool? ?? false,
      vendNm: json['vendNm'] ?? '',
      docDt: json['docDt'] ?? '',
      selected: json['selected'] as bool? ?? false,
      inbUserNm: json['inbUserNm'] as String? ?? '',
      locCd: json['locCd'] as String? ?? '',
      whCd: json['whCd'] as String? ?? '',
      inbSeq: (json['inbSeq'] as num?)?.toInt() ?? 0,
      itemCd: json['itemCd'] as String? ?? '',
      docNo: json['docNo'] ?? '',
      plant: json['plant'] as String? ?? '',
      qty: json['qty'] ?? 0.0,
      inbUser: json['inbUser'] as String? ?? '',
      vendCd: json['vendCd'] ?? '',
      qtyUnit: json['qtyUnit'] as String? ?? '',
      mstKey: json['mstKey'] as String? ?? '',
      inbTypeNm: json['inbTypeNm'] as String? ?? '',
    );

Map<String, dynamic> _$$InboundItemImplToJson(_$InboundItemImpl instance) =>
    <String, dynamic>{
      'no': instance.no,
      'inbNo': instance.inbNo,
      'pjtNm': instance.pjtNm,
      'grpKey': instance.grpKey,
      'inbType': instance.inbType,
      'remark': instance.remark,
      'itemNm': instance.itemNm,
      'lotNo': instance.lotNo,
      'InbDt': instance.InbDt,
      'checked': instance.checked,
      'vendNm': instance.vendNm,
      'docDt': instance.docDt,
      'selected': instance.selected,
      'inbUserNm': instance.inbUserNm,
      'locCd': instance.locCd,
      'whCd': instance.whCd,
      'inbSeq': instance.inbSeq,
      'itemCd': instance.itemCd,
      'docNo': instance.docNo,
      'plant': instance.plant,
      'qty': instance.qty,
      'inbUser': instance.inbUser,
      'vendCd': instance.vendCd,
      'qtyUnit': instance.qtyUnit,
      'mstKey': instance.mstKey,
      'inbTypeNm': instance.inbTypeNm,
    };
