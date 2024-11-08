// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginModelImpl _$$LoginModelImplFromJson(Map<String, dynamic> json) =>
    _$LoginModelImpl(
      header: json['header'] == null
          ? null
          : Header.fromJson(json['header'] as Map<String, dynamic>),
      resultCode: json['resultCode'] as String? ?? 'false',
      resultMessage: json['resultMessage'] as String? ?? '',
      body: json['body'] == null
          ? null
          : Body.fromJson(json['body'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LoginModelImplToJson(_$LoginModelImpl instance) =>
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

_$BodyImpl _$$BodyImplFromJson(Map<String, dynamic> json) => _$BodyImpl(
      resCd: json['resCd'] as String? ?? '',
      hasUser: json['hasUser'] as bool? ?? false,
      userKey: json['userKey'] as String? ?? '',
      duplicationKey: json['duplicationKey'] as String? ?? '',
      userName: json['userName'] as String? ?? '',
      orgNm: json['orgNm'],
      deptCd: json['deptCd'],
      deptNm: json['deptNm'] as String? ?? '',
      resetPassword: json['resetPassword'] as bool? ?? false,
      loginFailCnt: (json['loginFailCnt'] as num?)?.toInt() ?? 0,
      pwdUnchangedDays: (json['pwdUnchangedDays'] as num?)?.toInt() ?? 0,
      completed: json['completed'] as bool? ?? false,
      authorities: (json['authorities'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Authority.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BodyImplToJson(_$BodyImpl instance) =>
    <String, dynamic>{
      'resCd': instance.resCd,
      'hasUser': instance.hasUser,
      'userKey': instance.userKey,
      'duplicationKey': instance.duplicationKey,
      'userName': instance.userName,
      'orgNm': instance.orgNm,
      'deptCd': instance.deptCd,
      'deptNm': instance.deptNm,
      'resetPassword': instance.resetPassword,
      'loginFailCnt': instance.loginFailCnt,
      'pwdUnchangedDays': instance.pwdUnchangedDays,
      'completed': instance.completed,
      'authorities': instance.authorities,
    };

_$AuthorityImpl _$$AuthorityImplFromJson(Map<String, dynamic> json) =>
    _$AuthorityImpl(
      menuId: json['menuId'] as String? ?? '',
      authority: json['authority'] as String? ?? '',
      clientAuthority: json['clientAuthority'] as String? ?? '',
      programId: json['programId'] as String?,
    );

Map<String, dynamic> _$$AuthorityImplToJson(_$AuthorityImpl instance) =>
    <String, dynamic>{
      'menuId': instance.menuId,
      'authority': instance.authority,
      'clientAuthority': instance.clientAuthority,
      'programId': instance.programId,
    };