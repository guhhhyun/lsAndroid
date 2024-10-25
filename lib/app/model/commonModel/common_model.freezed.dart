// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'common_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommonModel _$CommonModelFromJson(Map<String, dynamic> json) {
  return _CommonModel.fromJson(json);
}

/// @nodoc
mixin _$CommonModel {
  Header? get header => throw _privateConstructorUsedError;
  String get resultCode => throw _privateConstructorUsedError;
  String get resultMessage => throw _privateConstructorUsedError;
  List<dynamic>? get body => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommonModelCopyWith<CommonModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommonModelCopyWith<$Res> {
  factory $CommonModelCopyWith(
          CommonModel value, $Res Function(CommonModel) then) =
      _$CommonModelCopyWithImpl<$Res, CommonModel>;
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
class _$CommonModelCopyWithImpl<$Res, $Val extends CommonModel>
    implements $CommonModelCopyWith<$Res> {
  _$CommonModelCopyWithImpl(this._value, this._then);

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
abstract class _$$CommonModelImplCopyWith<$Res>
    implements $CommonModelCopyWith<$Res> {
  factory _$$CommonModelImplCopyWith(
          _$CommonModelImpl value, $Res Function(_$CommonModelImpl) then) =
      __$$CommonModelImplCopyWithImpl<$Res>;
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
class __$$CommonModelImplCopyWithImpl<$Res>
    extends _$CommonModelCopyWithImpl<$Res, _$CommonModelImpl>
    implements _$$CommonModelImplCopyWith<$Res> {
  __$$CommonModelImplCopyWithImpl(
      _$CommonModelImpl _value, $Res Function(_$CommonModelImpl) _then)
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
    return _then(_$CommonModelImpl(
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
class _$CommonModelImpl implements _CommonModel {
  const _$CommonModelImpl(
      {this.header,
      this.resultCode = '',
      this.resultMessage = '',
      final List<dynamic>? body,
      this.hasError = false})
      : _body = body;

  factory _$CommonModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommonModelImplFromJson(json);

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
    return 'CommonModel(header: $header, resultCode: $resultCode, resultMessage: $resultMessage, body: $body, hasError: $hasError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommonModelImpl &&
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
  _$$CommonModelImplCopyWith<_$CommonModelImpl> get copyWith =>
      __$$CommonModelImplCopyWithImpl<_$CommonModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommonModelImplToJson(
      this,
    );
  }
}

abstract class _CommonModel implements CommonModel {
  const factory _CommonModel(
      {final Header? header,
      final String resultCode,
      final String resultMessage,
      final List<dynamic>? body,
      final bool hasError}) = _$CommonModelImpl;

  factory _CommonModel.fromJson(Map<String, dynamic> json) =
      _$CommonModelImpl.fromJson;

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
  _$$CommonModelImplCopyWith<_$CommonModelImpl> get copyWith =>
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
  dynamic get orders => throw _privateConstructorUsedError;
  dynamic get chnlCd => throw _privateConstructorUsedError;

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
      dynamic orders,
      dynamic chnlCd});
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
    Object? orders = freezed,
    Object? chnlCd = freezed,
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
      orders: freezed == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as dynamic,
      chnlCd: freezed == chnlCd
          ? _value.chnlCd
          : chnlCd // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
      dynamic orders,
      dynamic chnlCd});
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
    Object? orders = freezed,
    Object? chnlCd = freezed,
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
      orders: freezed == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as dynamic,
      chnlCd: freezed == chnlCd
          ? _value.chnlCd
          : chnlCd // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
      this.orders,
      this.chnlCd});

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
  final dynamic orders;
  @override
  final dynamic chnlCd;

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
            const DeepCollectionEquality().equals(other.orders, orders) &&
            const DeepCollectionEquality().equals(other.chnlCd, chnlCd));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentPage,
      pageSize,
      totalRecords,
      const DeepCollectionEquality().hash(orders),
      const DeepCollectionEquality().hash(chnlCd));

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
      final dynamic orders,
      final dynamic chnlCd}) = _$HeaderImpl;

  factory _Header.fromJson(Map<String, dynamic> json) = _$HeaderImpl.fromJson;

  @override
  int get currentPage;
  @override
  int get pageSize;
  @override
  int get totalRecords;
  @override
  dynamic get orders;
  @override
  dynamic get chnlCd;
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

