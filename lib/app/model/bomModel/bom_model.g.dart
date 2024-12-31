// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bom_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BomModelImpl _$$BomModelImplFromJson(Map<String, dynamic> json) =>
    _$BomModelImpl(
      header: json['header'] == null
          ? null
          : Header.fromJson(json['header'] as Map<String, dynamic>),
      resultCode: json['resultCode'] as String? ?? '',
      resultMessage: json['resultMessage'] as String? ?? '',
      body: json['body'] as List<dynamic>?,
    );

Map<String, dynamic> _$$BomModelImplToJson(_$BomModelImpl instance) =>
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
      resultValue: json['resultValue'] as bool? ?? false,
      resultRowCount: (json['resultRowCount'] as num?)?.toInt() ?? 0,
      resultCode: json['resultCode'] as String? ?? '',
      resultMessage: json['resultMessage'] ?? '',
      errorState: json['errorState'] ?? '',
      errorProcedure: json['errorProcedure'] ?? '',
      returnMessage: json['returnMessage'] ?? '',
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

_$SubBodyItemImpl _$$SubBodyItemImplFromJson(Map<String, dynamic> json) =>
    _$SubBodyItemImpl(
      bcAfUserId: json['bcAfUserId'] as String? ?? '',
      BC_AF_RST: json['BC_AF_RST'] as String? ?? '',
      bcAfDtm: json['bcAfDtm'] as String? ?? '',
      soNo: json['soNo'] as String? ?? '',
      BC_TYPE: json['BC_TYPE'] as String? ?? '',
      bcType: json['bcType'] as String? ?? '',
      pitmCd: json['pitmCd'] as String? ?? '',
      bcId: (json['bcId'] as num?)?.toInt() ?? 0,
      BC_STATUS: json['BC_STATUS'] as String? ?? '',
      setQty: (json['setQty'] as num?)?.toInt() ?? 0,
      pdtNo: json['pdtNo'] as String? ?? '',
      bxDtm: json['bxDtm'] as String? ?? '',
      bcAfRst: json['bcAfRst'] as String? ?? '',
      bcRmk: json['bcRmk'] as String? ?? '',
      bcStatus: json['bcStatus'] as String? ?? '',
      selected: (json['selected'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$SubBodyItemImplToJson(_$SubBodyItemImpl instance) =>
    <String, dynamic>{
      'bcAfUserId': instance.bcAfUserId,
      'BC_AF_RST': instance.BC_AF_RST,
      'bcAfDtm': instance.bcAfDtm,
      'soNo': instance.soNo,
      'BC_TYPE': instance.BC_TYPE,
      'bcType': instance.bcType,
      'pitmCd': instance.pitmCd,
      'bcId': instance.bcId,
      'BC_STATUS': instance.BC_STATUS,
      'setQty': instance.setQty,
      'pdtNo': instance.pdtNo,
      'bxDtm': instance.bxDtm,
      'bcAfRst': instance.bcAfRst,
      'bcRmk': instance.bcRmk,
      'bcStatus': instance.bcStatus,
      'selected': instance.selected,
    };
