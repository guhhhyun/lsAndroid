// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'zone_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ZoneModel _$ZoneModelFromJson(Map<String, dynamic> json) {
  return _ZoneModel.fromJson(json);
}

/// @nodoc
mixin _$ZoneModel {
  Header? get header => throw _privateConstructorUsedError;
  String get resultCode => throw _privateConstructorUsedError;
  String get resultMessage => throw _privateConstructorUsedError;
  List<dynamic>? get body => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ZoneModelCopyWith<ZoneModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ZoneModelCopyWith<$Res> {
  factory $ZoneModelCopyWith(ZoneModel value, $Res Function(ZoneModel) then) =
      _$ZoneModelCopyWithImpl<$Res, ZoneModel>;
  @useResult
  $Res call(
      {Header? header,
      String resultCode,
      String resultMessage,
      List<dynamic>? body,
      bool hasError});

  $HeaderCopyWith<$Res>? get header;
}

/// @nodoc
class _$ZoneModelCopyWithImpl<$Res, $Val extends ZoneModel>
    implements $ZoneModelCopyWith<$Res> {
  _$ZoneModelCopyWithImpl(this._value, this._then);

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
              as List<dynamic>?,
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
}

/// @nodoc
abstract class _$$ZoneModelImplCopyWith<$Res>
    implements $ZoneModelCopyWith<$Res> {
  factory _$$ZoneModelImplCopyWith(
          _$ZoneModelImpl value, $Res Function(_$ZoneModelImpl) then) =
      __$$ZoneModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Header? header,
      String resultCode,
      String resultMessage,
      List<dynamic>? body,
      bool hasError});

  @override
  $HeaderCopyWith<$Res>? get header;
}

