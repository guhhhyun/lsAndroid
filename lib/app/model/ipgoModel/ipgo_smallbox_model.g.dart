// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ipgo_smallbox_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IpgoSmallboxModelImpl _$$IpgoSmallboxModelImplFromJson(
        Map<String, dynamic> json) =>
    _$IpgoSmallboxModelImpl(
      header: json['header'] == null
          ? null
          : Header.fromJson(json['header'] as Map<String, dynamic>),
      resultCode: json['resultCode'] as String? ?? '',
      resultMessage: json['resultMessage'] as String? ?? '',
      body: json['body'] as List<dynamic>?,
      hasError: json['hasError'] as bool? ?? false,
    );

Map<String, dynamic> _$$IpgoSmallboxModelImplToJson(
        _$IpgoSmallboxModelImpl instance) =>
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

_$BodySubItemImpl _$$BodySubItemImplFromJson(Map<String, dynamic> json) =>
    _$BodySubItemImpl(
      no: (json['no'] as num?)?.toInt() ?? 0,
      wht: json['wht'] as String? ?? '',
      custCd: json['custCd'] as String? ?? '',
      tagId: (json['tagId'] as num?)?.toInt() ?? 0,
      pjtNm: json['pjtNm'] as String? ?? '',
      grpKey: json['grpKey'] as String? ?? '',
      pjtNo: json['pjtNo'] as String? ?? '',
      expDt: json['expDt'] as String? ?? '',
      remark: json['remark'] as String? ?? '',
      tagTypeNmRowspan: (json['tagTypeNmRowspan'] as num?)?.toInt() ?? 0,
      prtNo: json['prtNo'] as String? ?? '',
      itemNm: json['itemNm'] as String? ?? '',
      selectedRowspan: (json['selectedRowspan'] as num?)?.toInt() ?? 0,
      inEdit: json['inEdit'] as bool? ?? false,
      lotNo: json['lotNo'] as String? ?? '',
      noRowspan: (json['noRowspan'] as num?)?.toInt() ?? 0,
      tagType: json['tagType'] as String? ?? '',
      vendNm: json['vendNm'] as String? ?? '',
      dQty: json['dQty'] as String? ?? '',
      selected: json['selected'] as bool? ?? false,
      wmsQty: (json['wmsQty'] as num?)?.toDouble() ?? 0.0,
      itemCd: json['itemCd'] as String? ?? '',
      tagNo: json['tagNo'] as String? ?? '',
      totWht: json['totWht'] as String? ?? '',
      whtUnit: json['whtUnit'] as String? ?? '',
      setQty: json['setQty'] as String? ?? '',
      boxWht: json['boxWht'] as String? ?? '',
      qrNo: json['qrNo'] as String? ?? '',
      qty: (json['qty'] as num?)?.toDouble() ?? 0.0,
      wmsQtyUnit: json['wmsQtyUnit'] as String? ?? '',
      vendCd: json['vendCd'] as String? ?? '',
      qtyUnit: json['qtyUnit'] as String? ?? '',
      tagTypeNm: json['tagTypeNm'] as String? ?? '',
      mstKey: json['mstKey'] as String? ?? '',
      setQtyRowspan: (json['setQtyRowspan'] as num?)?.toInt() ?? 0,
      prtDt: json['prtDt'] as String? ?? '',
    );

Map<String, dynamic> _$$BodySubItemImplToJson(_$BodySubItemImpl instance) =>
    <String, dynamic>{
      'no': instance.no,
      'wht': instance.wht,
      'custCd': instance.custCd,
      'tagId': instance.tagId,
      'pjtNm': instance.pjtNm,
      'grpKey': instance.grpKey,
      'pjtNo': instance.pjtNo,
      'expDt': instance.expDt,
      'remark': instance.remark,
      'tagTypeNmRowspan': instance.tagTypeNmRowspan,
      'prtNo': instance.prtNo,
      'itemNm': instance.itemNm,
      'selectedRowspan': instance.selectedRowspan,
      'inEdit': instance.inEdit,
      'lotNo': instance.lotNo,
      'noRowspan': instance.noRowspan,
      'tagType': instance.tagType,
      'vendNm': instance.vendNm,
      'dQty': instance.dQty,
      'selected': instance.selected,
      'wmsQty': instance.wmsQty,
      'itemCd': instance.itemCd,
      'tagNo': instance.tagNo,
      'totWht': instance.totWht,
      'whtUnit': instance.whtUnit,
      'setQty': instance.setQty,
      'boxWht': instance.boxWht,
      'qrNo': instance.qrNo,
      'qty': instance.qty,
      'wmsQtyUnit': instance.wmsQtyUnit,
      'vendCd': instance.vendCd,
      'qtyUnit': instance.qtyUnit,
      'tagTypeNm': instance.tagTypeNm,
      'mstKey': instance.mstKey,
      'setQtyRowspan': instance.setQtyRowspan,
      'prtDt': instance.prtDt,
    };
