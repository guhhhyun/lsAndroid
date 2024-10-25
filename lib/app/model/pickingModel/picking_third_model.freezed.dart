// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'picking_third_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PickingThirdModel _$PickingThirdModelFromJson(Map<String, dynamic> json) {
  return _PickingThirdModel.fromJson(json);
}

/// @nodoc
mixin _$PickingThirdModel {
  Header? get header => throw _privateConstructorUsedError;
  String get resultCode => throw _privateConstructorUsedError;
  String get resultMessage => throw _privateConstructorUsedError;
  List<dynamic>? get body => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PickingThirdModelCopyWith<PickingThirdModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PickingThirdModelCopyWith<$Res> {
  factory $PickingThirdModelCopyWith(
          PickingThirdModel value, $Res Function(PickingThirdModel) then) =
      _$PickingThirdModelCopyWithImpl<$Res, PickingThirdModel>;
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
class _$PickingThirdModelCopyWithImpl<$Res, $Val extends PickingThirdModel>
    implements $PickingThirdModelCopyWith<$Res> {
  _$PickingThirdModelCopyWithImpl(this._value, this._then);

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
abstract class _$$PickingThirdModelImplCopyWith<$Res>
    implements $PickingThirdModelCopyWith<$Res> {
  factory _$$PickingThirdModelImplCopyWith(_$PickingThirdModelImpl value,
          $Res Function(_$PickingThirdModelImpl) then) =
      __$$PickingThirdModelImplCopyWithImpl<$Res>;
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
class __$$PickingThirdModelImplCopyWithImpl<$Res>
    extends _$PickingThirdModelCopyWithImpl<$Res, _$PickingThirdModelImpl>
    implements _$$PickingThirdModelImplCopyWith<$Res> {
  __$$PickingThirdModelImplCopyWithImpl(_$PickingThirdModelImpl _value,
      $Res Function(_$PickingThirdModelImpl) _then)
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
    return _then(_$PickingThirdModelImpl(
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
class _$PickingThirdModelImpl implements _PickingThirdModel {
  const _$PickingThirdModelImpl(
      {this.header,
      this.resultCode = '',
      this.resultMessage = '',
      final List<dynamic>? body,
      this.hasError = false})
      : _body = body;

  factory _$PickingThirdModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PickingThirdModelImplFromJson(json);

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
    return 'PickingThirdModel(header: $header, resultCode: $resultCode, resultMessage: $resultMessage, body: $body, hasError: $hasError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PickingThirdModelImpl &&
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
  _$$PickingThirdModelImplCopyWith<_$PickingThirdModelImpl> get copyWith =>
      __$$PickingThirdModelImplCopyWithImpl<_$PickingThirdModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PickingThirdModelImplToJson(
      this,
    );
  }
}

abstract class _PickingThirdModel implements PickingThirdModel {
  const factory _PickingThirdModel(
      {final Header? header,
      final String resultCode,
      final String resultMessage,
      final List<dynamic>? body,
      final bool hasError}) = _$PickingThirdModelImpl;

  factory _PickingThirdModel.fromJson(Map<String, dynamic> json) =
      _$PickingThirdModelImpl.fromJson;

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
  _$$PickingThirdModelImplCopyWith<_$PickingThirdModelImpl> get copyWith =>
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

BodyResult _$BodyResultFromJson(Map<String, dynamic> json) {
  return _BodyResult.fromJson(json);
}

/// @nodoc
mixin _$BodyResult {
  bool get resultValue => throw _privateConstructorUsedError;
  int get resultRowCount => throw _privateConstructorUsedError;
  String get resultCode => throw _privateConstructorUsedError;
  String get resultMessage => throw _privateConstructorUsedError;
  String get errorState => throw _privateConstructorUsedError;
  String get errorProcedure => throw _privateConstructorUsedError;
  String get returnMessage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BodyResultCopyWith<BodyResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BodyResultCopyWith<$Res> {
  factory $BodyResultCopyWith(
          BodyResult value, $Res Function(BodyResult) then) =
      _$BodyResultCopyWithImpl<$Res, BodyResult>;
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
class _$BodyResultCopyWithImpl<$Res, $Val extends BodyResult>
    implements $BodyResultCopyWith<$Res> {
  _$BodyResultCopyWithImpl(this._value, this._then);

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
abstract class _$$BodyResultImplCopyWith<$Res>
    implements $BodyResultCopyWith<$Res> {
  factory _$$BodyResultImplCopyWith(
          _$BodyResultImpl value, $Res Function(_$BodyResultImpl) then) =
      __$$BodyResultImplCopyWithImpl<$Res>;
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
class __$$BodyResultImplCopyWithImpl<$Res>
    extends _$BodyResultCopyWithImpl<$Res, _$BodyResultImpl>
    implements _$$BodyResultImplCopyWith<$Res> {
  __$$BodyResultImplCopyWithImpl(
      _$BodyResultImpl _value, $Res Function(_$BodyResultImpl) _then)
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
    return _then(_$BodyResultImpl(
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
class _$BodyResultImpl implements _BodyResult {
  const _$BodyResultImpl(
      {this.resultValue = false,
      this.resultRowCount = 0,
      this.resultCode = '',
      this.resultMessage = '',
      this.errorState = '',
      this.errorProcedure = '',
      this.returnMessage = ''});

  factory _$BodyResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$BodyResultImplFromJson(json);

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
    return 'BodyResult(resultValue: $resultValue, resultRowCount: $resultRowCount, resultCode: $resultCode, resultMessage: $resultMessage, errorState: $errorState, errorProcedure: $errorProcedure, returnMessage: $returnMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BodyResultImpl &&
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
  _$$BodyResultImplCopyWith<_$BodyResultImpl> get copyWith =>
      __$$BodyResultImplCopyWithImpl<_$BodyResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BodyResultImplToJson(
      this,
    );
  }
}

abstract class _BodyResult implements BodyResult {
  const factory _BodyResult(
      {final bool resultValue,
      final int resultRowCount,
      final String resultCode,
      final String resultMessage,
      final String errorState,
      final String errorProcedure,
      final String returnMessage}) = _$BodyResultImpl;

  factory _BodyResult.fromJson(Map<String, dynamic> json) =
      _$BodyResultImpl.fromJson;

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
  _$$BodyResultImplCopyWith<_$BodyResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BodyItem _$BodyItemFromJson(Map<String, dynamic> json) {
  return _BodyItem.fromJson(json);
}

/// @nodoc
mixin _$BodyItem {
  String get locCd => throw _privateConstructorUsedError;
  String get whCd => throw _privateConstructorUsedError;
  String get pjtNm => throw _privateConstructorUsedError;
  int get locSeq => throw _privateConstructorUsedError;
  String get itemCd => throw _privateConstructorUsedError;
  String get tagNo => throw _privateConstructorUsedError;
  String get pitmNm => throw _privateConstructorUsedError;
  String get itemNm => throw _privateConstructorUsedError;
  String get pitmCd => throw _privateConstructorUsedError;
  String get zoneCd => throw _privateConstructorUsedError;
  String get inbLotNo => throw _privateConstructorUsedError;
  String get wrkNo => throw _privateConstructorUsedError;
  dynamic get lotNo => throw _privateConstructorUsedError;
  dynamic get boxNo => throw _privateConstructorUsedError;
  String get plant => throw _privateConstructorUsedError;
  double get qty => throw _privateConstructorUsedError;
  String get mstKey => throw _privateConstructorUsedError;
  int get inbLotSeq => throw _privateConstructorUsedError;
  bool get selected => throw _privateConstructorUsedError;
  int get pickQty => throw _privateConstructorUsedError;

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
      {String locCd,
      String whCd,
      String pjtNm,
      int locSeq,
      String itemCd,
      String tagNo,
      String pitmNm,
      String itemNm,
      String pitmCd,
      String zoneCd,
      String inbLotNo,
      String wrkNo,
      dynamic lotNo,
      dynamic boxNo,
      String plant,
      double qty,
      String mstKey,
      int inbLotSeq,
      bool selected,
      int pickQty});
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
    Object? locCd = null,
    Object? whCd = null,
    Object? pjtNm = null,
    Object? locSeq = null,
    Object? itemCd = null,
    Object? tagNo = null,
    Object? pitmNm = null,
    Object? itemNm = null,
    Object? pitmCd = null,
    Object? zoneCd = null,
    Object? inbLotNo = null,
    Object? wrkNo = null,
    Object? lotNo = freezed,
    Object? boxNo = freezed,
    Object? plant = null,
    Object? qty = null,
    Object? mstKey = null,
    Object? inbLotSeq = null,
    Object? selected = null,
    Object? pickQty = null,
  }) {
    return _then(_value.copyWith(
      locCd: null == locCd
          ? _value.locCd
          : locCd // ignore: cast_nullable_to_non_nullable
              as String,
      whCd: null == whCd
          ? _value.whCd
          : whCd // ignore: cast_nullable_to_non_nullable
              as String,
      pjtNm: null == pjtNm
          ? _value.pjtNm
          : pjtNm // ignore: cast_nullable_to_non_nullable
              as String,
      locSeq: null == locSeq
          ? _value.locSeq
          : locSeq // ignore: cast_nullable_to_non_nullable
              as int,
      itemCd: null == itemCd
          ? _value.itemCd
          : itemCd // ignore: cast_nullable_to_non_nullable
              as String,
      tagNo: null == tagNo
          ? _value.tagNo
          : tagNo // ignore: cast_nullable_to_non_nullable
              as String,
      pitmNm: null == pitmNm
          ? _value.pitmNm
          : pitmNm // ignore: cast_nullable_to_non_nullable
              as String,
      itemNm: null == itemNm
          ? _value.itemNm
          : itemNm // ignore: cast_nullable_to_non_nullable
              as String,
      pitmCd: null == pitmCd
          ? _value.pitmCd
          : pitmCd // ignore: cast_nullable_to_non_nullable
              as String,
      zoneCd: null == zoneCd
          ? _value.zoneCd
          : zoneCd // ignore: cast_nullable_to_non_nullable
              as String,
      inbLotNo: null == inbLotNo
          ? _value.inbLotNo
          : inbLotNo // ignore: cast_nullable_to_non_nullable
              as String,
      wrkNo: null == wrkNo
          ? _value.wrkNo
          : wrkNo // ignore: cast_nullable_to_non_nullable
              as String,
      lotNo: freezed == lotNo
          ? _value.lotNo
          : lotNo // ignore: cast_nullable_to_non_nullable
              as dynamic,
      boxNo: freezed == boxNo
          ? _value.boxNo
          : boxNo // ignore: cast_nullable_to_non_nullable
              as dynamic,
      plant: null == plant
          ? _value.plant
          : plant // ignore: cast_nullable_to_non_nullable
              as String,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as double,
      mstKey: null == mstKey
          ? _value.mstKey
          : mstKey // ignore: cast_nullable_to_non_nullable
              as String,
      inbLotSeq: null == inbLotSeq
          ? _value.inbLotSeq
          : inbLotSeq // ignore: cast_nullable_to_non_nullable
              as int,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
      pickQty: null == pickQty
          ? _value.pickQty
          : pickQty // ignore: cast_nullable_to_non_nullable
              as int,
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
      {String locCd,
      String whCd,
      String pjtNm,
      int locSeq,
      String itemCd,
      String tagNo,
      String pitmNm,
      String itemNm,
      String pitmCd,
      String zoneCd,
      String inbLotNo,
      String wrkNo,
      dynamic lotNo,
      dynamic boxNo,
      String plant,
      double qty,
      String mstKey,
      int inbLotSeq,
      bool selected,
      int pickQty});
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
    Object? locCd = null,
    Object? whCd = null,
    Object? pjtNm = null,
    Object? locSeq = null,
    Object? itemCd = null,
    Object? tagNo = null,
    Object? pitmNm = null,
    Object? itemNm = null,
    Object? pitmCd = null,
    Object? zoneCd = null,
    Object? inbLotNo = null,
    Object? wrkNo = null,
    Object? lotNo = freezed,
    Object? boxNo = freezed,
    Object? plant = null,
    Object? qty = null,
    Object? mstKey = null,
    Object? inbLotSeq = null,
    Object? selected = null,
    Object? pickQty = null,
  }) {
    return _then(_$BodyItemImpl(
      locCd: null == locCd
          ? _value.locCd
          : locCd // ignore: cast_nullable_to_non_nullable
              as String,
      whCd: null == whCd
          ? _value.whCd
          : whCd // ignore: cast_nullable_to_non_nullable
              as String,
      pjtNm: null == pjtNm
          ? _value.pjtNm
          : pjtNm // ignore: cast_nullable_to_non_nullable
              as String,
      locSeq: null == locSeq
          ? _value.locSeq
          : locSeq // ignore: cast_nullable_to_non_nullable
              as int,
      itemCd: null == itemCd
          ? _value.itemCd
          : itemCd // ignore: cast_nullable_to_non_nullable
              as String,
      tagNo: null == tagNo
          ? _value.tagNo
          : tagNo // ignore: cast_nullable_to_non_nullable
              as String,
      pitmNm: null == pitmNm
          ? _value.pitmNm
          : pitmNm // ignore: cast_nullable_to_non_nullable
              as String,
      itemNm: null == itemNm
          ? _value.itemNm
          : itemNm // ignore: cast_nullable_to_non_nullable
              as String,
      pitmCd: null == pitmCd
          ? _value.pitmCd
          : pitmCd // ignore: cast_nullable_to_non_nullable
              as String,
      zoneCd: null == zoneCd
          ? _value.zoneCd
          : zoneCd // ignore: cast_nullable_to_non_nullable
              as String,
      inbLotNo: null == inbLotNo
          ? _value.inbLotNo
          : inbLotNo // ignore: cast_nullable_to_non_nullable
              as String,
      wrkNo: null == wrkNo
          ? _value.wrkNo
          : wrkNo // ignore: cast_nullable_to_non_nullable
              as String,
      lotNo: freezed == lotNo ? _value.lotNo! : lotNo,
      boxNo: freezed == boxNo ? _value.boxNo! : boxNo,
      plant: null == plant
          ? _value.plant
          : plant // ignore: cast_nullable_to_non_nullable
              as String,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as double,
      mstKey: null == mstKey
          ? _value.mstKey
          : mstKey // ignore: cast_nullable_to_non_nullable
              as String,
      inbLotSeq: null == inbLotSeq
          ? _value.inbLotSeq
          : inbLotSeq // ignore: cast_nullable_to_non_nullable
              as int,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
      pickQty: null == pickQty
          ? _value.pickQty
          : pickQty // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BodyItemImpl implements _BodyItem {
  const _$BodyItemImpl(
      {this.locCd = '',
      this.whCd = '',
      this.pjtNm = '',
      this.locSeq = 0,
      this.itemCd = '',
      this.tagNo = '',
      this.pitmNm = '',
      this.itemNm = '',
      this.pitmCd = '',
      this.zoneCd = '',
      this.inbLotNo = '',
      this.wrkNo = '',
      this.lotNo = '',
      this.boxNo = '',
      this.plant = '',
      this.qty = 0.0,
      this.mstKey = '',
      this.inbLotSeq = 0,
      this.selected = false,
      this.pickQty = 0});

  factory _$BodyItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$BodyItemImplFromJson(json);

  @override
  @JsonKey()
  final String locCd;
  @override
  @JsonKey()
  final String whCd;
  @override
  @JsonKey()
  final String pjtNm;
  @override
  @JsonKey()
  final int locSeq;
  @override
  @JsonKey()
  final String itemCd;
  @override
  @JsonKey()
  final String tagNo;
  @override
  @JsonKey()
  final String pitmNm;
  @override
  @JsonKey()
  final String itemNm;
  @override
  @JsonKey()
  final String pitmCd;
  @override
  @JsonKey()
  final String zoneCd;
  @override
  @JsonKey()
  final String inbLotNo;
  @override
  @JsonKey()
  final String wrkNo;
  @override
  @JsonKey()
  final dynamic lotNo;
  @override
  @JsonKey()
  final dynamic boxNo;
  @override
  @JsonKey()
  final String plant;
  @override
  @JsonKey()
  final double qty;
  @override
  @JsonKey()
  final String mstKey;
  @override
  @JsonKey()
  final int inbLotSeq;
  @override
  @JsonKey()
  final bool selected;
  @override
  @JsonKey()
  final int pickQty;

  @override
  String toString() {
    return 'BodyItem(locCd: $locCd, whCd: $whCd, pjtNm: $pjtNm, locSeq: $locSeq, itemCd: $itemCd, tagNo: $tagNo, pitmNm: $pitmNm, itemNm: $itemNm, pitmCd: $pitmCd, zoneCd: $zoneCd, inbLotNo: $inbLotNo, wrkNo: $wrkNo, lotNo: $lotNo, boxNo: $boxNo, plant: $plant, qty: $qty, mstKey: $mstKey, inbLotSeq: $inbLotSeq, selected: $selected, pickQty: $pickQty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BodyItemImpl &&
            (identical(other.locCd, locCd) || other.locCd == locCd) &&
            (identical(other.whCd, whCd) || other.whCd == whCd) &&
            (identical(other.pjtNm, pjtNm) || other.pjtNm == pjtNm) &&
            (identical(other.locSeq, locSeq) || other.locSeq == locSeq) &&
            (identical(other.itemCd, itemCd) || other.itemCd == itemCd) &&
            (identical(other.tagNo, tagNo) || other.tagNo == tagNo) &&
            (identical(other.pitmNm, pitmNm) || other.pitmNm == pitmNm) &&
            (identical(other.itemNm, itemNm) || other.itemNm == itemNm) &&
            (identical(other.pitmCd, pitmCd) || other.pitmCd == pitmCd) &&
            (identical(other.zoneCd, zoneCd) || other.zoneCd == zoneCd) &&
            (identical(other.inbLotNo, inbLotNo) ||
                other.inbLotNo == inbLotNo) &&
            (identical(other.wrkNo, wrkNo) || other.wrkNo == wrkNo) &&
            const DeepCollectionEquality().equals(other.lotNo, lotNo) &&
            const DeepCollectionEquality().equals(other.boxNo, boxNo) &&
            (identical(other.plant, plant) || other.plant == plant) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.mstKey, mstKey) || other.mstKey == mstKey) &&
            (identical(other.inbLotSeq, inbLotSeq) ||
                other.inbLotSeq == inbLotSeq) &&
            (identical(other.selected, selected) ||
                other.selected == selected) &&
            (identical(other.pickQty, pickQty) || other.pickQty == pickQty));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        locCd,
        whCd,
        pjtNm,
        locSeq,
        itemCd,
        tagNo,
        pitmNm,
        itemNm,
        pitmCd,
        zoneCd,
        inbLotNo,
        wrkNo,
        const DeepCollectionEquality().hash(lotNo),
        const DeepCollectionEquality().hash(boxNo),
        plant,
        qty,
        mstKey,
        inbLotSeq,
        selected,
        pickQty
      ]);

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
      {final String locCd,
      final String whCd,
      final String pjtNm,
      final int locSeq,
      final String itemCd,
      final String tagNo,
      final String pitmNm,
      final String itemNm,
      final String pitmCd,
      final String zoneCd,
      final String inbLotNo,
      final String wrkNo,
      final dynamic lotNo,
      final dynamic boxNo,
      final String plant,
      final double qty,
      final String mstKey,
      final int inbLotSeq,
      final bool selected,
      final int pickQty}) = _$BodyItemImpl;

  factory _BodyItem.fromJson(Map<String, dynamic> json) =
      _$BodyItemImpl.fromJson;

  @override
  String get locCd;
  @override
  String get whCd;
  @override
  String get pjtNm;
  @override
  int get locSeq;
  @override
  String get itemCd;
  @override
  String get tagNo;
  @override
  String get pitmNm;
  @override
  String get itemNm;
  @override
  String get pitmCd;
  @override
  String get zoneCd;
  @override
  String get inbLotNo;
  @override
  String get wrkNo;
  @override
  dynamic get lotNo;
  @override
  dynamic get boxNo;
  @override
  String get plant;
  @override
  double get qty;
  @override
  String get mstKey;
  @override
  int get inbLotSeq;
  @override
  bool get selected;
  @override
  int get pickQty;
  @override
  @JsonKey(ignore: true)
  _$$BodyItemImplCopyWith<_$BodyItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
