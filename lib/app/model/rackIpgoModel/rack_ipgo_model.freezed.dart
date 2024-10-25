// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rack_ipgo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RackIpgoModel _$RackIpgoModelFromJson(Map<String, dynamic> json) {
  return _RackIpgoModel.fromJson(json);
}

/// @nodoc
mixin _$RackIpgoModel {
  Header? get header => throw _privateConstructorUsedError;
  String get resultCode => throw _privateConstructorUsedError;
  String get resultMessage => throw _privateConstructorUsedError;
  List<dynamic>? get body => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RackIpgoModelCopyWith<RackIpgoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RackIpgoModelCopyWith<$Res> {
  factory $RackIpgoModelCopyWith(
          RackIpgoModel value, $Res Function(RackIpgoModel) then) =
      _$RackIpgoModelCopyWithImpl<$Res, RackIpgoModel>;
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
class _$RackIpgoModelCopyWithImpl<$Res, $Val extends RackIpgoModel>
    implements $RackIpgoModelCopyWith<$Res> {
  _$RackIpgoModelCopyWithImpl(this._value, this._then);

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
abstract class _$$RackIpgoModelImplCopyWith<$Res>
    implements $RackIpgoModelCopyWith<$Res> {
  factory _$$RackIpgoModelImplCopyWith(
          _$RackIpgoModelImpl value, $Res Function(_$RackIpgoModelImpl) then) =
      __$$RackIpgoModelImplCopyWithImpl<$Res>;
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
class __$$RackIpgoModelImplCopyWithImpl<$Res>
    extends _$RackIpgoModelCopyWithImpl<$Res, _$RackIpgoModelImpl>
    implements _$$RackIpgoModelImplCopyWith<$Res> {
  __$$RackIpgoModelImplCopyWithImpl(
      _$RackIpgoModelImpl _value, $Res Function(_$RackIpgoModelImpl) _then)
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
    return _then(_$RackIpgoModelImpl(
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
class _$RackIpgoModelImpl implements _RackIpgoModel {
  _$RackIpgoModelImpl(
      {this.header,
      this.resultCode = '',
      this.resultMessage = '',
      final List<dynamic>? body,
      this.hasError = false})
      : _body = body;

  factory _$RackIpgoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RackIpgoModelImplFromJson(json);

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
    return 'RackIpgoModel(header: $header, resultCode: $resultCode, resultMessage: $resultMessage, body: $body, hasError: $hasError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RackIpgoModelImpl &&
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
  _$$RackIpgoModelImplCopyWith<_$RackIpgoModelImpl> get copyWith =>
      __$$RackIpgoModelImplCopyWithImpl<_$RackIpgoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RackIpgoModelImplToJson(
      this,
    );
  }
}

abstract class _RackIpgoModel implements RackIpgoModel {
  factory _RackIpgoModel(
      {final Header? header,
      final String resultCode,
      final String resultMessage,
      final List<dynamic>? body,
      final bool hasError}) = _$RackIpgoModelImpl;

  factory _RackIpgoModel.fromJson(Map<String, dynamic> json) =
      _$RackIpgoModelImpl.fromJson;

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
  _$$RackIpgoModelImplCopyWith<_$RackIpgoModelImpl> get copyWith =>
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
      orders: freezed == orders ? _value.orders! : orders,
      chnlCd: freezed == chnlCd ? _value.chnlCd! : chnlCd,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HeaderImpl implements _Header {
  _$HeaderImpl(
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
  final dynamic orders;
  @override
  @JsonKey()
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
  factory _Header(
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

BodyData _$BodyDataFromJson(Map<String, dynamic> json) {
  return _BodyData.fromJson(json);
}

/// @nodoc
mixin _$BodyData {
  bool get resultValue => throw _privateConstructorUsedError;
  int get resultRowCount => throw _privateConstructorUsedError;
  String get resultCode => throw _privateConstructorUsedError;
  String get resultMessage => throw _privateConstructorUsedError;
  String get errorState => throw _privateConstructorUsedError;
  String get errorProcedure => throw _privateConstructorUsedError;
  String get returnMessage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BodyDataCopyWith<BodyData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BodyDataCopyWith<$Res> {
  factory $BodyDataCopyWith(BodyData value, $Res Function(BodyData) then) =
      _$BodyDataCopyWithImpl<$Res, BodyData>;
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
class _$BodyDataCopyWithImpl<$Res, $Val extends BodyData>
    implements $BodyDataCopyWith<$Res> {
  _$BodyDataCopyWithImpl(this._value, this._then);

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
abstract class _$$BodyDataImplCopyWith<$Res>
    implements $BodyDataCopyWith<$Res> {
  factory _$$BodyDataImplCopyWith(
          _$BodyDataImpl value, $Res Function(_$BodyDataImpl) then) =
      __$$BodyDataImplCopyWithImpl<$Res>;
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
class __$$BodyDataImplCopyWithImpl<$Res>
    extends _$BodyDataCopyWithImpl<$Res, _$BodyDataImpl>
    implements _$$BodyDataImplCopyWith<$Res> {
  __$$BodyDataImplCopyWithImpl(
      _$BodyDataImpl _value, $Res Function(_$BodyDataImpl) _then)
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
    return _then(_$BodyDataImpl(
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
class _$BodyDataImpl implements _BodyData {
  _$BodyDataImpl(
      {this.resultValue = false,
      this.resultRowCount = 0,
      this.resultCode = '',
      this.resultMessage = '',
      this.errorState = '',
      this.errorProcedure = '',
      this.returnMessage = ''});

  factory _$BodyDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$BodyDataImplFromJson(json);

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
    return 'BodyData(resultValue: $resultValue, resultRowCount: $resultRowCount, resultCode: $resultCode, resultMessage: $resultMessage, errorState: $errorState, errorProcedure: $errorProcedure, returnMessage: $returnMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BodyDataImpl &&
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
  _$$BodyDataImplCopyWith<_$BodyDataImpl> get copyWith =>
      __$$BodyDataImplCopyWithImpl<_$BodyDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BodyDataImplToJson(
      this,
    );
  }
}

abstract class _BodyData implements BodyData {
  factory _BodyData(
      {final bool resultValue,
      final int resultRowCount,
      final String resultCode,
      final String resultMessage,
      final String errorState,
      final String errorProcedure,
      final String returnMessage}) = _$BodyDataImpl;

  factory _BodyData.fromJson(Map<String, dynamic> json) =
      _$BodyDataImpl.fromJson;

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
  _$$BodyDataImplCopyWith<_$BodyDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ItemData _$ItemDataFromJson(Map<String, dynamic> json) {
  return _ItemData.fromJson(json);
}

/// @nodoc
mixin _$ItemData {
  String get QTY_UNIT => throw _privateConstructorUsedError;
  String get QR_NO => throw _privateConstructorUsedError;
  String get ITEM_NM => throw _privateConstructorUsedError;
  String get LOC_CD => throw _privateConstructorUsedError;
  String get LAST_LOC => throw _privateConstructorUsedError;
  dynamic get CUST_CD => throw _privateConstructorUsedError;
  double get QTY => throw _privateConstructorUsedError;
  dynamic get VEND_NM => throw _privateConstructorUsedError;
  String get ZONE_NM => throw _privateConstructorUsedError;
  dynamic get REMARK => throw _privateConstructorUsedError;
  dynamic get WHT_UNIT => throw _privateConstructorUsedError;
  dynamic get PRT_NO => throw _privateConstructorUsedError;
  dynamic get BOX_WHT => throw _privateConstructorUsedError;
  dynamic get WHT => throw _privateConstructorUsedError;
  String get ITEM_CD => throw _privateConstructorUsedError;
  String get LOC_DT => throw _privateConstructorUsedError;
  String get TAG_NO => throw _privateConstructorUsedError;
  String get INB_YN => throw _privateConstructorUsedError;
  dynamic get EXP_DT => throw _privateConstructorUsedError;
  dynamic get EXTR_VAL => throw _privateConstructorUsedError;
  int get D_QTY => throw _privateConstructorUsedError;
  dynamic get BOX_NM => throw _privateConstructorUsedError;
  dynamic get PRT_DT => throw _privateConstructorUsedError;
  dynamic get SET_QTY => throw _privateConstructorUsedError;
  dynamic get BOX_NO => throw _privateConstructorUsedError;
  dynamic get PJT_NO => throw _privateConstructorUsedError;
  dynamic get PJT_NM => throw _privateConstructorUsedError;
  dynamic get VEND_CD => throw _privateConstructorUsedError;
  dynamic get TOT_WHT => throw _privateConstructorUsedError;
  String get TAG_TYPE => throw _privateConstructorUsedError;
  String get LOT_NO => throw _privateConstructorUsedError;
  String get ZONE_CD => throw _privateConstructorUsedError;
  String get INB_NO => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemDataCopyWith<ItemData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemDataCopyWith<$Res> {
  factory $ItemDataCopyWith(ItemData value, $Res Function(ItemData) then) =
      _$ItemDataCopyWithImpl<$Res, ItemData>;
  @useResult
  $Res call(
      {String QTY_UNIT,
      String QR_NO,
      String ITEM_NM,
      String LOC_CD,
      String LAST_LOC,
      dynamic CUST_CD,
      double QTY,
      dynamic VEND_NM,
      String ZONE_NM,
      dynamic REMARK,
      dynamic WHT_UNIT,
      dynamic PRT_NO,
      dynamic BOX_WHT,
      dynamic WHT,
      String ITEM_CD,
      String LOC_DT,
      String TAG_NO,
      String INB_YN,
      dynamic EXP_DT,
      dynamic EXTR_VAL,
      int D_QTY,
      dynamic BOX_NM,
      dynamic PRT_DT,
      dynamic SET_QTY,
      dynamic BOX_NO,
      dynamic PJT_NO,
      dynamic PJT_NM,
      dynamic VEND_CD,
      dynamic TOT_WHT,
      String TAG_TYPE,
      String LOT_NO,
      String ZONE_CD,
      String INB_NO});
}

/// @nodoc
class _$ItemDataCopyWithImpl<$Res, $Val extends ItemData>
    implements $ItemDataCopyWith<$Res> {
  _$ItemDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? QTY_UNIT = null,
    Object? QR_NO = null,
    Object? ITEM_NM = null,
    Object? LOC_CD = null,
    Object? LAST_LOC = null,
    Object? CUST_CD = freezed,
    Object? QTY = null,
    Object? VEND_NM = freezed,
    Object? ZONE_NM = null,
    Object? REMARK = freezed,
    Object? WHT_UNIT = freezed,
    Object? PRT_NO = freezed,
    Object? BOX_WHT = freezed,
    Object? WHT = freezed,
    Object? ITEM_CD = null,
    Object? LOC_DT = null,
    Object? TAG_NO = null,
    Object? INB_YN = null,
    Object? EXP_DT = freezed,
    Object? EXTR_VAL = freezed,
    Object? D_QTY = null,
    Object? BOX_NM = freezed,
    Object? PRT_DT = freezed,
    Object? SET_QTY = freezed,
    Object? BOX_NO = freezed,
    Object? PJT_NO = freezed,
    Object? PJT_NM = freezed,
    Object? VEND_CD = freezed,
    Object? TOT_WHT = freezed,
    Object? TAG_TYPE = null,
    Object? LOT_NO = null,
    Object? ZONE_CD = null,
    Object? INB_NO = null,
  }) {
    return _then(_value.copyWith(
      QTY_UNIT: null == QTY_UNIT
          ? _value.QTY_UNIT
          : QTY_UNIT // ignore: cast_nullable_to_non_nullable
              as String,
      QR_NO: null == QR_NO
          ? _value.QR_NO
          : QR_NO // ignore: cast_nullable_to_non_nullable
              as String,
      ITEM_NM: null == ITEM_NM
          ? _value.ITEM_NM
          : ITEM_NM // ignore: cast_nullable_to_non_nullable
              as String,
      LOC_CD: null == LOC_CD
          ? _value.LOC_CD
          : LOC_CD // ignore: cast_nullable_to_non_nullable
              as String,
      LAST_LOC: null == LAST_LOC
          ? _value.LAST_LOC
          : LAST_LOC // ignore: cast_nullable_to_non_nullable
              as String,
      CUST_CD: freezed == CUST_CD
          ? _value.CUST_CD
          : CUST_CD // ignore: cast_nullable_to_non_nullable
              as dynamic,
      QTY: null == QTY
          ? _value.QTY
          : QTY // ignore: cast_nullable_to_non_nullable
              as double,
      VEND_NM: freezed == VEND_NM
          ? _value.VEND_NM
          : VEND_NM // ignore: cast_nullable_to_non_nullable
              as dynamic,
      ZONE_NM: null == ZONE_NM
          ? _value.ZONE_NM
          : ZONE_NM // ignore: cast_nullable_to_non_nullable
              as String,
      REMARK: freezed == REMARK
          ? _value.REMARK
          : REMARK // ignore: cast_nullable_to_non_nullable
              as dynamic,
      WHT_UNIT: freezed == WHT_UNIT
          ? _value.WHT_UNIT
          : WHT_UNIT // ignore: cast_nullable_to_non_nullable
              as dynamic,
      PRT_NO: freezed == PRT_NO
          ? _value.PRT_NO
          : PRT_NO // ignore: cast_nullable_to_non_nullable
              as dynamic,
      BOX_WHT: freezed == BOX_WHT
          ? _value.BOX_WHT
          : BOX_WHT // ignore: cast_nullable_to_non_nullable
              as dynamic,
      WHT: freezed == WHT
          ? _value.WHT
          : WHT // ignore: cast_nullable_to_non_nullable
              as dynamic,
      ITEM_CD: null == ITEM_CD
          ? _value.ITEM_CD
          : ITEM_CD // ignore: cast_nullable_to_non_nullable
              as String,
      LOC_DT: null == LOC_DT
          ? _value.LOC_DT
          : LOC_DT // ignore: cast_nullable_to_non_nullable
              as String,
      TAG_NO: null == TAG_NO
          ? _value.TAG_NO
          : TAG_NO // ignore: cast_nullable_to_non_nullable
              as String,
      INB_YN: null == INB_YN
          ? _value.INB_YN
          : INB_YN // ignore: cast_nullable_to_non_nullable
              as String,
      EXP_DT: freezed == EXP_DT
          ? _value.EXP_DT
          : EXP_DT // ignore: cast_nullable_to_non_nullable
              as dynamic,
      EXTR_VAL: freezed == EXTR_VAL
          ? _value.EXTR_VAL
          : EXTR_VAL // ignore: cast_nullable_to_non_nullable
              as dynamic,
      D_QTY: null == D_QTY
          ? _value.D_QTY
          : D_QTY // ignore: cast_nullable_to_non_nullable
              as int,
      BOX_NM: freezed == BOX_NM
          ? _value.BOX_NM
          : BOX_NM // ignore: cast_nullable_to_non_nullable
              as dynamic,
      PRT_DT: freezed == PRT_DT
          ? _value.PRT_DT
          : PRT_DT // ignore: cast_nullable_to_non_nullable
              as dynamic,
      SET_QTY: freezed == SET_QTY
          ? _value.SET_QTY
          : SET_QTY // ignore: cast_nullable_to_non_nullable
              as dynamic,
      BOX_NO: freezed == BOX_NO
          ? _value.BOX_NO
          : BOX_NO // ignore: cast_nullable_to_non_nullable
              as dynamic,
      PJT_NO: freezed == PJT_NO
          ? _value.PJT_NO
          : PJT_NO // ignore: cast_nullable_to_non_nullable
              as dynamic,
      PJT_NM: freezed == PJT_NM
          ? _value.PJT_NM
          : PJT_NM // ignore: cast_nullable_to_non_nullable
              as dynamic,
      VEND_CD: freezed == VEND_CD
          ? _value.VEND_CD
          : VEND_CD // ignore: cast_nullable_to_non_nullable
              as dynamic,
      TOT_WHT: freezed == TOT_WHT
          ? _value.TOT_WHT
          : TOT_WHT // ignore: cast_nullable_to_non_nullable
              as dynamic,
      TAG_TYPE: null == TAG_TYPE
          ? _value.TAG_TYPE
          : TAG_TYPE // ignore: cast_nullable_to_non_nullable
              as String,
      LOT_NO: null == LOT_NO
          ? _value.LOT_NO
          : LOT_NO // ignore: cast_nullable_to_non_nullable
              as String,
      ZONE_CD: null == ZONE_CD
          ? _value.ZONE_CD
          : ZONE_CD // ignore: cast_nullable_to_non_nullable
              as String,
      INB_NO: null == INB_NO
          ? _value.INB_NO
          : INB_NO // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemDataImplCopyWith<$Res>
    implements $ItemDataCopyWith<$Res> {
  factory _$$ItemDataImplCopyWith(
          _$ItemDataImpl value, $Res Function(_$ItemDataImpl) then) =
      __$$ItemDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String QTY_UNIT,
      String QR_NO,
      String ITEM_NM,
      String LOC_CD,
      String LAST_LOC,
      dynamic CUST_CD,
      double QTY,
      dynamic VEND_NM,
      String ZONE_NM,
      dynamic REMARK,
      dynamic WHT_UNIT,
      dynamic PRT_NO,
      dynamic BOX_WHT,
      dynamic WHT,
      String ITEM_CD,
      String LOC_DT,
      String TAG_NO,
      String INB_YN,
      dynamic EXP_DT,
      dynamic EXTR_VAL,
      int D_QTY,
      dynamic BOX_NM,
      dynamic PRT_DT,
      dynamic SET_QTY,
      dynamic BOX_NO,
      dynamic PJT_NO,
      dynamic PJT_NM,
      dynamic VEND_CD,
      dynamic TOT_WHT,
      String TAG_TYPE,
      String LOT_NO,
      String ZONE_CD,
      String INB_NO});
}

/// @nodoc
class __$$ItemDataImplCopyWithImpl<$Res>
    extends _$ItemDataCopyWithImpl<$Res, _$ItemDataImpl>
    implements _$$ItemDataImplCopyWith<$Res> {
  __$$ItemDataImplCopyWithImpl(
      _$ItemDataImpl _value, $Res Function(_$ItemDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? QTY_UNIT = null,
    Object? QR_NO = null,
    Object? ITEM_NM = null,
    Object? LOC_CD = null,
    Object? LAST_LOC = null,
    Object? CUST_CD = freezed,
    Object? QTY = null,
    Object? VEND_NM = freezed,
    Object? ZONE_NM = null,
    Object? REMARK = freezed,
    Object? WHT_UNIT = freezed,
    Object? PRT_NO = freezed,
    Object? BOX_WHT = freezed,
    Object? WHT = freezed,
    Object? ITEM_CD = null,
    Object? LOC_DT = null,
    Object? TAG_NO = null,
    Object? INB_YN = null,
    Object? EXP_DT = freezed,
    Object? EXTR_VAL = freezed,
    Object? D_QTY = null,
    Object? BOX_NM = freezed,
    Object? PRT_DT = freezed,
    Object? SET_QTY = freezed,
    Object? BOX_NO = freezed,
    Object? PJT_NO = freezed,
    Object? PJT_NM = freezed,
    Object? VEND_CD = freezed,
    Object? TOT_WHT = freezed,
    Object? TAG_TYPE = null,
    Object? LOT_NO = null,
    Object? ZONE_CD = null,
    Object? INB_NO = null,
  }) {
    return _then(_$ItemDataImpl(
      QTY_UNIT: null == QTY_UNIT
          ? _value.QTY_UNIT
          : QTY_UNIT // ignore: cast_nullable_to_non_nullable
              as String,
      QR_NO: null == QR_NO
          ? _value.QR_NO
          : QR_NO // ignore: cast_nullable_to_non_nullable
              as String,
      ITEM_NM: null == ITEM_NM
          ? _value.ITEM_NM
          : ITEM_NM // ignore: cast_nullable_to_non_nullable
              as String,
      LOC_CD: null == LOC_CD
          ? _value.LOC_CD
          : LOC_CD // ignore: cast_nullable_to_non_nullable
              as String,
      LAST_LOC: null == LAST_LOC
          ? _value.LAST_LOC
          : LAST_LOC // ignore: cast_nullable_to_non_nullable
              as String,
      CUST_CD: freezed == CUST_CD ? _value.CUST_CD! : CUST_CD,
      QTY: null == QTY
          ? _value.QTY
          : QTY // ignore: cast_nullable_to_non_nullable
              as double,
      VEND_NM: freezed == VEND_NM ? _value.VEND_NM! : VEND_NM,
      ZONE_NM: null == ZONE_NM
          ? _value.ZONE_NM
          : ZONE_NM // ignore: cast_nullable_to_non_nullable
              as String,
      REMARK: freezed == REMARK ? _value.REMARK! : REMARK,
      WHT_UNIT: freezed == WHT_UNIT ? _value.WHT_UNIT! : WHT_UNIT,
      PRT_NO: freezed == PRT_NO ? _value.PRT_NO! : PRT_NO,
      BOX_WHT: freezed == BOX_WHT ? _value.BOX_WHT! : BOX_WHT,
      WHT: freezed == WHT ? _value.WHT! : WHT,
      ITEM_CD: null == ITEM_CD
          ? _value.ITEM_CD
          : ITEM_CD // ignore: cast_nullable_to_non_nullable
              as String,
      LOC_DT: null == LOC_DT
          ? _value.LOC_DT
          : LOC_DT // ignore: cast_nullable_to_non_nullable
              as String,
      TAG_NO: null == TAG_NO
          ? _value.TAG_NO
          : TAG_NO // ignore: cast_nullable_to_non_nullable
              as String,
      INB_YN: null == INB_YN
          ? _value.INB_YN
          : INB_YN // ignore: cast_nullable_to_non_nullable
              as String,
      EXP_DT: freezed == EXP_DT ? _value.EXP_DT! : EXP_DT,
      EXTR_VAL: freezed == EXTR_VAL ? _value.EXTR_VAL! : EXTR_VAL,
      D_QTY: null == D_QTY
          ? _value.D_QTY
          : D_QTY // ignore: cast_nullable_to_non_nullable
              as int,
      BOX_NM: freezed == BOX_NM ? _value.BOX_NM! : BOX_NM,
      PRT_DT: freezed == PRT_DT ? _value.PRT_DT! : PRT_DT,
      SET_QTY: freezed == SET_QTY ? _value.SET_QTY! : SET_QTY,
      BOX_NO: freezed == BOX_NO ? _value.BOX_NO! : BOX_NO,
      PJT_NO: freezed == PJT_NO ? _value.PJT_NO! : PJT_NO,
      PJT_NM: freezed == PJT_NM ? _value.PJT_NM! : PJT_NM,
      VEND_CD: freezed == VEND_CD ? _value.VEND_CD! : VEND_CD,
      TOT_WHT: freezed == TOT_WHT ? _value.TOT_WHT! : TOT_WHT,
      TAG_TYPE: null == TAG_TYPE
          ? _value.TAG_TYPE
          : TAG_TYPE // ignore: cast_nullable_to_non_nullable
              as String,
      LOT_NO: null == LOT_NO
          ? _value.LOT_NO
          : LOT_NO // ignore: cast_nullable_to_non_nullable
              as String,
      ZONE_CD: null == ZONE_CD
          ? _value.ZONE_CD
          : ZONE_CD // ignore: cast_nullable_to_non_nullable
              as String,
      INB_NO: null == INB_NO
          ? _value.INB_NO
          : INB_NO // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemDataImpl implements _ItemData {
  _$ItemDataImpl(
      {this.QTY_UNIT = '',
      this.QR_NO = '',
      this.ITEM_NM = '',
      this.LOC_CD = '',
      this.LAST_LOC = '',
      this.CUST_CD = '',
      this.QTY = 0.0,
      this.VEND_NM = '',
      this.ZONE_NM = '',
      this.REMARK = '',
      this.WHT_UNIT = '',
      this.PRT_NO = '',
      this.BOX_WHT = '',
      this.WHT = '',
      this.ITEM_CD = '',
      this.LOC_DT = '',
      this.TAG_NO = '',
      this.INB_YN = '',
      this.EXP_DT = '',
      this.EXTR_VAL = '',
      this.D_QTY = 0,
      this.BOX_NM = '',
      this.PRT_DT = '',
      this.SET_QTY = '',
      this.BOX_NO = '',
      this.PJT_NO = '',
      this.PJT_NM = '',
      this.VEND_CD = '',
      this.TOT_WHT = '',
      this.TAG_TYPE = '',
      this.LOT_NO = '',
      this.ZONE_CD = '',
      this.INB_NO = ''});

  factory _$ItemDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemDataImplFromJson(json);

  @override
  @JsonKey()
  final String QTY_UNIT;
  @override
  @JsonKey()
  final String QR_NO;
  @override
  @JsonKey()
  final String ITEM_NM;
  @override
  @JsonKey()
  final String LOC_CD;
  @override
  @JsonKey()
  final String LAST_LOC;
  @override
  @JsonKey()
  final dynamic CUST_CD;
  @override
  @JsonKey()
  final double QTY;
  @override
  @JsonKey()
  final dynamic VEND_NM;
  @override
  @JsonKey()
  final String ZONE_NM;
  @override
  @JsonKey()
  final dynamic REMARK;
  @override
  @JsonKey()
  final dynamic WHT_UNIT;
  @override
  @JsonKey()
  final dynamic PRT_NO;
  @override
  @JsonKey()
  final dynamic BOX_WHT;
  @override
  @JsonKey()
  final dynamic WHT;
  @override
  @JsonKey()
  final String ITEM_CD;
  @override
  @JsonKey()
  final String LOC_DT;
  @override
  @JsonKey()
  final String TAG_NO;
  @override
  @JsonKey()
  final String INB_YN;
  @override
  @JsonKey()
  final dynamic EXP_DT;
  @override
  @JsonKey()
  final dynamic EXTR_VAL;
  @override
  @JsonKey()
  final int D_QTY;
  @override
  @JsonKey()
  final dynamic BOX_NM;
  @override
  @JsonKey()
  final dynamic PRT_DT;
  @override
  @JsonKey()
  final dynamic SET_QTY;
  @override
  @JsonKey()
  final dynamic BOX_NO;
  @override
  @JsonKey()
  final dynamic PJT_NO;
  @override
  @JsonKey()
  final dynamic PJT_NM;
  @override
  @JsonKey()
  final dynamic VEND_CD;
  @override
  @JsonKey()
  final dynamic TOT_WHT;
  @override
  @JsonKey()
  final String TAG_TYPE;
  @override
  @JsonKey()
  final String LOT_NO;
  @override
  @JsonKey()
  final String ZONE_CD;
  @override
  @JsonKey()
  final String INB_NO;

  @override
  String toString() {
    return 'ItemData(QTY_UNIT: $QTY_UNIT, QR_NO: $QR_NO, ITEM_NM: $ITEM_NM, LOC_CD: $LOC_CD, LAST_LOC: $LAST_LOC, CUST_CD: $CUST_CD, QTY: $QTY, VEND_NM: $VEND_NM, ZONE_NM: $ZONE_NM, REMARK: $REMARK, WHT_UNIT: $WHT_UNIT, PRT_NO: $PRT_NO, BOX_WHT: $BOX_WHT, WHT: $WHT, ITEM_CD: $ITEM_CD, LOC_DT: $LOC_DT, TAG_NO: $TAG_NO, INB_YN: $INB_YN, EXP_DT: $EXP_DT, EXTR_VAL: $EXTR_VAL, D_QTY: $D_QTY, BOX_NM: $BOX_NM, PRT_DT: $PRT_DT, SET_QTY: $SET_QTY, BOX_NO: $BOX_NO, PJT_NO: $PJT_NO, PJT_NM: $PJT_NM, VEND_CD: $VEND_CD, TOT_WHT: $TOT_WHT, TAG_TYPE: $TAG_TYPE, LOT_NO: $LOT_NO, ZONE_CD: $ZONE_CD, INB_NO: $INB_NO)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemDataImpl &&
            (identical(other.QTY_UNIT, QTY_UNIT) ||
                other.QTY_UNIT == QTY_UNIT) &&
            (identical(other.QR_NO, QR_NO) || other.QR_NO == QR_NO) &&
            (identical(other.ITEM_NM, ITEM_NM) || other.ITEM_NM == ITEM_NM) &&
            (identical(other.LOC_CD, LOC_CD) || other.LOC_CD == LOC_CD) &&
            (identical(other.LAST_LOC, LAST_LOC) ||
                other.LAST_LOC == LAST_LOC) &&
            const DeepCollectionEquality().equals(other.CUST_CD, CUST_CD) &&
            (identical(other.QTY, QTY) || other.QTY == QTY) &&
            const DeepCollectionEquality().equals(other.VEND_NM, VEND_NM) &&
            (identical(other.ZONE_NM, ZONE_NM) || other.ZONE_NM == ZONE_NM) &&
            const DeepCollectionEquality().equals(other.REMARK, REMARK) &&
            const DeepCollectionEquality().equals(other.WHT_UNIT, WHT_UNIT) &&
            const DeepCollectionEquality().equals(other.PRT_NO, PRT_NO) &&
            const DeepCollectionEquality().equals(other.BOX_WHT, BOX_WHT) &&
            const DeepCollectionEquality().equals(other.WHT, WHT) &&
            (identical(other.ITEM_CD, ITEM_CD) || other.ITEM_CD == ITEM_CD) &&
            (identical(other.LOC_DT, LOC_DT) || other.LOC_DT == LOC_DT) &&
            (identical(other.TAG_NO, TAG_NO) || other.TAG_NO == TAG_NO) &&
            (identical(other.INB_YN, INB_YN) || other.INB_YN == INB_YN) &&
            const DeepCollectionEquality().equals(other.EXP_DT, EXP_DT) &&
            const DeepCollectionEquality().equals(other.EXTR_VAL, EXTR_VAL) &&
            (identical(other.D_QTY, D_QTY) || other.D_QTY == D_QTY) &&
            const DeepCollectionEquality().equals(other.BOX_NM, BOX_NM) &&
            const DeepCollectionEquality().equals(other.PRT_DT, PRT_DT) &&
            const DeepCollectionEquality().equals(other.SET_QTY, SET_QTY) &&
            const DeepCollectionEquality().equals(other.BOX_NO, BOX_NO) &&
            const DeepCollectionEquality().equals(other.PJT_NO, PJT_NO) &&
            const DeepCollectionEquality().equals(other.PJT_NM, PJT_NM) &&
            const DeepCollectionEquality().equals(other.VEND_CD, VEND_CD) &&
            const DeepCollectionEquality().equals(other.TOT_WHT, TOT_WHT) &&
            (identical(other.TAG_TYPE, TAG_TYPE) ||
                other.TAG_TYPE == TAG_TYPE) &&
            (identical(other.LOT_NO, LOT_NO) || other.LOT_NO == LOT_NO) &&
            (identical(other.ZONE_CD, ZONE_CD) || other.ZONE_CD == ZONE_CD) &&
            (identical(other.INB_NO, INB_NO) || other.INB_NO == INB_NO));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        QTY_UNIT,
        QR_NO,
        ITEM_NM,
        LOC_CD,
        LAST_LOC,
        const DeepCollectionEquality().hash(CUST_CD),
        QTY,
        const DeepCollectionEquality().hash(VEND_NM),
        ZONE_NM,
        const DeepCollectionEquality().hash(REMARK),
        const DeepCollectionEquality().hash(WHT_UNIT),
        const DeepCollectionEquality().hash(PRT_NO),
        const DeepCollectionEquality().hash(BOX_WHT),
        const DeepCollectionEquality().hash(WHT),
        ITEM_CD,
        LOC_DT,
        TAG_NO,
        INB_YN,
        const DeepCollectionEquality().hash(EXP_DT),
        const DeepCollectionEquality().hash(EXTR_VAL),
        D_QTY,
        const DeepCollectionEquality().hash(BOX_NM),
        const DeepCollectionEquality().hash(PRT_DT),
        const DeepCollectionEquality().hash(SET_QTY),
        const DeepCollectionEquality().hash(BOX_NO),
        const DeepCollectionEquality().hash(PJT_NO),
        const DeepCollectionEquality().hash(PJT_NM),
        const DeepCollectionEquality().hash(VEND_CD),
        const DeepCollectionEquality().hash(TOT_WHT),
        TAG_TYPE,
        LOT_NO,
        ZONE_CD,
        INB_NO
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemDataImplCopyWith<_$ItemDataImpl> get copyWith =>
      __$$ItemDataImplCopyWithImpl<_$ItemDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemDataImplToJson(
      this,
    );
  }
}

abstract class _ItemData implements ItemData {
  factory _ItemData(
      {final String QTY_UNIT,
      final String QR_NO,
      final String ITEM_NM,
      final String LOC_CD,
      final String LAST_LOC,
      final dynamic CUST_CD,
      final double QTY,
      final dynamic VEND_NM,
      final String ZONE_NM,
      final dynamic REMARK,
      final dynamic WHT_UNIT,
      final dynamic PRT_NO,
      final dynamic BOX_WHT,
      final dynamic WHT,
      final String ITEM_CD,
      final String LOC_DT,
      final String TAG_NO,
      final String INB_YN,
      final dynamic EXP_DT,
      final dynamic EXTR_VAL,
      final int D_QTY,
      final dynamic BOX_NM,
      final dynamic PRT_DT,
      final dynamic SET_QTY,
      final dynamic BOX_NO,
      final dynamic PJT_NO,
      final dynamic PJT_NM,
      final dynamic VEND_CD,
      final dynamic TOT_WHT,
      final String TAG_TYPE,
      final String LOT_NO,
      final String ZONE_CD,
      final String INB_NO}) = _$ItemDataImpl;

  factory _ItemData.fromJson(Map<String, dynamic> json) =
      _$ItemDataImpl.fromJson;

  @override
  String get QTY_UNIT;
  @override
  String get QR_NO;
  @override
  String get ITEM_NM;
  @override
  String get LOC_CD;
  @override
  String get LAST_LOC;
  @override
  dynamic get CUST_CD;
  @override
  double get QTY;
  @override
  dynamic get VEND_NM;
  @override
  String get ZONE_NM;
  @override
  dynamic get REMARK;
  @override
  dynamic get WHT_UNIT;
  @override
  dynamic get PRT_NO;
  @override
  dynamic get BOX_WHT;
  @override
  dynamic get WHT;
  @override
  String get ITEM_CD;
  @override
  String get LOC_DT;
  @override
  String get TAG_NO;
  @override
  String get INB_YN;
  @override
  dynamic get EXP_DT;
  @override
  dynamic get EXTR_VAL;
  @override
  int get D_QTY;
  @override
  dynamic get BOX_NM;
  @override
  dynamic get PRT_DT;
  @override
  dynamic get SET_QTY;
  @override
  dynamic get BOX_NO;
  @override
  dynamic get PJT_NO;
  @override
  dynamic get PJT_NM;
  @override
  dynamic get VEND_CD;
  @override
  dynamic get TOT_WHT;
  @override
  String get TAG_TYPE;
  @override
  String get LOT_NO;
  @override
  String get ZONE_CD;
  @override
  String get INB_NO;
  @override
  @JsonKey(ignore: true)
  _$$ItemDataImplCopyWith<_$ItemDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
