// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'etc_chulgo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EtcChulgoModelImpl _$$EtcChulgoModelImplFromJson(Map<String, dynamic> json) =>
    _$EtcChulgoModelImpl(
      header: json['header'] == null
          ? null
          : Header.fromJson(json['header'] as Map<String, dynamic>),
      resultCode: json['resultCode'] as String? ?? '',
      resultMessage: json['resultMessage'] as String? ?? '',
      body: json['body'] as List<dynamic>?,
    );

Map<String, dynamic> _$$EtcChulgoModelImplToJson(
        _$EtcChulgoModelImpl instance) =>
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

_$NestedItemImpl _$$NestedItemImplFromJson(Map<String, dynamic> json) =>
    _$NestedItemImpl(
      tagTypeRowspan: (json['tagTypeRowspan'] as num?)?.toInt() ?? 1,
      grpKey: json['grpKey'] as String? ?? '',
      qtyUnitMaster: json['qtyUnitMaster'] as String? ?? '',
      itemNm: json['itemNm'] as String? ?? '',
      selectedRowspan: (json['selectedRowspan'] as num?)?.toInt() ?? 0,
      prtDtRowspan: (json['prtDtRowspan'] as num?)?.toInt() ?? 1,
      tagSeq: json['tagSeq'] as String? ?? '',
      pjtNmRowspan: (json['pjtNmRowspan'] as num?)?.toInt() ?? 1,
      selected: json['selected'] as bool? ?? false,
      qtyUse: (json['qtyUse'] as num?)?.toDouble() ?? 0.0,
      remarkRowspan: (json['remarkRowspan'] as num?)?.toInt() ?? 1,
      qtyUseRowspan: (json['qtyUseRowspan'] as num?)?.toInt() ?? 1,
      whCd: json['whCd'] as String? ?? '',
      qtyRemainRowspan: (json['qtyRemainRowspan'] as num?)?.toInt() ?? 1,
      otbNoRowspan: (json['otbNoRowspan'] as num?)?.toInt() ?? 1,
      otbDtRowspan: (json['otbDtRowspan'] as num?)?.toInt() ?? 1,
      tagNoRowspan: (json['tagNoRowspan'] as num?)?.toInt() ?? 1,
      plant: json['plant'] as String? ?? '',
      qty: (json['qty'] as num?)?.toDouble() ?? 0.0,
      setQtyRowspan: (json['setQtyRowspan'] as num?)?.toInt() ?? 0,
      prtDt: json['prtDt'] as String? ?? '',
      qtyUnitMasterRowspan:
          (json['qtyUnitMasterRowspan'] as num?)?.toInt() ?? 0,
      no: (json['no'] as num?)?.toInt() ?? 0,
      zoneNmRowspan: (json['zoneNmRowspan'] as num?)?.toInt() ?? 0,
      pjtNm: json['pjtNm'] as String? ?? '',
      whNm: json['whNm'] as String? ?? '',
      qtyRowspan: (json['qtyRowspan'] as num?)?.toInt() ?? 0,
      remark: json['remark'] as String? ?? '',
      tagTypeNmRowspan: (json['tagTypeNmRowspan'] as num?)?.toInt() ?? 0,
      usrNm: json['usrNm'] as String? ?? '',
      vendNmRowspan: (json['vendNmRowspan'] as num?)?.toInt() ?? 0,
      noRowspan: (json['noRowspan'] as num?)?.toInt() ?? 0,
      tagType: json['tagType'] as String? ?? '',
      dtlKey: json['dtlKey'] as String? ?? '',
      vendNm: json['vendNm'] as String? ?? '',
      whNmRowspan: (json['whNmRowspan'] as num?)?.toInt() ?? 0,
      otbDt: json['otbDt'] as String? ?? '',
      locCd: json['locCd'] as String? ?? '',
      tagNo: json['tagNo'] as String? ?? '',
      itemCd: json['itemCd'] as String? ?? '',
      otbNo: json['otbNo'] as String? ?? '',
      locCdRowspan: (json['locCdRowspan'] as num?)?.toInt() ?? 0,
      zoneNm: json['zoneNm'] as String? ?? '',
      setQty: (json['setQty'] as num?)?.toInt() ?? 0,
      usrNmRowspan: (json['usrNmRowspan'] as num?)?.toInt() ?? 0,
      tagTypeNm: json['tagTypeNm'] as String? ?? '',
      mstKey: json['mstKey'] as String? ?? '',
      qtyRemain: (json['qtyRemain'] as num?)?.toDouble() ?? 0.0,
      qtyUnitDetail: json['qtyUnitDetail'] as String? ?? '',
    );

Map<String, dynamic> _$$NestedItemImplToJson(_$NestedItemImpl instance) =>
    <String, dynamic>{
      'tagTypeRowspan': instance.tagTypeRowspan,
      'grpKey': instance.grpKey,
      'qtyUnitMaster': instance.qtyUnitMaster,
      'itemNm': instance.itemNm,
      'selectedRowspan': instance.selectedRowspan,
      'prtDtRowspan': instance.prtDtRowspan,
      'tagSeq': instance.tagSeq,
      'pjtNmRowspan': instance.pjtNmRowspan,
      'selected': instance.selected,
      'qtyUse': instance.qtyUse,
      'remarkRowspan': instance.remarkRowspan,
      'qtyUseRowspan': instance.qtyUseRowspan,
      'whCd': instance.whCd,
      'qtyRemainRowspan': instance.qtyRemainRowspan,
      'otbNoRowspan': instance.otbNoRowspan,
      'otbDtRowspan': instance.otbDtRowspan,
      'tagNoRowspan': instance.tagNoRowspan,
      'plant': instance.plant,
      'qty': instance.qty,
      'setQtyRowspan': instance.setQtyRowspan,
      'prtDt': instance.prtDt,
      'qtyUnitMasterRowspan': instance.qtyUnitMasterRowspan,
      'no': instance.no,
      'zoneNmRowspan': instance.zoneNmRowspan,
      'pjtNm': instance.pjtNm,
      'whNm': instance.whNm,
      'qtyRowspan': instance.qtyRowspan,
      'remark': instance.remark,
      'tagTypeNmRowspan': instance.tagTypeNmRowspan,
      'usrNm': instance.usrNm,
      'vendNmRowspan': instance.vendNmRowspan,
      'noRowspan': instance.noRowspan,
      'tagType': instance.tagType,
      'dtlKey': instance.dtlKey,
      'vendNm': instance.vendNm,
      'whNmRowspan': instance.whNmRowspan,
      'otbDt': instance.otbDt,
      'locCd': instance.locCd,
      'tagNo': instance.tagNo,
      'itemCd': instance.itemCd,
      'otbNo': instance.otbNo,
      'locCdRowspan': instance.locCdRowspan,
      'zoneNm': instance.zoneNm,
      'setQty': instance.setQty,
      'usrNmRowspan': instance.usrNmRowspan,
      'tagTypeNm': instance.tagTypeNm,
      'mstKey': instance.mstKey,
      'qtyRemain': instance.qtyRemain,
      'qtyUnitDetail': instance.qtyUnitDetail,
    };