/// @nodoc
class __$$ZoneModelImplCopyWithImpl<$Res>
    extends _$ZoneModelCopyWithImpl<$Res, _$ZoneModelImpl>
    implements _$$ZoneModelImplCopyWith<$Res> {
  __$$ZoneModelImplCopyWithImpl(
      _$ZoneModelImpl _value, $Res Function(_$ZoneModelImpl) _then)
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
    return _then(_$ZoneModelImpl(
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
          ? _value._body
          : body // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ZoneModelImpl implements _ZoneModel {
  const _$ZoneModelImpl(
      {this.header,
      this.resultCode = '',
      this.resultMessage = '',
      final List<dynamic>? body,
      this.hasError = false})
      : _body = body;

  factory _$ZoneModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ZoneModelImplFromJson(json);

  @override
  final Header? header;
  @override
  @JsonKey()
  final String resultCode;
  @override
  @JsonKey()
  final String resultMessage;
  final List<dynamic>? _body;
  @override
  List<dynamic>? get body {
    final value = _body;
    if (value == null) return null;
    if (_body is EqualUnmodifiableListView) return _body;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final bool hasError;

  @override
  String toString() {
    return 'ZoneModel(header: $header, resultCode: $resultCode, resultMessage: $resultMessage, body: $body, hasError: $hasError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ZoneModelImpl &&
            (identical(other.header, header) || other.header == header) &&
            (identical(other.resultCode, resultCode) ||
                other.resultCode == resultCode) &&
            (identical(other.resultMessage, resultMessage) ||
                other.resultMessage == resultMessage) &&
            const DeepCollectionEquality().equals(other._body, _body) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, header, resultCode,
      resultMessage, const DeepCollectionEquality().hash(_body), hasError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ZoneModelImplCopyWith<_$ZoneModelImpl> get copyWith =>
      __$$ZoneModelImplCopyWithImpl<_$ZoneModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ZoneModelImplToJson(
      this,
    );
  }
}

abstract class _ZoneModel implements ZoneModel {
  const factory _ZoneModel(
      {final Header? header,
      final String resultCode,
      final String resultMessage,
      final List<dynamic>? body,
      final bool hasError}) = _$ZoneModelImpl;

  factory _ZoneModel.fromJson(Map<String, dynamic> json) =
      _$ZoneModelImpl.fromJson;

  @override
  Header? get header;
  @override
  String get resultCode;
  @override
  String get resultMessage;
  @override
  List<dynamic>? get body;
  @override
  bool get hasError;
  @override
  @JsonKey(ignore: true)
  _$$ZoneModelImplCopyWith<_$ZoneModelImpl> get copyWith =>
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

BodyItem _$BodyItemFromJson(Map<String, dynamic> json) {
  return _BodyItem.fromJson(json);
}

/// @nodoc
mixin _$BodyItem {
  bool get resultValue => throw _privateConstructorUsedError;
  int get resultRowCount => throw _privateConstructorUsedError;
  String get resultCode => throw _privateConstructorUsedError;
  String get resultMessage => throw _privateConstructorUsedError;
  String get errorState => throw _privateConstructorUsedError;
  String get errorProcedure => throw _privateConstructorUsedError;
  String get returnMessage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BodyItemCopyWith<BodyItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BodyItemCopyWith<$Res> {
  factory $BodyItemCopyWith(BodyItem value, $Res Function(BodyItem) then) =
      _$BodyItemCopyWithImpl<$Res, BodyItem>;
  @useResult
  $Res call(
      {bool resultValue,
      int resultRowCount,
      String resultCode,
      String resultMessage,
      String errorState,
      String errorProcedure,
      String returnMessage});
}

/// @nodoc
class _$BodyItemCopyWithImpl<$Res, $Val extends BodyItem>
    implements $BodyItemCopyWith<$Res> {
  _$BodyItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resultValue = null,
    Object? resultRowCount = null,
    Object? resultCode = null,
    Object? resultMessage = null,
    Object? errorState = null,
    Object? errorProcedure = null,
    Object? returnMessage = null,
  }) {
    return _then(_value.copyWith(
      resultValue: null == resultValue
          ? _value.resultValue
          : resultValue // ignore: cast_nullable_to_non_nullable
              as bool,
      resultRowCount: null == resultRowCount
          ? _value.resultRowCount
          : resultRowCount // ignore: cast_nullable_to_non_nullable
              as int,
      resultCode: null == resultCode
          ? _value.resultCode
          : resultCode // ignore: cast_nullable_to_non_nullable
              as String,
      resultMessage: null == resultMessage
          ? _value.resultMessage
          : resultMessage // ignore: cast_nullable_to_non_nullable
              as String,
      errorState: null == errorState
          ? _value.errorState
          : errorState // ignore: cast_nullable_to_non_nullable
              as String,
      errorProcedure: null == errorProcedure
          ? _value.errorProcedure
          : errorProcedure // ignore: cast_nullable_to_non_nullable
              as String,
      returnMessage: null == returnMessage
          ? _value.returnMessage
          : returnMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BodyItemImplCopyWith<$Res>
    implements $BodyItemCopyWith<$Res> {
  factory _$$BodyItemImplCopyWith(
          _$BodyItemImpl value, $Res Function(_$BodyItemImpl) then) =
      __$$BodyItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool resultValue,
      int resultRowCount,
      String resultCode,
      String resultMessage,
      String errorState,
      String errorProcedure,
      String returnMessage});
}

/// @nodoc
class __$$BodyItemImplCopyWithImpl<$Res>
    extends _$BodyItemCopyWithImpl<$Res, _$BodyItemImpl>
    implements _$$BodyItemImplCopyWith<$Res> {
  __$$BodyItemImplCopyWithImpl(
      _$BodyItemImpl _value, $Res Function(_$BodyItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resultValue = null,
    Object? resultRowCount = null,
    Object? resultCode = null,
    Object? resultMessage = null,
    Object? errorState = null,
    Object? errorProcedure = null,
    Object? returnMessage = null,
  }) {
    return _then(_$BodyItemImpl(
      resultValue: null == resultValue
          ? _value.resultValue
          : resultValue // ignore: cast_nullable_to_non_nullable
              as bool,
      resultRowCount: null == resultRowCount
          ? _value.resultRowCount
          : resultRowCount // ignore: cast_nullable_to_non_nullable
              as int,
      resultCode: null == resultCode
          ? _value.resultCode
          : resultCode // ignore: cast_nullable_to_non_nullable
              as String,
      resultMessage: null == resultMessage
          ? _value.resultMessage
          : resultMessage // ignore: cast_nullable_to_non_nullable
              as String,
      errorState: null == errorState
          ? _value.errorState
          : errorState // ignore: cast_nullable_to_non_nullable
              as String,
      errorProcedure: null == errorProcedure
          ? _value.errorProcedure
          : errorProcedure // ignore: cast_nullable_to_non_nullable
              as String,
      returnMessage: null == returnMessage
          ? _value.returnMessage
          : returnMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BodyItemImpl implements _BodyItem {
  const _$BodyItemImpl(
      {this.resultValue = false,
      this.resultRowCount = 0,
      this.resultCode = '',
      this.resultMessage = '',
      this.errorState = '',
      this.errorProcedure = '',
      this.returnMessage = ''});

  factory _$BodyItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$BodyItemImplFromJson(json);

  @override
  @JsonKey()
  final bool resultValue;
  @override
  @JsonKey()
  final int resultRowCount;
  @override
  @JsonKey()
  final String resultCode;
  @override
  @JsonKey()
  final String resultMessage;
  @override
  @JsonKey()
  final String errorState;
  @override
  @JsonKey()
  final String errorProcedure;
  @override
  @JsonKey()
  final String returnMessage;

  @override
  String toString() {
    return 'BodyItem(resultValue: $resultValue, resultRowCount: $resultRowCount, resultCode: $resultCode, resultMessage: $resultMessage, errorState: $errorState, errorProcedure: $errorProcedure, returnMessage: $returnMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BodyItemImpl &&
            (identical(other.resultValue, resultValue) ||
                other.resultValue == resultValue) &&
            (identical(other.resultRowCount, resultRowCount) ||
                other.resultRowCount == resultRowCount) &&
            (identical(other.resultCode, resultCode) ||
                other.resultCode == resultCode) &&
            (identical(other.resultMessage, resultMessage) ||
                other.resultMessage == resultMessage) &&
            (identical(other.errorState, errorState) ||
                other.errorState == errorState) &&
            (identical(other.errorProcedure, errorProcedure) ||
                other.errorProcedure == errorProcedure) &&
            (identical(other.returnMessage, returnMessage) ||
                other.returnMessage == returnMessage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, resultValue, resultRowCount,
      resultCode, resultMessage, errorState, errorProcedure, returnMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BodyItemImplCopyWith<_$BodyItemImpl> get copyWith =>
      __$$BodyItemImplCopyWithImpl<_$BodyItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BodyItemImplToJson(
      this,
    );
  }
}

abstract class _BodyItem implements BodyItem {
  const factory _BodyItem(
      {final bool resultValue,
      final int resultRowCount,
      final String resultCode,
      final String resultMessage,
      final String errorState,
      final String errorProcedure,
      final String returnMessage}) = _$BodyItemImpl;

  factory _BodyItem.fromJson(Map<String, dynamic> json) =
      _$BodyItemImpl.fromJson;

  @override
  bool get resultValue;
  @override
  int get resultRowCount;
  @override
  String get resultCode;
  @override
  String get resultMessage;
  @override
  String get errorState;
  @override
  String get errorProcedure;
  @override
  String get returnMessage;
  @override
  @JsonKey(ignore: true)
  _$$BodyItemImplCopyWith<_$BodyItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Zone _$ZoneFromJson(Map<String, dynamic> json) {
  return _Zone.fromJson(json);
}

/// @nodoc
mixin _$Zone {
  String get PLANT => throw _privateConstructorUsedError;
  dynamic get UPD_USR_IP => throw _privateConstructorUsedError;
  dynamic get REG_USR_IP => throw _privateConstructorUsedError;
  String get WH_CD => throw _privateConstructorUsedError;
  dynamic get REG_DTTM => throw _privateConstructorUsedError;
  dynamic get UPD_DTTM => throw _privateConstructorUsedError;
  dynamic get DEL_USR_IP => throw _privateConstructorUsedError;
  dynamic get ZONE_RANK => throw _privateConstructorUsedError;
  dynamic get REG_USR_ID => throw _privateConstructorUsedError;
  String get DEL_YN => throw _privateConstructorUsedError;
  String get USE_YN => throw _privateConstructorUsedError;
  dynamic get DEL_DTTM => throw _privateConstructorUsedError;
  dynamic get UPD_USR_ID => throw _privateConstructorUsedError;
  String get ZONE_NM => throw _privateConstructorUsedError;
  dynamic get DEL_USR_ID => throw _privateConstructorUsedError;
  String get SORT_NO => throw _privateConstructorUsedError;
  dynamic get REMARK => throw _privateConstructorUsedError;
  String get ZONE_CD => throw _privateConstructorUsedError;
  String get ZONE_TYPE => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ZoneCopyWith<Zone> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ZoneCopyWith<$Res> {
  factory $ZoneCopyWith(Zone value, $Res Function(Zone) then) =
      _$ZoneCopyWithImpl<$Res, Zone>;
  @useResult
  $Res call(
      {String PLANT,
      dynamic UPD_USR_IP,
      dynamic REG_USR_IP,
      String WH_CD,
      dynamic REG_DTTM,
      dynamic UPD_DTTM,
      dynamic DEL_USR_IP,
      dynamic ZONE_RANK,
      dynamic REG_USR_ID,
      String DEL_YN,
      String USE_YN,
      dynamic DEL_DTTM,
      dynamic UPD_USR_ID,
      String ZONE_NM,
      dynamic DEL_USR_ID,
      String SORT_NO,
      dynamic REMARK,
      String ZONE_CD,
      String ZONE_TYPE});
}

/// @nodoc
class _$ZoneCopyWithImpl<$Res, $Val extends Zone>
    implements $ZoneCopyWith<$Res> {
  _$ZoneCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? PLANT = null,
    Object? UPD_USR_IP = freezed,
    Object? REG_USR_IP = freezed,
    Object? WH_CD = null,
    Object? REG_DTTM = freezed,
    Object? UPD_DTTM = freezed,
    Object? DEL_USR_IP = freezed,
    Object? ZONE_RANK = freezed,
    Object? REG_USR_ID = freezed,
    Object? DEL_YN = null,
    Object? USE_YN = null,
    Object? DEL_DTTM = freezed,
    Object? UPD_USR_ID = freezed,
    Object? ZONE_NM = null,
    Object? DEL_USR_ID = freezed,
    Object? SORT_NO = null,
    Object? REMARK = freezed,
    Object? ZONE_CD = null,
    Object? ZONE_TYPE = null,
  }) {
    return _then(_value.copyWith(
      PLANT: null == PLANT
          ? _value.PLANT
          : PLANT // ignore: cast_nullable_to_non_nullable
              as String,
      UPD_USR_IP: freezed == UPD_USR_IP
          ? _value.UPD_USR_IP
          : UPD_USR_IP // ignore: cast_nullable_to_non_nullable
              as dynamic,
      REG_USR_IP: freezed == REG_USR_IP
          ? _value.REG_USR_IP
          : REG_USR_IP // ignore: cast_nullable_to_non_nullable
              as dynamic,
      WH_CD: null == WH_CD
          ? _value.WH_CD
          : WH_CD // ignore: cast_nullable_to_non_nullable
              as String,
      REG_DTTM: freezed == REG_DTTM
          ? _value.REG_DTTM
          : REG_DTTM // ignore: cast_nullable_to_non_nullable
              as dynamic,
      UPD_DTTM: freezed == UPD_DTTM
          ? _value.UPD_DTTM
          : UPD_DTTM // ignore: cast_nullable_to_non_nullable
              as dynamic,
      DEL_USR_IP: freezed == DEL_USR_IP
          ? _value.DEL_USR_IP
          : DEL_USR_IP // ignore: cast_nullable_to_non_nullable
              as dynamic,
      ZONE_RANK: freezed == ZONE_RANK
          ? _value.ZONE_RANK
          : ZONE_RANK // ignore: cast_nullable_to_non_nullable
              as dynamic,
      REG_USR_ID: freezed == REG_USR_ID
          ? _value.REG_USR_ID
          : REG_USR_ID // ignore: cast_nullable_to_non_nullable
              as dynamic,
      DEL_YN: null == DEL_YN
          ? _value.DEL_YN
          : DEL_YN // ignore: cast_nullable_to_non_nullable
              as String,
      USE_YN: null == USE_YN
          ? _value.USE_YN
          : USE_YN // ignore: cast_nullable_to_non_nullable
              as String,
      DEL_DTTM: freezed == DEL_DTTM
          ? _value.DEL_DTTM
          : DEL_DTTM // ignore: cast_nullable_to_non_nullable
              as dynamic,
      UPD_USR_ID: freezed == UPD_USR_ID
          ? _value.UPD_USR_ID
          : UPD_USR_ID // ignore: cast_nullable_to_non_nullable
              as dynamic,
      ZONE_NM: null == ZONE_NM
          ? _value.ZONE_NM
          : ZONE_NM // ignore: cast_nullable_to_non_nullable
              as String,
      DEL_USR_ID: freezed == DEL_USR_ID
          ? _value.DEL_USR_ID
          : DEL_USR_ID // ignore: cast_nullable_to_non_nullable
              as dynamic,
      SORT_NO: null == SORT_NO
          ? _value.SORT_NO
          : SORT_NO // ignore: cast_nullable_to_non_nullable
              as String,
      REMARK: freezed == REMARK
          ? _value.REMARK
          : REMARK // ignore: cast_nullable_to_non_nullable
              as dynamic,
      ZONE_CD: null == ZONE_CD
          ? _value.ZONE_CD
          : ZONE_CD // ignore: cast_nullable_to_non_nullable
              as String,
      ZONE_TYPE: null == ZONE_TYPE
          ? _value.ZONE_TYPE
          : ZONE_TYPE // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ZoneImplCopyWith<$Res> implements $ZoneCopyWith<$Res> {
  factory _$$ZoneImplCopyWith(
          _$ZoneImpl value, $Res Function(_$ZoneImpl) then) =
      __$$ZoneImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String PLANT,
      dynamic UPD_USR_IP,
      dynamic REG_USR_IP,
      String WH_CD,
      dynamic REG_DTTM,
      dynamic UPD_DTTM,
      dynamic DEL_USR_IP,
      dynamic ZONE_RANK,
      dynamic REG_USR_ID,
      String DEL_YN,
      String USE_YN,
      dynamic DEL_DTTM,
      dynamic UPD_USR_ID,
      String ZONE_NM,
      dynamic DEL_USR_ID,
      String SORT_NO,
      dynamic REMARK,
      String ZONE_CD,
      String ZONE_TYPE});
}

/// @nodoc
class __$$ZoneImplCopyWithImpl<$Res>
    extends _$ZoneCopyWithImpl<$Res, _$ZoneImpl>
    implements _$$ZoneImplCopyWith<$Res> {
  __$$ZoneImplCopyWithImpl(_$ZoneImpl _value, $Res Function(_$ZoneImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? PLANT = null,
    Object? UPD_USR_IP = freezed,
    Object? REG_USR_IP = freezed,
    Object? WH_CD = null,
    Object? REG_DTTM = freezed,
    Object? UPD_DTTM = freezed,
    Object? DEL_USR_IP = freezed,
    Object? ZONE_RANK = freezed,
    Object? REG_USR_ID = freezed,
    Object? DEL_YN = null,
    Object? USE_YN = null,
    Object? DEL_DTTM = freezed,
    Object? UPD_USR_ID = freezed,
    Object? ZONE_NM = null,
    Object? DEL_USR_ID = freezed,
    Object? SORT_NO = null,
    Object? REMARK = freezed,
    Object? ZONE_CD = null,
    Object? ZONE_TYPE = null,
  }) {
    return _then(_$ZoneImpl(
      PLANT: null == PLANT
          ? _value.PLANT
          : PLANT // ignore: cast_nullable_to_non_nullable
              as String,
      UPD_USR_IP: freezed == UPD_USR_IP ? _value.UPD_USR_IP! : UPD_USR_IP,
      REG_USR_IP: freezed == REG_USR_IP ? _value.REG_USR_IP! : REG_USR_IP,
      WH_CD: null == WH_CD
          ? _value.WH_CD
          : WH_CD // ignore: cast_nullable_to_non_nullable
              as String,
      REG_DTTM: freezed == REG_DTTM ? _value.REG_DTTM! : REG_DTTM,
      UPD_DTTM: freezed == UPD_DTTM ? _value.UPD_DTTM! : UPD_DTTM,
      DEL_USR_IP: freezed == DEL_USR_IP ? _value.DEL_USR_IP! : DEL_USR_IP,
      ZONE_RANK: freezed == ZONE_RANK ? _value.ZONE_RANK! : ZONE_RANK,
      REG_USR_ID: freezed == REG_USR_ID ? _value.REG_USR_ID! : REG_USR_ID,
      DEL_YN: null == DEL_YN
          ? _value.DEL_YN
          : DEL_YN // ignore: cast_nullable_to_non_nullable
              as String,
      USE_YN: null == USE_YN
          ? _value.USE_YN
          : USE_YN // ignore: cast_nullable_to_non_nullable
              as String,
      DEL_DTTM: freezed == DEL_DTTM ? _value.DEL_DTTM! : DEL_DTTM,
      UPD_USR_ID: freezed == UPD_USR_ID ? _value.UPD_USR_ID! : UPD_USR_ID,
      ZONE_NM: null == ZONE_NM
          ? _value.ZONE_NM
          : ZONE_NM // ignore: cast_nullable_to_non_nullable
              as String,
      DEL_USR_ID: freezed == DEL_USR_ID ? _value.DEL_USR_ID! : DEL_USR_ID,
      SORT_NO: null == SORT_NO
          ? _value.SORT_NO
          : SORT_NO // ignore: cast_nullable_to_non_nullable
              as String,
      REMARK: freezed == REMARK ? _value.REMARK! : REMARK,
      ZONE_CD: null == ZONE_CD
          ? _value.ZONE_CD
          : ZONE_CD // ignore: cast_nullable_to_non_nullable
              as String,
      ZONE_TYPE: null == ZONE_TYPE
          ? _value.ZONE_TYPE
          : ZONE_TYPE // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ZoneImpl implements _Zone {
  const _$ZoneImpl(
      {this.PLANT = '',
      this.UPD_USR_IP = '',
      this.REG_USR_IP = '',
      this.WH_CD = '',
      this.REG_DTTM = '',
      this.UPD_DTTM = '',
      this.DEL_USR_IP = '',
      this.ZONE_RANK = '',
      this.REG_USR_ID = '',
      this.DEL_YN = '',
      this.USE_YN = '',
      this.DEL_DTTM = '',
      this.UPD_USR_ID = '',
      this.ZONE_NM = '',
      this.DEL_USR_ID = '',
      this.SORT_NO = '',
      this.REMARK = '',
      this.ZONE_CD = '',
      this.ZONE_TYPE = ''});

  factory _$ZoneImpl.fromJson(Map<String, dynamic> json) =>
      _$$ZoneImplFromJson(json);

  @override
  @JsonKey()
  final String PLANT;
  @override
  @JsonKey()
  final dynamic UPD_USR_IP;
  @override
  @JsonKey()
  final dynamic REG_USR_IP;
  @override
  @JsonKey()
  final String WH_CD;
  @override
  @JsonKey()
  final dynamic REG_DTTM;
  @override
  @JsonKey()
  final dynamic UPD_DTTM;
  @override
  @JsonKey()
  final dynamic DEL_USR_IP;
  @override
  @JsonKey()
  final dynamic ZONE_RANK;
  @override
  @JsonKey()
  final dynamic REG_USR_ID;
  @override
  @JsonKey()
  final String DEL_YN;
  @override
  @JsonKey()
  final String USE_YN;
  @override
  @JsonKey()
  final dynamic DEL_DTTM;
  @override
  @JsonKey()
  final dynamic UPD_USR_ID;
  @override
  @JsonKey()
  final String ZONE_NM;
  @override
  @JsonKey()
  final dynamic DEL_USR_ID;
  @override
  @JsonKey()
  final String SORT_NO;
  @override
  @JsonKey()
  final dynamic REMARK;
  @override
  @JsonKey()
  final String ZONE_CD;
  @override
  @JsonKey()
  final String ZONE_TYPE;

  @override
  String toString() {
    return 'Zone(PLANT: $PLANT, UPD_USR_IP: $UPD_USR_IP, REG_USR_IP: $REG_USR_IP, WH_CD: $WH_CD, REG_DTTM: $REG_DTTM, UPD_DTTM: $UPD_DTTM, DEL_USR_IP: $DEL_USR_IP, ZONE_RANK: $ZONE_RANK, REG_USR_ID: $REG_USR_ID, DEL_YN: $DEL_YN, USE_YN: $USE_YN, DEL_DTTM: $DEL_DTTM, UPD_USR_ID: $UPD_USR_ID, ZONE_NM: $ZONE_NM, DEL_USR_ID: $DEL_USR_ID, SORT_NO: $SORT_NO, REMARK: $REMARK, ZONE_CD: $ZONE_CD, ZONE_TYPE: $ZONE_TYPE)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ZoneImpl &&
            (identical(other.PLANT, PLANT) || other.PLANT == PLANT) &&
            const DeepCollectionEquality()
                .equals(other.UPD_USR_IP, UPD_USR_IP) &&
            const DeepCollectionEquality()
                .equals(other.REG_USR_IP, REG_USR_IP) &&
            (identical(other.WH_CD, WH_CD) || other.WH_CD == WH_CD) &&
            const DeepCollectionEquality().equals(other.REG_DTTM, REG_DTTM) &&
            const DeepCollectionEquality().equals(other.UPD_DTTM, UPD_DTTM) &&
            const DeepCollectionEquality()
                .equals(other.DEL_USR_IP, DEL_USR_IP) &&
            const DeepCollectionEquality().equals(other.ZONE_RANK, ZONE_RANK) &&
            const DeepCollectionEquality()
                .equals(other.REG_USR_ID, REG_USR_ID) &&
            (identical(other.DEL_YN, DEL_YN) || other.DEL_YN == DEL_YN) &&
            (identical(other.USE_YN, USE_YN) || other.USE_YN == USE_YN) &&
            const DeepCollectionEquality().equals(other.DEL_DTTM, DEL_DTTM) &&
            const DeepCollectionEquality()
                .equals(other.UPD_USR_ID, UPD_USR_ID) &&
            (identical(other.ZONE_NM, ZONE_NM) || other.ZONE_NM == ZONE_NM) &&
            const DeepCollectionEquality()
                .equals(other.DEL_USR_ID, DEL_USR_ID) &&
            (identical(other.SORT_NO, SORT_NO) || other.SORT_NO == SORT_NO) &&
            const DeepCollectionEquality().equals(other.REMARK, REMARK) &&
            (identical(other.ZONE_CD, ZONE_CD) || other.ZONE_CD == ZONE_CD) &&
            (identical(other.ZONE_TYPE, ZONE_TYPE) ||
                other.ZONE_TYPE == ZONE_TYPE));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        PLANT,
        const DeepCollectionEquality().hash(UPD_USR_IP),
        const DeepCollectionEquality().hash(REG_USR_IP),
        WH_CD,
        const DeepCollectionEquality().hash(REG_DTTM),
        const DeepCollectionEquality().hash(UPD_DTTM),
        const DeepCollectionEquality().hash(DEL_USR_IP),
        const DeepCollectionEquality().hash(ZONE_RANK),
        const DeepCollectionEquality().hash(REG_USR_ID),
        DEL_YN,
        USE_YN,
        const DeepCollectionEquality().hash(DEL_DTTM),
        const DeepCollectionEquality().hash(UPD_USR_ID),
        ZONE_NM,
        const DeepCollectionEquality().hash(DEL_USR_ID),
        SORT_NO,
        const DeepCollectionEquality().hash(REMARK),
        ZONE_CD,
        ZONE_TYPE
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ZoneImplCopyWith<_$ZoneImpl> get copyWith =>
      __$$ZoneImplCopyWithImpl<_$ZoneImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ZoneImplToJson(
      this,
    );
  }
}

abstract class _Zone implements Zone {
  const factory _Zone(
      {final String PLANT,
      final dynamic UPD_USR_IP,
      final dynamic REG_USR_IP,
      final String WH_CD,
      final dynamic REG_DTTM,
      final dynamic UPD_DTTM,
      final dynamic DEL_USR_IP,
      final dynamic ZONE_RANK,
      final dynamic REG_USR_ID,
      final String DEL_YN,
      final String USE_YN,
      final dynamic DEL_DTTM,
      final dynamic UPD_USR_ID,
      final String ZONE_NM,
      final dynamic DEL_USR_ID,
      final String SORT_NO,
      final dynamic REMARK,
      final String ZONE_CD,
      final String ZONE_TYPE}) = _$ZoneImpl;

  factory _Zone.fromJson(Map<String, dynamic> json) = _$ZoneImpl.fromJson;

  @override
  String get PLANT;
  @override
  dynamic get UPD_USR_IP;
  @override
  dynamic get REG_USR_IP;
  @override
  String get WH_CD;
  @override
  dynamic get REG_DTTM;
  @override
  dynamic get UPD_DTTM;
  @override
  dynamic get DEL_USR_IP;
  @override
  dynamic get ZONE_RANK;
  @override
  dynamic get REG_USR_ID;
  @override
  String get DEL_YN;
  @override
  String get USE_YN;
  @override
  dynamic get DEL_DTTM;
  @override
  dynamic get UPD_USR_ID;
  @override
  String get ZONE_NM;
  @override
  dynamic get DEL_USR_ID;
  @override
  String get SORT_NO;
  @override
  dynamic get REMARK;
  @override
  String get ZONE_CD;
  @override
  String get ZONE_TYPE;
  @override
  @JsonKey(ignore: true)
  _$$ZoneImplCopyWith<_$ZoneImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
