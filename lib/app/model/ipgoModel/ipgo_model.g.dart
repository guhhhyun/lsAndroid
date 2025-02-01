// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ipgo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IpgoModelImpl _$$IpgoModelImplFromJson(Map<String, dynamic> json) =>
    _$IpgoModelImpl(
      header: json['header'] == null
          ? null
          : Header.fromJson(json['header'] as Map<String, dynamic>),
      resultCode: json['resultCode'] as String? ?? 'false',
      resultMessage: json['resultMessage'] as String? ?? '',
      body: json['body'] as List<dynamic>?,
    );

Map<String, dynamic> _$$IpgoModelImplToJson(_$IpgoModelImpl instance) =>
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
      orders: json['orders'],
      chnlCd: json['chnlCd'],
    );

Map<String, dynamic> _$$HeaderImplToJson(_$HeaderImpl instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'pageSize': instance.pageSize,
      'totalRecords': instance.totalRecords,
      'orders': instance.orders,
      'chnlCd': instance.chnlCd,
    };

_$BodyItem1Impl _$$BodyItem1ImplFromJson(Map<String, dynamic> json) =>
    _$BodyItem1Impl(
      body: (json['body'] as List<dynamic>?)
          ?.map((e) => BodyItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BodyItem1ImplToJson(_$BodyItem1Impl instance) =>
    <String, dynamic>{
      'body': instance.body,
    };

_$BodyItemImpl _$$BodyItemImplFromJson(Map<String, dynamic> json) =>
    _$BodyItemImpl(
      no: (json['no'] as num?)?.toInt() ?? 0,
      doc1Rowspan: (json['doc1Rowspan'] as num?)?.toInt() ?? 0,
      doc1Seq: (json['doc1Seq'] as num?)?.toInt() ?? 0,
      pjtNm: json['pjtNm'] as String? ?? '',
      grpKey: json['grpKey'] as String? ?? '',
      pjtNo: json['pjtNo'],
      inbType: json['inbType'] as String? ?? '',
      soNo: json['soNo'],
      itemNm: json['itemNm'] as String? ?? '',
      selectedRowspan: (json['selectedRowspan'] as num?)?.toInt() ?? 0,
      grDtRowspan: (json['grDtRowspan'] as num?)?.toInt() ?? 0,
      sapQtyUnit: json['sapQtyUnit'] ?? '',
      pjtNm2: json['pjtNm2'],
      vendNmRowspan: (json['vendNmRowspan'] as num?)?.toInt() ?? 0,
      doc2: json['doc2'],
      noRowspan: (json['noRowspan'] as num?)?.toInt() ?? 0,
      doc1: json['doc1'] as String? ?? '',
      rmnQty: json['rmnQty'] ?? 0.0,
      vendNm: json['vendNm'] as String? ?? '',
      pjtNmRowspan: (json['pjtNmRowspan'] as num?)?.toInt() ?? 0,
      selected: json['selected'] as bool? ?? false,
      wmsQty: json['wmsQty'] ?? 0.0,
      doc2Seq: json['doc2Seq'],
      whCd: json['whCd'] as String? ?? '',
      pkNo: json['pkNo'],
      grDt: json['grDt'] as String? ?? '',
      itemCd: json['itemCd'] as String? ?? '',
      appDttm: json['appDttm'],
      lgort: json['lgort'],
      plant: json['plant'] as String? ?? '',
      wmsQtyUnit: json['wmsQtyUnit'],
      vendCd: json['vendCd'],
      mstKey: json['mstKey'] as String? ?? '',
      sapQty: json['sapQty'] ?? 0.0,
      cntQty: (json['cntQty'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$BodyItemImplToJson(_$BodyItemImpl instance) =>
    <String, dynamic>{
      'no': instance.no,
      'doc1Rowspan': instance.doc1Rowspan,
      'doc1Seq': instance.doc1Seq,
      'pjtNm': instance.pjtNm,
      'grpKey': instance.grpKey,
      'pjtNo': instance.pjtNo,
      'inbType': instance.inbType,
      'soNo': instance.soNo,
      'itemNm': instance.itemNm,
      'selectedRowspan': instance.selectedRowspan,
      'grDtRowspan': instance.grDtRowspan,
      'sapQtyUnit': instance.sapQtyUnit,
      'pjtNm2': instance.pjtNm2,
      'vendNmRowspan': instance.vendNmRowspan,
      'doc2': instance.doc2,
      'noRowspan': instance.noRowspan,
      'doc1': instance.doc1,
      'rmnQty': instance.rmnQty,
      'vendNm': instance.vendNm,
      'pjtNmRowspan': instance.pjtNmRowspan,
      'selected': instance.selected,
      'wmsQty': instance.wmsQty,
      'doc2Seq': instance.doc2Seq,
      'whCd': instance.whCd,
      'pkNo': instance.pkNo,
      'grDt': instance.grDt,
      'itemCd': instance.itemCd,
      'appDttm': instance.appDttm,
      'lgort': instance.lgort,
      'plant': instance.plant,
      'wmsQtyUnit': instance.wmsQtyUnit,
      'vendCd': instance.vendCd,
      'mstKey': instance.mstKey,
      'sapQty': instance.sapQty,
      'cntQty': instance.cntQty,
    };
