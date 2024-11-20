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
      zoneNmRowspan: (json['zoneNmRowspan'] as num?)?.toInt() ?? 0,
      wht: json['wht'] as String? ?? '',
      tagId: (json['tagId'] as num?)?.toInt() ?? 0,
      pjtNm: json['pjtNm'] as String? ?? '',
      grpKey: json['grpKey'] as String? ?? '',
      whNm: json['whNm'] as String? ?? '',
      expDt: json['expDt'] as String? ?? '',
      remark: json['remark'] as String? ?? '',
      tagTypeNmRowspan: (json['tagTypeNmRowspan'] as num?)?.toInt() ?? 0,
      itemNm: json['itemNm'] as String? ?? '',
      selectedRowspan: (json['selectedRowspan'] as num?)?.toInt() ?? 0,
      lotNo: json['lotNo'] as String? ?? '',
      usrNm: json['usrNm'] as String? ?? '',
      vendNmRowspan: (json['vendNmRowspan'] as num?)?.toInt() ?? 0,
      tagType: json['tagType'] as String? ?? '',
      vendNm: json['vendNm'] as String? ?? '',
      prtDtRowspan: (json['prtDtRowspan'] as num?)?.toInt() ?? 0,
      tagSeq: (json['tagSeq'] as num?)?.toInt() ?? 0,
      pjtNmRowspan: (json['pjtNmRowspan'] as num?)?.toInt() ?? 0,
      selected: (json['selected'] as num?)?.toInt() ?? 0,
      whNmRowspan: (json['whNmRowspan'] as num?)?.toInt() ?? 0,
      inbNoRowspan: (json['inbNoRowspan'] as num?)?.toInt() ?? 0,
      remarkRowspan: (json['remarkRowspan'] as num?)?.toInt() ?? 0,
      locCd: json['locCd'] as String? ?? '',
      whCd: json['whCd'] as String? ?? '',
      tagNo: json['tagNo'] as String? ?? '',
      itemCd: json['itemCd'] as String? ?? '',
      locCdRowspan: (json['locCdRowspan'] as num?)?.toInt() ?? 0,
      whtUnit: json['whtUnit'] as String? ?? '',
      tagNoRowspan: (json['tagNoRowspan'] as num?)?.toInt() ?? 0,
      zoneNm: json['zoneNm'] as String? ?? '',
      inbDt: json['inbDt'] as String? ?? '',
      setQty: json['setQty'] as String? ?? '',
      plant: json['plant'] as String? ?? '',
      qrNo: json['qrNo'] as String? ?? '',
      usrNmRowspan: (json['usrNmRowspan'] as num?)?.toInt() ?? 0,
      inbDtRowspan: (json['inbDtRowspan'] as num?)?.toInt() ?? 0,
      qty: (json['qty'] as num?)?.toDouble() ?? 0.0,
      tagTypeNm: json['tagTypeNm'] as String? ?? '',
      qtyUnit: json['qtyUnit'] as String? ?? '',
      prtDt: json['prtDt'] as String? ?? '',
    );

Map<String, dynamic> _$$SubBodyItemImplToJson(_$SubBodyItemImpl instance) =>
    <String, dynamic>{
      'zoneNmRowspan': instance.zoneNmRowspan,
      'wht': instance.wht,
      'tagId': instance.tagId,
      'pjtNm': instance.pjtNm,
      'grpKey': instance.grpKey,
      'whNm': instance.whNm,
      'expDt': instance.expDt,
      'remark': instance.remark,
      'tagTypeNmRowspan': instance.tagTypeNmRowspan,
      'itemNm': instance.itemNm,
      'selectedRowspan': instance.selectedRowspan,
      'lotNo': instance.lotNo,
      'usrNm': instance.usrNm,
      'vendNmRowspan': instance.vendNmRowspan,
      'tagType': instance.tagType,
      'vendNm': instance.vendNm,
      'prtDtRowspan': instance.prtDtRowspan,
      'tagSeq': instance.tagSeq,
      'pjtNmRowspan': instance.pjtNmRowspan,
      'selected': instance.selected,
      'whNmRowspan': instance.whNmRowspan,
      'inbNoRowspan': instance.inbNoRowspan,
      'remarkRowspan': instance.remarkRowspan,
      'locCd': instance.locCd,
      'whCd': instance.whCd,
      'tagNo': instance.tagNo,
      'itemCd': instance.itemCd,
      'locCdRowspan': instance.locCdRowspan,
      'whtUnit': instance.whtUnit,
      'tagNoRowspan': instance.tagNoRowspan,
      'zoneNm': instance.zoneNm,
      'inbDt': instance.inbDt,
      'setQty': instance.setQty,
      'plant': instance.plant,
      'qrNo': instance.qrNo,
      'usrNmRowspan': instance.usrNmRowspan,
      'inbDtRowspan': instance.inbDtRowspan,
      'qty': instance.qty,
      'tagTypeNm': instance.tagTypeNm,
      'qtyUnit': instance.qtyUnit,
      'prtDt': instance.prtDt,
    };
