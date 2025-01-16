// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'select_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SelectItemModelImpl _$$SelectItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SelectItemModelImpl(
      header: json['header'] == null
          ? null
          : Header.fromJson(json['header'] as Map<String, dynamic>),
      resultCode: json['resultCode'] as String? ?? '',
      resultMessage: json['resultMessage'] as String? ?? '',
      body: json['body'] as List<dynamic>?,
      hasError: json['hasError'] as bool? ?? false,
    );

Map<String, dynamic> _$$SelectItemModelImplToJson(
        _$SelectItemModelImpl instance) =>
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

_$ZoneImpl _$$ZoneImplFromJson(Map<String, dynamic> json) => _$ZoneImpl(
      no: (json['no'] as num?)?.toInt() ?? 0,
      wht: (json['wht'] as num?)?.toDouble() ?? 0.0,
      qtyRes: (json['qtyRes'] as num?)?.toDouble() ?? 0.0,
      locCd: json['locCd'] as String? ?? '',
      wrkYn: json['wrkYn'] as String? ?? '',
      itemCd: json['itemCd'] as String? ?? '',
      tagNo: json['tagNo'] as String? ?? '',
      itemNm: json['itemNm'] as String? ?? '',
      whtUnit: json['whtUnit'] as String? ?? '',
      zoneNm: json['zoneNm'] as String? ?? '',
      locDt: json['locDt'] as String? ?? '',
      qty: (json['qty'] as num?)?.toInt() ?? 0,
      qrNo: json['qrNo'] as String? ?? '',
      checkBox: (json['checkBox'] as num?)?.toInt() ?? 0,
      selected: (json['selected'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ZoneImplToJson(_$ZoneImpl instance) =>
    <String, dynamic>{
      'no': instance.no,
      'wht': instance.wht,
      'qtyRes': instance.qtyRes,
      'locCd': instance.locCd,
      'wrkYn': instance.wrkYn,
      'itemCd': instance.itemCd,
      'tagNo': instance.tagNo,
      'itemNm': instance.itemNm,
      'whtUnit': instance.whtUnit,
      'zoneNm': instance.zoneNm,
      'locDt': instance.locDt,
      'qty': instance.qty,
      'qrNo': instance.qrNo,
      'checkBox': instance.checkBox,
      'selected': instance.selected,
    };
