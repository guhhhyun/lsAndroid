// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) {
  return _LoginModel.fromJson(json);
}

/// @nodoc
mixin _$LoginModel {
  Header? get header => throw _privateConstructorUsedError;
  String get resultCode => throw _privateConstructorUsedError;
  String get resultMessage => throw _privateConstructorUsedError;
  Body? get body => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginModelCopyWith<LoginModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginModelCopyWith<$Res> {
  factory $LoginModelCopyWith(
          LoginModel value, $Res Function(LoginModel) then) =
      _$LoginModelCopyWithImpl<$Res, LoginModel>;
  @useResult
  $Res call(
      {Header? header,
      String resultCode,
      String resultMessage,
      Body? body,
      bool hasError});

  $HeaderCopyWith<$Res>? get header;
  $BodyCopyWith<$Res>? get body;
}

/// @nodoc
class _$LoginModelCopyWithImpl<$Res, $Val extends LoginModel>
    implements $LoginModelCopyWith<$Res> {
  _$LoginModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? header = freezed,
    Object? resultCode = null,
    Object? resultMessage = null,
    Object? body = freezed,
    Object? hasError = null,
  }) {
    return _then(_value.copyWith(
      header: freezed == header
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as Header?,
      resultCode: null == resultCode
          ? _value.resultCode
          : resultCode // ignore: cast_nullable_to_non_nullable
              as String,
      resultMessage: null == resultMessage
          ? _value.resultMessage
          : resultMessage // ignore: cast_nullable_to_non_nullable
              as String,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as Body?,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $HeaderCopyWith<$Res>? get header {
    if (_value.header == null) {
      return null;
    }

    return $HeaderCopyWith<$Res>(_value.header!, (value) {
      return _then(_value.copyWith(header: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BodyCopyWith<$Res>? get body {
    if (_value.body == null) {
      return null;
    }

    return $BodyCopyWith<$Res>(_value.body!, (value) {
      return _then(_value.copyWith(body: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoginModelImplCopyWith<$Res>
    implements $LoginModelCopyWith<$Res> {
  factory _$$LoginModelImplCopyWith(
          _$LoginModelImpl value, $Res Function(_$LoginModelImpl) then) =
      __$$LoginModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Header? header,
      String resultCode,
      String resultMessage,
      Body? body,
      bool hasError});

  @override
  $HeaderCopyWith<$Res>? get header;
  @override
  $BodyCopyWith<$Res>? get body;
}

/// @nodoc
class __$$LoginModelImplCopyWithImpl<$Res>
    extends _$LoginModelCopyWithImpl<$Res, _$LoginModelImpl>
    implements _$$LoginModelImplCopyWith<$Res> {
  __$$LoginModelImplCopyWithImpl(
      _$LoginModelImpl _value, $Res Function(_$LoginModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? header = freezed,
    Object? resultCode = null,
    Object? resultMessage = null,
    Object? body = freezed,
    Object? hasError = null,
  }) {
    return _then(_$LoginModelImpl(
      header: freezed == header
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as Header?,
      resultCode: null == resultCode
          ? _value.resultCode
          : resultCode // ignore: cast_nullable_to_non_nullable
              as String,
      resultMessage: null == resultMessage
          ? _value.resultMessage
          : resultMessage // ignore: cast_nullable_to_non_nullable
              as String,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as Body?,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginModelImpl implements _LoginModel {
  const _$LoginModelImpl(
      {this.header,
      this.resultCode = '',
      this.resultMessage = '',
      this.body,
      this.hasError = false});

  factory _$LoginModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginModelImplFromJson(json);

  @override
  final Header? header;
  @override
  @JsonKey()
  final String resultCode;
  @override
  @JsonKey()
  final String resultMessage;
  @override
  final Body? body;
  @override
  @JsonKey()
  final bool hasError;

  @override
  String toString() {
    return 'LoginModel(header: $header, resultCode: $resultCode, resultMessage: $resultMessage, body: $body, hasError: $hasError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginModelImpl &&
            (identical(other.header, header) || other.header == header) &&
            (identical(other.resultCode, resultCode) ||
                other.resultCode == resultCode) &&
            (identical(other.resultMessage, resultMessage) ||
                other.resultMessage == resultMessage) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, header, resultCode, resultMessage, body, hasError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginModelImplCopyWith<_$LoginModelImpl> get copyWith =>
      __$$LoginModelImplCopyWithImpl<_$LoginModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginModelImplToJson(
      this,
    );
  }
}

abstract class _LoginModel implements LoginModel {
  const factory _LoginModel(
      {final Header? header,
      final String resultCode,
      final String resultMessage,
      final Body? body,
      final bool hasError}) = _$LoginModelImpl;

  factory _LoginModel.fromJson(Map<String, dynamic> json) =
      _$LoginModelImpl.fromJson;

  @override
  Header? get header;
  @override
  String get resultCode;
  @override
  String get resultMessage;
  @override
  Body? get body;
  @override
  bool get hasError;
  @override
  @JsonKey(ignore: true)
  _$$LoginModelImplCopyWith<_$LoginModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Header _$HeaderFromJson(Map<String, dynamic> json) {
  return _Header.fromJson(json);
}

/// @nodoc
mixin _$Header {
  int get currentPage => throw _privateConstructorUsedError;
  int get pageSize => throw _privateConstructorUsedError;
  int get totalRecords => throw _privateConstructorUsedError;
  String get orders => throw _privateConstructorUsedError;
  String get chnlCd => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HeaderCopyWith<Header> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HeaderCopyWith<$Res> {
  factory $HeaderCopyWith(Header value, $Res Function(Header) then) =
      _$HeaderCopyWithImpl<$Res, Header>;
  @useResult
  $Res call(
      {int currentPage,
      int pageSize,
      int totalRecords,
      String orders,
      String chnlCd});
}

/// @nodoc
class _$HeaderCopyWithImpl<$Res, $Val extends Header>
    implements $HeaderCopyWith<$Res> {
  _$HeaderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? pageSize = null,
    Object? totalRecords = null,
    Object? orders = null,
    Object? chnlCd = null,
  }) {
    return _then(_value.copyWith(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      totalRecords: null == totalRecords
          ? _value.totalRecords
          : totalRecords // ignore: cast_nullable_to_non_nullable
              as int,
      orders: null == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as String,
      chnlCd: null == chnlCd
          ? _value.chnlCd
          : chnlCd // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HeaderImplCopyWith<$Res> implements $HeaderCopyWith<$Res> {
  factory _$$HeaderImplCopyWith(
          _$HeaderImpl value, $Res Function(_$HeaderImpl) then) =
      __$$HeaderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int currentPage,
      int pageSize,
      int totalRecords,
      String orders,
      String chnlCd});
}

/// @nodoc
class __$$HeaderImplCopyWithImpl<$Res>
    extends _$HeaderCopyWithImpl<$Res, _$HeaderImpl>
    implements _$$HeaderImplCopyWith<$Res> {
  __$$HeaderImplCopyWithImpl(
      _$HeaderImpl _value, $Res Function(_$HeaderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? pageSize = null,
    Object? totalRecords = null,
    Object? orders = null,
    Object? chnlCd = null,
  }) {
    return _then(_$HeaderImpl(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      totalRecords: null == totalRecords
          ? _value.totalRecords
          : totalRecords // ignore: cast_nullable_to_non_nullable
              as int,
      orders: null == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as String,
      chnlCd: null == chnlCd
          ? _value.chnlCd
          : chnlCd // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HeaderImpl implements _Header {
  const _$HeaderImpl(
      {this.currentPage = 0,
      this.pageSize = 0,
      this.totalRecords = 0,
      this.orders = '',
      this.chnlCd = ''});

  factory _$HeaderImpl.fromJson(Map<String, dynamic> json) =>
      _$$HeaderImplFromJson(json);

  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final int pageSize;
  @override
  @JsonKey()
  final int totalRecords;
  @override
  @JsonKey()
  final String orders;
  @override
  @JsonKey()
  final String chnlCd;

  @override
  String toString() {
    return 'Header(currentPage: $currentPage, pageSize: $pageSize, totalRecords: $totalRecords, orders: $orders, chnlCd: $chnlCd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HeaderImpl &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.totalRecords, totalRecords) ||
                other.totalRecords == totalRecords) &&
            (identical(other.orders, orders) || other.orders == orders) &&
            (identical(other.chnlCd, chnlCd) || other.chnlCd == chnlCd));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, currentPage, pageSize, totalRecords, orders, chnlCd);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HeaderImplCopyWith<_$HeaderImpl> get copyWith =>
      __$$HeaderImplCopyWithImpl<_$HeaderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HeaderImplToJson(
      this,
    );
  }
}

abstract class _Header implements Header {
  const factory _Header(
      {final int currentPage,
      final int pageSize,
      final int totalRecords,
      final String orders,
      final String chnlCd}) = _$HeaderImpl;

  factory _Header.fromJson(Map<String, dynamic> json) = _$HeaderImpl.fromJson;

  @override
  int get currentPage;
  @override
  int get pageSize;
  @override
  int get totalRecords;
  @override
  String get orders;
  @override
  String get chnlCd;
  @override
  @JsonKey(ignore: true)
  _$$HeaderImplCopyWith<_$HeaderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Body _$BodyFromJson(Map<String, dynamic> json) {
  return _Body.fromJson(json);
}

/// @nodoc
mixin _$Body {
  String get resCd => throw _privateConstructorUsedError;
  bool get hasUser => throw _privateConstructorUsedError;
  String get userKey => throw _privateConstructorUsedError;
  String get duplicationKey => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get orgNm => throw _privateConstructorUsedError;
  String get deptCd => throw _privateConstructorUsedError;
  String get deptNm => throw _privateConstructorUsedError;
  bool get resetPassword => throw _privateConstructorUsedError;
  int get loginFailCnt => throw _privateConstructorUsedError;
  int get pwdUnchangedDays => throw _privateConstructorUsedError;
  bool get completed => throw _privateConstructorUsedError;
  List<Authority>? get authorities => throw _privateConstructorUsedError;
  List<dynamic>? get userMenus => throw _privateConstructorUsedError;
  String get sessionId => throw _privateConstructorUsedError;
  bool get authenticated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BodyCopyWith<Body> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BodyCopyWith<$Res> {
  factory $BodyCopyWith(Body value, $Res Function(Body) then) =
      _$BodyCopyWithImpl<$Res, Body>;
  @useResult
  $Res call(
      {String resCd,
      bool hasUser,
      String userKey,
      String duplicationKey,
      String userName,
      String orgNm,
      String deptCd,
      String deptNm,
      bool resetPassword,
      int loginFailCnt,
      int pwdUnchangedDays,
      bool completed,
      List<Authority>? authorities,
      List<dynamic>? userMenus,
      String sessionId,
      bool authenticated});
}

/// @nodoc
class _$BodyCopyWithImpl<$Res, $Val extends Body>
    implements $BodyCopyWith<$Res> {
  _$BodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resCd = null,
    Object? hasUser = null,
    Object? userKey = null,
    Object? duplicationKey = null,
    Object? userName = null,
    Object? orgNm = null,
    Object? deptCd = null,
    Object? deptNm = null,
    Object? resetPassword = null,
    Object? loginFailCnt = null,
    Object? pwdUnchangedDays = null,
    Object? completed = null,
    Object? authorities = freezed,
    Object? userMenus = freezed,
    Object? sessionId = null,
    Object? authenticated = null,
  }) {
    return _then(_value.copyWith(
      resCd: null == resCd
          ? _value.resCd
          : resCd // ignore: cast_nullable_to_non_nullable
              as String,
      hasUser: null == hasUser
          ? _value.hasUser
          : hasUser // ignore: cast_nullable_to_non_nullable
              as bool,
      userKey: null == userKey
          ? _value.userKey
          : userKey // ignore: cast_nullable_to_non_nullable
              as String,
      duplicationKey: null == duplicationKey
          ? _value.duplicationKey
          : duplicationKey // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      orgNm: null == orgNm
          ? _value.orgNm
          : orgNm // ignore: cast_nullable_to_non_nullable
              as String,
      deptCd: null == deptCd
          ? _value.deptCd
          : deptCd // ignore: cast_nullable_to_non_nullable
              as String,
      deptNm: null == deptNm
          ? _value.deptNm
          : deptNm // ignore: cast_nullable_to_non_nullable
              as String,
      resetPassword: null == resetPassword
          ? _value.resetPassword
          : resetPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      loginFailCnt: null == loginFailCnt
          ? _value.loginFailCnt
          : loginFailCnt // ignore: cast_nullable_to_non_nullable
              as int,
      pwdUnchangedDays: null == pwdUnchangedDays
          ? _value.pwdUnchangedDays
          : pwdUnchangedDays // ignore: cast_nullable_to_non_nullable
              as int,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
      authorities: freezed == authorities
          ? _value.authorities
          : authorities // ignore: cast_nullable_to_non_nullable
              as List<Authority>?,
      userMenus: freezed == userMenus
          ? _value.userMenus
          : userMenus // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      authenticated: null == authenticated
          ? _value.authenticated
          : authenticated // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BodyImplCopyWith<$Res> implements $BodyCopyWith<$Res> {
  factory _$$BodyImplCopyWith(
          _$BodyImpl value, $Res Function(_$BodyImpl) then) =
      __$$BodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String resCd,
      bool hasUser,
      String userKey,
      String duplicationKey,
      String userName,
      String orgNm,
      String deptCd,
      String deptNm,
      bool resetPassword,
      int loginFailCnt,
      int pwdUnchangedDays,
      bool completed,
      List<Authority>? authorities,
      List<dynamic>? userMenus,
      String sessionId,
      bool authenticated});
}

/// @nodoc
class __$$BodyImplCopyWithImpl<$Res>
    extends _$BodyCopyWithImpl<$Res, _$BodyImpl>
    implements _$$BodyImplCopyWith<$Res> {
  __$$BodyImplCopyWithImpl(_$BodyImpl _value, $Res Function(_$BodyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resCd = null,
    Object? hasUser = null,
    Object? userKey = null,
    Object? duplicationKey = null,
    Object? userName = null,
    Object? orgNm = null,
    Object? deptCd = null,
    Object? deptNm = null,
    Object? resetPassword = null,
    Object? loginFailCnt = null,
    Object? pwdUnchangedDays = null,
    Object? completed = null,
    Object? authorities = freezed,
    Object? userMenus = freezed,
    Object? sessionId = null,
    Object? authenticated = null,
  }) {
    return _then(_$BodyImpl(
      resCd: null == resCd
          ? _value.resCd
          : resCd // ignore: cast_nullable_to_non_nullable
              as String,
      hasUser: null == hasUser
          ? _value.hasUser
          : hasUser // ignore: cast_nullable_to_non_nullable
              as bool,
      userKey: null == userKey
          ? _value.userKey
          : userKey // ignore: cast_nullable_to_non_nullable
              as String,
      duplicationKey: null == duplicationKey
          ? _value.duplicationKey
          : duplicationKey // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      orgNm: null == orgNm
          ? _value.orgNm
          : orgNm // ignore: cast_nullable_to_non_nullable
              as String,
      deptCd: null == deptCd
          ? _value.deptCd
          : deptCd // ignore: cast_nullable_to_non_nullable
              as String,
      deptNm: null == deptNm
          ? _value.deptNm
          : deptNm // ignore: cast_nullable_to_non_nullable
              as String,
      resetPassword: null == resetPassword
          ? _value.resetPassword
          : resetPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      loginFailCnt: null == loginFailCnt
          ? _value.loginFailCnt
          : loginFailCnt // ignore: cast_nullable_to_non_nullable
              as int,
      pwdUnchangedDays: null == pwdUnchangedDays
          ? _value.pwdUnchangedDays
          : pwdUnchangedDays // ignore: cast_nullable_to_non_nullable
              as int,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
      authorities: freezed == authorities
          ? _value._authorities
          : authorities // ignore: cast_nullable_to_non_nullable
              as List<Authority>?,
      userMenus: freezed == userMenus
          ? _value._userMenus
          : userMenus // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      authenticated: null == authenticated
          ? _value.authenticated
          : authenticated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BodyImpl implements _Body {
  const _$BodyImpl(
      {this.resCd = '',
      this.hasUser = false,
      this.userKey = '',
      this.duplicationKey = '',
      this.userName = '',
      this.orgNm = '',
      this.deptCd = '',
      this.deptNm = '',
      this.resetPassword = false,
      this.loginFailCnt = 0,
      this.pwdUnchangedDays = 0,
      this.completed = false,
      final List<Authority>? authorities,
      final List<dynamic>? userMenus,
      this.sessionId = '',
      this.authenticated = false})
      : _authorities = authorities,
        _userMenus = userMenus;

  factory _$BodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$BodyImplFromJson(json);

  @override
  @JsonKey()
  final String resCd;
  @override
  @JsonKey()
  final bool hasUser;
  @override
  @JsonKey()
  final String userKey;
  @override
  @JsonKey()
  final String duplicationKey;
  @override
  @JsonKey()
  final String userName;
  @override
  @JsonKey()
  final String orgNm;
  @override
  @JsonKey()
  final String deptCd;
  @override
  @JsonKey()
  final String deptNm;
  @override
  @JsonKey()
  final bool resetPassword;
  @override
  @JsonKey()
  final int loginFailCnt;
  @override
  @JsonKey()
  final int pwdUnchangedDays;
  @override
  @JsonKey()
  final bool completed;
  final List<Authority>? _authorities;
  @override
  List<Authority>? get authorities {
    final value = _authorities;
    if (value == null) return null;
    if (_authorities is EqualUnmodifiableListView) return _authorities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _userMenus;
  @override
  List<dynamic>? get userMenus {
    final value = _userMenus;
    if (value == null) return null;
    if (_userMenus is EqualUnmodifiableListView) return _userMenus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final String sessionId;
  @override
  @JsonKey()
  final bool authenticated;

  @override
  String toString() {
    return 'Body(resCd: $resCd, hasUser: $hasUser, userKey: $userKey, duplicationKey: $duplicationKey, userName: $userName, orgNm: $orgNm, deptCd: $deptCd, deptNm: $deptNm, resetPassword: $resetPassword, loginFailCnt: $loginFailCnt, pwdUnchangedDays: $pwdUnchangedDays, completed: $completed, authorities: $authorities, userMenus: $userMenus, sessionId: $sessionId, authenticated: $authenticated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BodyImpl &&
            (identical(other.resCd, resCd) || other.resCd == resCd) &&
            (identical(other.hasUser, hasUser) || other.hasUser == hasUser) &&
            (identical(other.userKey, userKey) || other.userKey == userKey) &&
            (identical(other.duplicationKey, duplicationKey) ||
                other.duplicationKey == duplicationKey) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.orgNm, orgNm) || other.orgNm == orgNm) &&
            (identical(other.deptCd, deptCd) || other.deptCd == deptCd) &&
            (identical(other.deptNm, deptNm) || other.deptNm == deptNm) &&
            (identical(other.resetPassword, resetPassword) ||
                other.resetPassword == resetPassword) &&
            (identical(other.loginFailCnt, loginFailCnt) ||
                other.loginFailCnt == loginFailCnt) &&
            (identical(other.pwdUnchangedDays, pwdUnchangedDays) ||
                other.pwdUnchangedDays == pwdUnchangedDays) &&
            (identical(other.completed, completed) ||
                other.completed == completed) &&
            const DeepCollectionEquality()
                .equals(other._authorities, _authorities) &&
            const DeepCollectionEquality()
                .equals(other._userMenus, _userMenus) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.authenticated, authenticated) ||
                other.authenticated == authenticated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      resCd,
      hasUser,
      userKey,
      duplicationKey,
      userName,
      orgNm,
      deptCd,
      deptNm,
      resetPassword,
      loginFailCnt,
      pwdUnchangedDays,
      completed,
      const DeepCollectionEquality().hash(_authorities),
      const DeepCollectionEquality().hash(_userMenus),
      sessionId,
      authenticated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BodyImplCopyWith<_$BodyImpl> get copyWith =>
      __$$BodyImplCopyWithImpl<_$BodyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BodyImplToJson(
      this,
    );
  }
}

abstract class _Body implements Body {
  const factory _Body(
      {final String resCd,
      final bool hasUser,
      final String userKey,
      final String duplicationKey,
      final String userName,
      final String orgNm,
      final String deptCd,
      final String deptNm,
      final bool resetPassword,
      final int loginFailCnt,
      final int pwdUnchangedDays,
      final bool completed,
      final List<Authority>? authorities,
      final List<dynamic>? userMenus,
      final String sessionId,
      final bool authenticated}) = _$BodyImpl;

  factory _Body.fromJson(Map<String, dynamic> json) = _$BodyImpl.fromJson;

  @override
  String get resCd;
  @override
  bool get hasUser;
  @override
  String get userKey;
  @override
  String get duplicationKey;
  @override
  String get userName;
  @override
  String get orgNm;
  @override
  String get deptCd;
  @override
  String get deptNm;
  @override
  bool get resetPassword;
  @override
  int get loginFailCnt;
  @override
  int get pwdUnchangedDays;
  @override
  bool get completed;
  @override
  List<Authority>? get authorities;
  @override
  List<dynamic>? get userMenus;
  @override
  String get sessionId;
  @override
  bool get authenticated;
  @override
  @JsonKey(ignore: true)
  _$$BodyImplCopyWith<_$BodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Authority _$AuthorityFromJson(Map<String, dynamic> json) {
  return _Authority.fromJson(json);
}

/// @nodoc
mixin _$Authority {
  String get menuId => throw _privateConstructorUsedError;
  String get authority => throw _privateConstructorUsedError;
  String get clientAuthority => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthorityCopyWith<Authority> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorityCopyWith<$Res> {
  factory $AuthorityCopyWith(Authority value, $Res Function(Authority) then) =
      _$AuthorityCopyWithImpl<$Res, Authority>;
  @useResult
  $Res call({String menuId, String authority, String clientAuthority});
}

/// @nodoc
class _$AuthorityCopyWithImpl<$Res, $Val extends Authority>
    implements $AuthorityCopyWith<$Res> {
  _$AuthorityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menuId = null,
    Object? authority = null,
    Object? clientAuthority = null,
  }) {
    return _then(_value.copyWith(
      menuId: null == menuId
          ? _value.menuId
          : menuId // ignore: cast_nullable_to_non_nullable
              as String,
      authority: null == authority
          ? _value.authority
          : authority // ignore: cast_nullable_to_non_nullable
              as String,
      clientAuthority: null == clientAuthority
          ? _value.clientAuthority
          : clientAuthority // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthorityImplCopyWith<$Res>
    implements $AuthorityCopyWith<$Res> {
  factory _$$AuthorityImplCopyWith(
          _$AuthorityImpl value, $Res Function(_$AuthorityImpl) then) =
      __$$AuthorityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String menuId, String authority, String clientAuthority});
}

/// @nodoc
class __$$AuthorityImplCopyWithImpl<$Res>
    extends _$AuthorityCopyWithImpl<$Res, _$AuthorityImpl>
    implements _$$AuthorityImplCopyWith<$Res> {
  __$$AuthorityImplCopyWithImpl(
      _$AuthorityImpl _value, $Res Function(_$AuthorityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menuId = null,
    Object? authority = null,
    Object? clientAuthority = null,
  }) {
    return _then(_$AuthorityImpl(
      menuId: null == menuId
          ? _value.menuId
          : menuId // ignore: cast_nullable_to_non_nullable
              as String,
      authority: null == authority
          ? _value.authority
          : authority // ignore: cast_nullable_to_non_nullable
              as String,
      clientAuthority: null == clientAuthority
          ? _value.clientAuthority
          : clientAuthority // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthorityImpl implements _Authority {
  const _$AuthorityImpl(
      {this.menuId = '', this.authority = '', this.clientAuthority = ''});

  factory _$AuthorityImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthorityImplFromJson(json);

  @override
  @JsonKey()
  final String menuId;
  @override
  @JsonKey()
  final String authority;
  @override
  @JsonKey()
  final String clientAuthority;

  @override
  String toString() {
    return 'Authority(menuId: $menuId, authority: $authority, clientAuthority: $clientAuthority)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthorityImpl &&
            (identical(other.menuId, menuId) || other.menuId == menuId) &&
            (identical(other.authority, authority) ||
                other.authority == authority) &&
            (identical(other.clientAuthority, clientAuthority) ||
                other.clientAuthority == clientAuthority));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, menuId, authority, clientAuthority);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthorityImplCopyWith<_$AuthorityImpl> get copyWith =>
      __$$AuthorityImplCopyWithImpl<_$AuthorityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthorityImplToJson(
      this,
    );
  }
}

abstract class _Authority implements Authority {
  const factory _Authority(
      {final String menuId,
      final String authority,
      final String clientAuthority}) = _$AuthorityImpl;

  factory _Authority.fromJson(Map<String, dynamic> json) =
      _$AuthorityImpl.fromJson;

  @override
  String get menuId;
  @override
  String get authority;
  @override
  String get clientAuthority;
  @override
  @JsonKey(ignore: true)
  _$$AuthorityImplCopyWith<_$AuthorityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