BodyDetail _$BodyDetailFromJson(Map<String, dynamic> json) {
  return _BodyDetail.fromJson(json);
}

/// @nodoc
mixin _$BodyDetail {
  String get UPD_USR_IP => throw _privateConstructorUsedError;
  String get REG_DTTM => throw _privateConstructorUsedError;
  dynamic get LCLS_CD => throw _privateConstructorUsedError;
  String get DTL_CD => throw _privateConstructorUsedError;
  String get GRP_CD => throw _privateConstructorUsedError;
  dynamic get CD_DESC => throw _privateConstructorUsedError;
  dynamic get MCLS_NM => throw _privateConstructorUsedError;
  String get CD_NM => throw _privateConstructorUsedError;
  dynamic get UPR_DTL_CD => throw _privateConstructorUsedError;
  String get USE_YN => throw _privateConstructorUsedError;
  dynamic get ETC1 => throw _privateConstructorUsedError;
  dynamic get ETC2 => throw _privateConstructorUsedError;
  dynamic get ETC3 => throw _privateConstructorUsedError;
  dynamic get ETC4 => throw _privateConstructorUsedError;
  dynamic get ETC5 => throw _privateConstructorUsedError;
  String get REG_USR_IP => throw _privateConstructorUsedError;
  dynamic get UPR_GRP_CD => throw _privateConstructorUsedError;
  dynamic get LCLS_NM => throw _privateConstructorUsedError;
  String get UPD_DTTM => throw _privateConstructorUsedError;
  int get SRT_NO => throw _privateConstructorUsedError;
  String get GRP_NM => throw _privateConstructorUsedError;
  int get CD_LEN => throw _privateConstructorUsedError;
  dynamic get MCLS_CD => throw _privateConstructorUsedError;
  String get REG_USR_ID => throw _privateConstructorUsedError;
  dynamic get RMK => throw _privateConstructorUsedError;
  String get UPD_USR_ID => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BodyDetailCopyWith<BodyDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BodyDetailCopyWith<$Res> {
  factory $BodyDetailCopyWith(
          BodyDetail value, $Res Function(BodyDetail) then) =
      _$BodyDetailCopyWithImpl<$Res, BodyDetail>;
  @useResult
  $Res call(
      {String UPD_USR_IP,
      String REG_DTTM,
      dynamic LCLS_CD,
      String DTL_CD,
      String GRP_CD,
      dynamic CD_DESC,
      dynamic MCLS_NM,
      String CD_NM,
      dynamic UPR_DTL_CD,
      String USE_YN,
      dynamic ETC1,
      dynamic ETC2,
      dynamic ETC3,
      dynamic ETC4,
      dynamic ETC5,
      String REG_USR_IP,
      dynamic UPR_GRP_CD,
      dynamic LCLS_NM,
      String UPD_DTTM,
      int SRT_NO,
      String GRP_NM,
      int CD_LEN,
      dynamic MCLS_CD,
      String REG_USR_ID,
      dynamic RMK,
      String UPD_USR_ID});
}

/// @nodoc
class _$BodyDetailCopyWithImpl<$Res, $Val extends BodyDetail>
    implements $BodyDetailCopyWith<$Res> {
  _$BodyDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? UPD_USR_IP = null,
    Object? REG_DTTM = null,
    Object? LCLS_CD = freezed,
    Object? DTL_CD = null,
    Object? GRP_CD = null,
    Object? CD_DESC = freezed,
    Object? MCLS_NM = freezed,
    Object? CD_NM = null,
    Object? UPR_DTL_CD = freezed,
    Object? USE_YN = null,
    Object? ETC1 = freezed,
    Object? ETC2 = freezed,
    Object? ETC3 = freezed,
    Object? ETC4 = freezed,
    Object? ETC5 = freezed,
    Object? REG_USR_IP = null,
    Object? UPR_GRP_CD = freezed,
    Object? LCLS_NM = freezed,
    Object? UPD_DTTM = null,
    Object? SRT_NO = null,
    Object? GRP_NM = null,
    Object? CD_LEN = null,
    Object? MCLS_CD = freezed,
    Object? REG_USR_ID = null,
    Object? RMK = freezed,
    Object? UPD_USR_ID = null,
  }) {
    return _then(_value.copyWith(
      UPD_USR_IP: null == UPD_USR_IP
          ? _value.UPD_USR_IP
          : UPD_USR_IP // ignore: cast_nullable_to_non_nullable
              as String,
      REG_DTTM: null == REG_DTTM
          ? _value.REG_DTTM
          : REG_DTTM // ignore: cast_nullable_to_non_nullable
              as String,
      LCLS_CD: freezed == LCLS_CD
          ? _value.LCLS_CD
          : LCLS_CD // ignore: cast_nullable_to_non_nullable
              as dynamic,
      DTL_CD: null == DTL_CD
          ? _value.DTL_CD
          : DTL_CD // ignore: cast_nullable_to_non_nullable
              as String,
      GRP_CD: null == GRP_CD
          ? _value.GRP_CD
          : GRP_CD // ignore: cast_nullable_to_non_nullable
              as String,
      CD_DESC: freezed == CD_DESC
          ? _value.CD_DESC
          : CD_DESC // ignore: cast_nullable_to_non_nullable
              as dynamic,
      MCLS_NM: freezed == MCLS_NM
          ? _value.MCLS_NM
          : MCLS_NM // ignore: cast_nullable_to_non_nullable
              as dynamic,
      CD_NM: null == CD_NM
          ? _value.CD_NM
          : CD_NM // ignore: cast_nullable_to_non_nullable
              as String,
      UPR_DTL_CD: freezed == UPR_DTL_CD
          ? _value.UPR_DTL_CD
          : UPR_DTL_CD // ignore: cast_nullable_to_non_nullable
              as dynamic,
      USE_YN: null == USE_YN
          ? _value.USE_YN
          : USE_YN // ignore: cast_nullable_to_non_nullable
              as String,
      ETC1: freezed == ETC1
          ? _value.ETC1
          : ETC1 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      ETC2: freezed == ETC2
          ? _value.ETC2
          : ETC2 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      ETC3: freezed == ETC3
          ? _value.ETC3
          : ETC3 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      ETC4: freezed == ETC4
          ? _value.ETC4
          : ETC4 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      ETC5: freezed == ETC5
          ? _value.ETC5
          : ETC5 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      REG_USR_IP: null == REG_USR_IP
          ? _value.REG_USR_IP
          : REG_USR_IP // ignore: cast_nullable_to_non_nullable
              as String,
      UPR_GRP_CD: freezed == UPR_GRP_CD
          ? _value.UPR_GRP_CD
          : UPR_GRP_CD // ignore: cast_nullable_to_non_nullable
              as dynamic,
      LCLS_NM: freezed == LCLS_NM
          ? _value.LCLS_NM
          : LCLS_NM // ignore: cast_nullable_to_non_nullable
              as dynamic,
      UPD_DTTM: null == UPD_DTTM
          ? _value.UPD_DTTM
          : UPD_DTTM // ignore: cast_nullable_to_non_nullable
              as String,
      SRT_NO: null == SRT_NO
          ? _value.SRT_NO
          : SRT_NO // ignore: cast_nullable_to_non_nullable
              as int,
      GRP_NM: null == GRP_NM
          ? _value.GRP_NM
          : GRP_NM // ignore: cast_nullable_to_non_nullable
              as String,
      CD_LEN: null == CD_LEN
          ? _value.CD_LEN
          : CD_LEN // ignore: cast_nullable_to_non_nullable
              as int,
      MCLS_CD: freezed == MCLS_CD
          ? _value.MCLS_CD
          : MCLS_CD // ignore: cast_nullable_to_non_nullable
              as dynamic,
      REG_USR_ID: null == REG_USR_ID
          ? _value.REG_USR_ID
          : REG_USR_ID // ignore: cast_nullable_to_non_nullable
              as String,
      RMK: freezed == RMK
          ? _value.RMK
          : RMK // ignore: cast_nullable_to_non_nullable
              as dynamic,
      UPD_USR_ID: null == UPD_USR_ID
          ? _value.UPD_USR_ID
          : UPD_USR_ID // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BodyDetailImplCopyWith<$Res>
    implements $BodyDetailCopyWith<$Res> {
  factory _$$BodyDetailImplCopyWith(
          _$BodyDetailImpl value, $Res Function(_$BodyDetailImpl) then) =
      __$$BodyDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String UPD_USR_IP,
      String REG_DTTM,
      dynamic LCLS_CD,
      String DTL_CD,
      String GRP_CD,
      dynamic CD_DESC,
      dynamic MCLS_NM,
      String CD_NM,
      dynamic UPR_DTL_CD,
      String USE_YN,
      dynamic ETC1,
      dynamic ETC2,
      dynamic ETC3,
      dynamic ETC4,
      dynamic ETC5,
      String REG_USR_IP,
      dynamic UPR_GRP_CD,
      dynamic LCLS_NM,
      String UPD_DTTM,
      int SRT_NO,
      String GRP_NM,
      int CD_LEN,
      dynamic MCLS_CD,
      String REG_USR_ID,
      dynamic RMK,
      String UPD_USR_ID});
}

/// @nodoc
class __$$BodyDetailImplCopyWithImpl<$Res>
    extends _$BodyDetailCopyWithImpl<$Res, _$BodyDetailImpl>
    implements _$$BodyDetailImplCopyWith<$Res> {
  __$$BodyDetailImplCopyWithImpl(
      _$BodyDetailImpl _value, $Res Function(_$BodyDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? UPD_USR_IP = null,
    Object? REG_DTTM = null,
    Object? LCLS_CD = freezed,
    Object? DTL_CD = null,
    Object? GRP_CD = null,
    Object? CD_DESC = freezed,
    Object? MCLS_NM = freezed,
    Object? CD_NM = null,
    Object? UPR_DTL_CD = freezed,
    Object? USE_YN = null,
    Object? ETC1 = freezed,
    Object? ETC2 = freezed,
    Object? ETC3 = freezed,
    Object? ETC4 = freezed,
    Object? ETC5 = freezed,
    Object? REG_USR_IP = null,
    Object? UPR_GRP_CD = freezed,
    Object? LCLS_NM = freezed,
    Object? UPD_DTTM = null,
    Object? SRT_NO = null,
    Object? GRP_NM = null,
    Object? CD_LEN = null,
    Object? MCLS_CD = freezed,
    Object? REG_USR_ID = null,
    Object? RMK = freezed,
    Object? UPD_USR_ID = null,
  }) {
    return _then(_$BodyDetailImpl(
      UPD_USR_IP: null == UPD_USR_IP
          ? _value.UPD_USR_IP
          : UPD_USR_IP // ignore: cast_nullable_to_non_nullable
              as String,
      REG_DTTM: null == REG_DTTM
          ? _value.REG_DTTM
          : REG_DTTM // ignore: cast_nullable_to_non_nullable
              as String,
      LCLS_CD: freezed == LCLS_CD
          ? _value.LCLS_CD
          : LCLS_CD // ignore: cast_nullable_to_non_nullable
              as dynamic,
      DTL_CD: null == DTL_CD
          ? _value.DTL_CD
          : DTL_CD // ignore: cast_nullable_to_non_nullable
              as String,
      GRP_CD: null == GRP_CD
          ? _value.GRP_CD
          : GRP_CD // ignore: cast_nullable_to_non_nullable
              as String,
      CD_DESC: freezed == CD_DESC
          ? _value.CD_DESC
          : CD_DESC // ignore: cast_nullable_to_non_nullable
              as dynamic,
      MCLS_NM: freezed == MCLS_NM
          ? _value.MCLS_NM
          : MCLS_NM // ignore: cast_nullable_to_non_nullable
              as dynamic,
      CD_NM: null == CD_NM
          ? _value.CD_NM
          : CD_NM // ignore: cast_nullable_to_non_nullable
              as String,
      UPR_DTL_CD: freezed == UPR_DTL_CD
          ? _value.UPR_DTL_CD
          : UPR_DTL_CD // ignore: cast_nullable_to_non_nullable
              as dynamic,
      USE_YN: null == USE_YN
          ? _value.USE_YN
          : USE_YN // ignore: cast_nullable_to_non_nullable
              as String,
      ETC1: freezed == ETC1
          ? _value.ETC1
          : ETC1 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      ETC2: freezed == ETC2
          ? _value.ETC2
          : ETC2 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      ETC3: freezed == ETC3
          ? _value.ETC3
          : ETC3 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      ETC4: freezed == ETC4
          ? _value.ETC4
          : ETC4 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      ETC5: freezed == ETC5
          ? _value.ETC5
          : ETC5 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      REG_USR_IP: null == REG_USR_IP
          ? _value.REG_USR_IP
          : REG_USR_IP // ignore: cast_nullable_to_non_nullable
              as String,
      UPR_GRP_CD: freezed == UPR_GRP_CD
          ? _value.UPR_GRP_CD
          : UPR_GRP_CD // ignore: cast_nullable_to_non_nullable
              as dynamic,
      LCLS_NM: freezed == LCLS_NM
          ? _value.LCLS_NM
          : LCLS_NM // ignore: cast_nullable_to_non_nullable
              as dynamic,
      UPD_DTTM: null == UPD_DTTM
          ? _value.UPD_DTTM
          : UPD_DTTM // ignore: cast_nullable_to_non_nullable
              as String,
      SRT_NO: null == SRT_NO
          ? _value.SRT_NO
          : SRT_NO // ignore: cast_nullable_to_non_nullable
              as int,
      GRP_NM: null == GRP_NM
          ? _value.GRP_NM
          : GRP_NM // ignore: cast_nullable_to_non_nullable
              as String,
      CD_LEN: null == CD_LEN
          ? _value.CD_LEN
          : CD_LEN // ignore: cast_nullable_to_non_nullable
              as int,
      MCLS_CD: freezed == MCLS_CD
          ? _value.MCLS_CD
          : MCLS_CD // ignore: cast_nullable_to_non_nullable
              as dynamic,
      REG_USR_ID: null == REG_USR_ID
          ? _value.REG_USR_ID
          : REG_USR_ID // ignore: cast_nullable_to_non_nullable
              as String,
      RMK: freezed == RMK
          ? _value.RMK
          : RMK // ignore: cast_nullable_to_non_nullable
              as dynamic,
      UPD_USR_ID: null == UPD_USR_ID
          ? _value.UPD_USR_ID
          : UPD_USR_ID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BodyDetailImpl implements _BodyDetail {
  const _$BodyDetailImpl(
      {this.UPD_USR_IP = '',
      this.REG_DTTM = '',
      this.LCLS_CD,
      this.DTL_CD = '',
      this.GRP_CD = '',
      this.CD_DESC,
      this.MCLS_NM,
      this.CD_NM = '',
      this.UPR_DTL_CD,
      this.USE_YN = '',
      this.ETC1,
      this.ETC2,
      this.ETC3,
      this.ETC4,
      this.ETC5,
      this.REG_USR_IP = '',
      this.UPR_GRP_CD,
      this.LCLS_NM,
      this.UPD_DTTM = '',
      this.SRT_NO = 0,
      this.GRP_NM = '',
      this.CD_LEN = 0,
      this.MCLS_CD,
      this.REG_USR_ID = '',
      this.RMK,
      this.UPD_USR_ID = ''});

  factory _$BodyDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$BodyDetailImplFromJson(json);

  @override
  @JsonKey()
  final String UPD_USR_IP;
  @override
  @JsonKey()
  final String REG_DTTM;
  @override
  final dynamic LCLS_CD;
  @override
  @JsonKey()
  final String DTL_CD;
  @override
  @JsonKey()
  final String GRP_CD;
  @override
  final dynamic CD_DESC;
  @override
  final dynamic MCLS_NM;
  @override
  @JsonKey()
  final String CD_NM;
  @override
  final dynamic UPR_DTL_CD;
  @override
  @JsonKey()
  final String USE_YN;
  @override
  final dynamic ETC1;
  @override
  final dynamic ETC2;
  @override
  final dynamic ETC3;
  @override
  final dynamic ETC4;
  @override
  final dynamic ETC5;
  @override
  @JsonKey()
  final String REG_USR_IP;
  @override
  final dynamic UPR_GRP_CD;
  @override
  final dynamic LCLS_NM;
  @override
  @JsonKey()
  final String UPD_DTTM;
  @override
  @JsonKey()
  final int SRT_NO;
  @override
  @JsonKey()
  final String GRP_NM;
  @override
  @JsonKey()
  final int CD_LEN;
  @override
  final dynamic MCLS_CD;
  @override
  @JsonKey()
  final String REG_USR_ID;
  @override
  final dynamic RMK;
  @override
  @JsonKey()
  final String UPD_USR_ID;

  @override
  String toString() {
    return 'BodyDetail(UPD_USR_IP: $UPD_USR_IP, REG_DTTM: $REG_DTTM, LCLS_CD: $LCLS_CD, DTL_CD: $DTL_CD, GRP_CD: $GRP_CD, CD_DESC: $CD_DESC, MCLS_NM: $MCLS_NM, CD_NM: $CD_NM, UPR_DTL_CD: $UPR_DTL_CD, USE_YN: $USE_YN, ETC1: $ETC1, ETC2: $ETC2, ETC3: $ETC3, ETC4: $ETC4, ETC5: $ETC5, REG_USR_IP: $REG_USR_IP, UPR_GRP_CD: $UPR_GRP_CD, LCLS_NM: $LCLS_NM, UPD_DTTM: $UPD_DTTM, SRT_NO: $SRT_NO, GRP_NM: $GRP_NM, CD_LEN: $CD_LEN, MCLS_CD: $MCLS_CD, REG_USR_ID: $REG_USR_ID, RMK: $RMK, UPD_USR_ID: $UPD_USR_ID)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BodyDetailImpl &&
            (identical(other.UPD_USR_IP, UPD_USR_IP) ||
                other.UPD_USR_IP == UPD_USR_IP) &&
            (identical(other.REG_DTTM, REG_DTTM) ||
                other.REG_DTTM == REG_DTTM) &&
            const DeepCollectionEquality().equals(other.LCLS_CD, LCLS_CD) &&
            (identical(other.DTL_CD, DTL_CD) || other.DTL_CD == DTL_CD) &&
            (identical(other.GRP_CD, GRP_CD) || other.GRP_CD == GRP_CD) &&
            const DeepCollectionEquality().equals(other.CD_DESC, CD_DESC) &&
            const DeepCollectionEquality().equals(other.MCLS_NM, MCLS_NM) &&
            (identical(other.CD_NM, CD_NM) || other.CD_NM == CD_NM) &&
            const DeepCollectionEquality()
                .equals(other.UPR_DTL_CD, UPR_DTL_CD) &&
            (identical(other.USE_YN, USE_YN) || other.USE_YN == USE_YN) &&
            const DeepCollectionEquality().equals(other.ETC1, ETC1) &&
            const DeepCollectionEquality().equals(other.ETC2, ETC2) &&
            const DeepCollectionEquality().equals(other.ETC3, ETC3) &&
            const DeepCollectionEquality().equals(other.ETC4, ETC4) &&
            const DeepCollectionEquality().equals(other.ETC5, ETC5) &&
            (identical(other.REG_USR_IP, REG_USR_IP) ||
                other.REG_USR_IP == REG_USR_IP) &&
            const DeepCollectionEquality()
                .equals(other.UPR_GRP_CD, UPR_GRP_CD) &&
            const DeepCollectionEquality().equals(other.LCLS_NM, LCLS_NM) &&
            (identical(other.UPD_DTTM, UPD_DTTM) ||
                other.UPD_DTTM == UPD_DTTM) &&
            (identical(other.SRT_NO, SRT_NO) || other.SRT_NO == SRT_NO) &&
            (identical(other.GRP_NM, GRP_NM) || other.GRP_NM == GRP_NM) &&
            (identical(other.CD_LEN, CD_LEN) || other.CD_LEN == CD_LEN) &&
            const DeepCollectionEquality().equals(other.MCLS_CD, MCLS_CD) &&
            (identical(other.REG_USR_ID, REG_USR_ID) ||
                other.REG_USR_ID == REG_USR_ID) &&
            const DeepCollectionEquality().equals(other.RMK, RMK) &&
            (identical(other.UPD_USR_ID, UPD_USR_ID) ||
                other.UPD_USR_ID == UPD_USR_ID));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        UPD_USR_IP,
        REG_DTTM,
        const DeepCollectionEquality().hash(LCLS_CD),
        DTL_CD,
        GRP_CD,
        const DeepCollectionEquality().hash(CD_DESC),
        const DeepCollectionEquality().hash(MCLS_NM),
        CD_NM,
        const DeepCollectionEquality().hash(UPR_DTL_CD),
        USE_YN,
        const DeepCollectionEquality().hash(ETC1),
        const DeepCollectionEquality().hash(ETC2),
        const DeepCollectionEquality().hash(ETC3),
        const DeepCollectionEquality().hash(ETC4),
        const DeepCollectionEquality().hash(ETC5),
        REG_USR_IP,
        const DeepCollectionEquality().hash(UPR_GRP_CD),
        const DeepCollectionEquality().hash(LCLS_NM),
        UPD_DTTM,
        SRT_NO,
        GRP_NM,
        CD_LEN,
        const DeepCollectionEquality().hash(MCLS_CD),
        REG_USR_ID,
        const DeepCollectionEquality().hash(RMK),
        UPD_USR_ID
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BodyDetailImplCopyWith<_$BodyDetailImpl> get copyWith =>
      __$$BodyDetailImplCopyWithImpl<_$BodyDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BodyDetailImplToJson(
      this,
    );
  }
}

abstract class _BodyDetail implements BodyDetail {
  const factory _BodyDetail(
      {final String UPD_USR_IP,
      final String REG_DTTM,
      final dynamic LCLS_CD,
      final String DTL_CD,
      final String GRP_CD,
      final dynamic CD_DESC,
      final dynamic MCLS_NM,
      final String CD_NM,
      final dynamic UPR_DTL_CD,
      final String USE_YN,
      final dynamic ETC1,
      final dynamic ETC2,
      final dynamic ETC3,
      final dynamic ETC4,
      final dynamic ETC5,
      final String REG_USR_IP,
      final dynamic UPR_GRP_CD,
      final dynamic LCLS_NM,
      final String UPD_DTTM,
      final int SRT_NO,
      final String GRP_NM,
      final int CD_LEN,
      final dynamic MCLS_CD,
      final String REG_USR_ID,
      final dynamic RMK,
      final String UPD_USR_ID}) = _$BodyDetailImpl;

  factory _BodyDetail.fromJson(Map<String, dynamic> json) =
      _$BodyDetailImpl.fromJson;

  @override
  String get UPD_USR_IP;
  @override
  String get REG_DTTM;
  @override
  dynamic get LCLS_CD;
  @override
  String get DTL_CD;
  @override
  String get GRP_CD;
  @override
  dynamic get CD_DESC;
  @override
  dynamic get MCLS_NM;
  @override
  String get CD_NM;
  @override
  dynamic get UPR_DTL_CD;
  @override
  String get USE_YN;
  @override
  dynamic get ETC1;
  @override
  dynamic get ETC2;
  @override
  dynamic get ETC3;
  @override
  dynamic get ETC4;
  @override
  dynamic get ETC5;
  @override
  String get REG_USR_IP;
  @override
  dynamic get UPR_GRP_CD;
  @override
  dynamic get LCLS_NM;
  @override
  String get UPD_DTTM;
  @override
  int get SRT_NO;
  @override
  String get GRP_NM;
  @override
  int get CD_LEN;
  @override
  dynamic get MCLS_CD;
  @override
  String get REG_USR_ID;
  @override
  dynamic get RMK;
  @override
  String get UPD_USR_ID;
  @override
  @JsonKey(ignore: true)
  _$$BodyDetailImplCopyWith<_$BodyDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
