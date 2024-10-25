// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'picking_second_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PickingSecondModel _$PickingSecondModelFromJson(Map<String, dynamic> json) {
  return _PickingSecondModel.fromJson(json);
}

/// @nodoc
mixin _$PickingSecondModel {
  Header? get header => throw _privateConstructorUsedError;
  String get resultCode => throw _privateConstructorUsedError;
  String get resultMessage => throw _privateConstructorUsedError;
  List<dynamic>? get body => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PickingSecondModelCopyWith<PickingSecondModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PickingSecondModelCopyWith<$Res> {
  factory $PickingSecondModelCopyWith(
          PickingSecondModel value, $Res Function(PickingSecondModel) then) =
      _$PickingSecondModelCopyWithImpl<$Res, PickingSecondModel>;
  @useResult
  $Res call(
      {Header? header,
      String resultCode,
      String resultMessage,
      List<dynamic>? body});

  $HeaderCopyWith<$Res>? get header;
}

/// @nodoc
class _$PickingSecondModelCopyWithImpl<$Res, $Val extends PickingSecondModel>
    implements $PickingSecondModelCopyWith<$Res> {
  _$PickingSecondModelCopyWithImpl(this._value, this._then);

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
abstract class _$$PickingSecondModelImplCopyWith<$Res>
    implements $PickingSecondModelCopyWith<$Res> {
  factory _$$PickingSecondModelImplCopyWith(_$PickingSecondModelImpl value,
          $Res Function(_$PickingSecondModelImpl) then) =
      __$$PickingSecondModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Header? header,
      String resultCode,
      String resultMessage,
      List<dynamic>? body});

  @override
  $HeaderCopyWith<$Res>? get header;
}

/// @nodoc
class __$$PickingSecondModelImplCopyWithImpl<$Res>
    extends _$PickingSecondModelCopyWithImpl<$Res, _$PickingSecondModelImpl>
    implements _$$PickingSecondModelImplCopyWith<$Res> {
  __$$PickingSecondModelImplCopyWithImpl(_$PickingSecondModelImpl _value,
      $Res Function(_$PickingSecondModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? header = freezed,
    Object? resultCode = null,
    Object? resultMessage = null,
    Object? body = freezed,
  }) {
    return _then(_$PickingSecondModelImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PickingSecondModelImpl implements _PickingSecondModel {
  const _$PickingSecondModelImpl(
      {this.header,
      this.resultCode = '',
      this.resultMessage = '',
      final List<dynamic>? body})
      : _body = body;

  factory _$PickingSecondModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PickingSecondModelImplFromJson(json);

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
  String toString() {
    return 'PickingSecondModel(header: $header, resultCode: $resultCode, resultMessage: $resultMessage, body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PickingSecondModelImpl &&
            (identical(other.header, header) || other.header == header) &&
            (identical(other.resultCode, resultCode) ||
                other.resultCode == resultCode) &&
            (identical(other.resultMessage, resultMessage) ||
                other.resultMessage == resultMessage) &&
            const DeepCollectionEquality().equals(other._body, _body));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, header, resultCode,
      resultMessage, const DeepCollectionEquality().hash(_body));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PickingSecondModelImplCopyWith<_$PickingSecondModelImpl> get copyWith =>
      __$$PickingSecondModelImplCopyWithImpl<_$PickingSecondModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PickingSecondModelImplToJson(
      this,
    );
  }
}

abstract class _PickingSecondModel implements PickingSecondModel {
  const factory _PickingSecondModel(
      {final Header? header,
      final String resultCode,
      final String resultMessage,
      final List<dynamic>? body}) = _$PickingSecondModelImpl;

  factory _PickingSecondModel.fromJson(Map<String, dynamic> json) =
      _$PickingSecondModelImpl.fromJson;

  @override
  Header? get header;
  @override
  String get resultCode;
  @override
  String get resultMessage;
  @override
  List<dynamic>? get body;
  @override
  @JsonKey(ignore: true)
  _$$PickingSecondModelImplCopyWith<_$PickingSecondModelImpl> get copyWith =>
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

Body _$BodyFromJson(Map<String, dynamic> json) {
  return _Body.fromJson(json);
}

/// @nodoc
mixin _$Body {
  bool get resultValue => throw _privateConstructorUsedError;
  int get resultRowCount => throw _privateConstructorUsedError;
  String get resultCode => throw _privateConstructorUsedError;
  String get resultMessage => throw _privateConstructorUsedError;
  String get errorState => throw _privateConstructorUsedError;
  String get errorProcedure => throw _privateConstructorUsedError;
  String get returnMessage => throw _privateConstructorUsedError;
  List<FreedomTableBodyCell>? get rows => throw _privateConstructorUsedError;

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
      {bool resultValue,
      int resultRowCount,
      String resultCode,
      String resultMessage,
      String errorState,
      String errorProcedure,
      String returnMessage,
      List<FreedomTableBodyCell>? rows});
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
    Object? resultValue = null,
    Object? resultRowCount = null,
    Object? resultCode = null,
    Object? resultMessage = null,
    Object? errorState = null,
    Object? errorProcedure = null,
    Object? returnMessage = null,
    Object? rows = freezed,
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
      rows: freezed == rows
          ? _value.rows
          : rows // ignore: cast_nullable_to_non_nullable
              as List<FreedomTableBodyCell>?,
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
      {bool resultValue,
      int resultRowCount,
      String resultCode,
      String resultMessage,
      String errorState,
      String errorProcedure,
      String returnMessage,
      List<FreedomTableBodyCell>? rows});
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
    Object? resultValue = null,
    Object? resultRowCount = null,
    Object? resultCode = null,
    Object? resultMessage = null,
    Object? errorState = null,
    Object? errorProcedure = null,
    Object? returnMessage = null,
    Object? rows = freezed,
  }) {
    return _then(_$BodyImpl(
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
      rows: freezed == rows
          ? _value._rows
          : rows // ignore: cast_nullable_to_non_nullable
              as List<FreedomTableBodyCell>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BodyImpl implements _Body {
  const _$BodyImpl(
      {this.resultValue = false,
      this.resultRowCount = 0,
      this.resultCode = '',
      this.resultMessage = '',
      this.errorState = '',
      this.errorProcedure = '',
      this.returnMessage = '',
      final List<FreedomTableBodyCell>? rows})
      : _rows = rows;

  factory _$BodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$BodyImplFromJson(json);

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
  final List<FreedomTableBodyCell>? _rows;
  @override
  List<FreedomTableBodyCell>? get rows {
    final value = _rows;
    if (value == null) return null;
    if (_rows is EqualUnmodifiableListView) return _rows;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Body(resultValue: $resultValue, resultRowCount: $resultRowCount, resultCode: $resultCode, resultMessage: $resultMessage, errorState: $errorState, errorProcedure: $errorProcedure, returnMessage: $returnMessage, rows: $rows)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BodyImpl &&
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
                other.returnMessage == returnMessage) &&
            const DeepCollectionEquality().equals(other._rows, _rows));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      resultValue,
      resultRowCount,
      resultCode,
      resultMessage,
      errorState,
      errorProcedure,
      returnMessage,
      const DeepCollectionEquality().hash(_rows));

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
      {final bool resultValue,
      final int resultRowCount,
      final String resultCode,
      final String resultMessage,
      final String errorState,
      final String errorProcedure,
      final String returnMessage,
      final List<FreedomTableBodyCell>? rows}) = _$BodyImpl;

  factory _Body.fromJson(Map<String, dynamic> json) = _$BodyImpl.fromJson;

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
  List<FreedomTableBodyCell>? get rows;
  @override
  @JsonKey(ignore: true)
  _$$BodyImplCopyWith<_$BodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FreedomTableBodyCell _$FreedomTableBodyCellFromJson(Map<String, dynamic> json) {
  return _FreedomTableBodyCell.fromJson(json);
}

/// @nodoc
mixin _$FreedomTableBodyCell {
  int get pickRank => throw _privateConstructorUsedError;
  int get pickOrdQtyRowspan => throw _privateConstructorUsedError;
  String get rackOutBtn => throw _privateConstructorUsedError;
  String get pjtNm => throw _privateConstructorUsedError;
  String get grpKey => throw _privateConstructorUsedError;
  String get soNo => throw _privateConstructorUsedError;
  String get pitmNm => throw _privateConstructorUsedError;
  String get itemNm => throw _privateConstructorUsedError;
  int get pickOrdQty => throw _privateConstructorUsedError;
  int get pitmCdRowspan => throw _privateConstructorUsedError;
  String get wrkNo => throw _privateConstructorUsedError;
  int get wrkNoRowspan => throw _privateConstructorUsedError;
  String get pickNo => throw _privateConstructorUsedError;
  String get othRackOutBtn => throw _privateConstructorUsedError;
  int get soNoRowspan => throw _privateConstructorUsedError;
  int get pjtNmRowspan => throw _privateConstructorUsedError;
  bool get selected => throw _privateConstructorUsedError;
  int get pickQty => throw _privateConstructorUsedError;
  int get pickRankRowspan => throw _privateConstructorUsedError;
  String get kYn => throw _privateConstructorUsedError;
  int get othRackOutBtnRowspan => throw _privateConstructorUsedError;
  String get locCd => throw _privateConstructorUsedError;
  int get btnHeight => throw _privateConstructorUsedError;
  int get pickQtyRowspan => throw _privateConstructorUsedError;
  int get pitmNmRowspan => throw _privateConstructorUsedError;
  int get rackOutBtnRowspan => throw _privateConstructorUsedError;
  int get cbxSeq => throw _privateConstructorUsedError;
  String get itemCd => throw _privateConstructorUsedError;
  String get pitmCd => throw _privateConstructorUsedError;
  int get locCdRowspan => throw _privateConstructorUsedError;
  int get pickSeq => throw _privateConstructorUsedError;
  String get plant => throw _privateConstructorUsedError;
  bool get othRackOutBtnVisible => throw _privateConstructorUsedError;
  int get pickNoRowspan => throw _privateConstructorUsedError;
  String get mstKey => throw _privateConstructorUsedError;
  String get cbxNo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FreedomTableBodyCellCopyWith<FreedomTableBodyCell> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FreedomTableBodyCellCopyWith<$Res> {
  factory $FreedomTableBodyCellCopyWith(FreedomTableBodyCell value,
          $Res Function(FreedomTableBodyCell) then) =
      _$FreedomTableBodyCellCopyWithImpl<$Res, FreedomTableBodyCell>;
  @useResult
  $Res call(
      {int pickRank,
      int pickOrdQtyRowspan,
      String rackOutBtn,
      String pjtNm,
      String grpKey,
      String soNo,
      String pitmNm,
      String itemNm,
      int pickOrdQty,
      int pitmCdRowspan,
      String wrkNo,
      int wrkNoRowspan,
      String pickNo,
      String othRackOutBtn,
      int soNoRowspan,
      int pjtNmRowspan,
      bool selected,
      int pickQty,
      int pickRankRowspan,
      String kYn,
      int othRackOutBtnRowspan,
      String locCd,
      int btnHeight,
      int pickQtyRowspan,
      int pitmNmRowspan,
      int rackOutBtnRowspan,
      int cbxSeq,
      String itemCd,
      String pitmCd,
      int locCdRowspan,
      int pickSeq,
      String plant,
      bool othRackOutBtnVisible,
      int pickNoRowspan,
      String mstKey,
      String cbxNo});
}

/// @nodoc
class _$FreedomTableBodyCellCopyWithImpl<$Res,
        $Val extends FreedomTableBodyCell>
    implements $FreedomTableBodyCellCopyWith<$Res> {
  _$FreedomTableBodyCellCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pickRank = null,
    Object? pickOrdQtyRowspan = null,
    Object? rackOutBtn = null,
    Object? pjtNm = null,
    Object? grpKey = null,
    Object? soNo = null,
    Object? pitmNm = null,
    Object? itemNm = null,
    Object? pickOrdQty = null,
    Object? pitmCdRowspan = null,
    Object? wrkNo = null,
    Object? wrkNoRowspan = null,
    Object? pickNo = null,
    Object? othRackOutBtn = null,
    Object? soNoRowspan = null,
    Object? pjtNmRowspan = null,
    Object? selected = null,
    Object? pickQty = null,
    Object? pickRankRowspan = null,
    Object? kYn = null,
    Object? othRackOutBtnRowspan = null,
    Object? locCd = null,
    Object? btnHeight = null,
    Object? pickQtyRowspan = null,
    Object? pitmNmRowspan = null,
    Object? rackOutBtnRowspan = null,
    Object? cbxSeq = null,
    Object? itemCd = null,
    Object? pitmCd = null,
    Object? locCdRowspan = null,
    Object? pickSeq = null,
    Object? plant = null,
    Object? othRackOutBtnVisible = null,
    Object? pickNoRowspan = null,
    Object? mstKey = null,
    Object? cbxNo = null,
  }) {
    return _then(_value.copyWith(
      pickRank: null == pickRank
          ? _value.pickRank
          : pickRank // ignore: cast_nullable_to_non_nullable
              as int,
      pickOrdQtyRowspan: null == pickOrdQtyRowspan
          ? _value.pickOrdQtyRowspan
          : pickOrdQtyRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      rackOutBtn: null == rackOutBtn
          ? _value.rackOutBtn
          : rackOutBtn // ignore: cast_nullable_to_non_nullable
              as String,
      pjtNm: null == pjtNm
          ? _value.pjtNm
          : pjtNm // ignore: cast_nullable_to_non_nullable
              as String,
      grpKey: null == grpKey
          ? _value.grpKey
          : grpKey // ignore: cast_nullable_to_non_nullable
              as String,
      soNo: null == soNo
          ? _value.soNo
          : soNo // ignore: cast_nullable_to_non_nullable
              as String,
      pitmNm: null == pitmNm
          ? _value.pitmNm
          : pitmNm // ignore: cast_nullable_to_non_nullable
              as String,
      itemNm: null == itemNm
          ? _value.itemNm
          : itemNm // ignore: cast_nullable_to_non_nullable
              as String,
      pickOrdQty: null == pickOrdQty
          ? _value.pickOrdQty
          : pickOrdQty // ignore: cast_nullable_to_non_nullable
              as int,
      pitmCdRowspan: null == pitmCdRowspan
          ? _value.pitmCdRowspan
          : pitmCdRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      wrkNo: null == wrkNo
          ? _value.wrkNo
          : wrkNo // ignore: cast_nullable_to_non_nullable
              as String,
      wrkNoRowspan: null == wrkNoRowspan
          ? _value.wrkNoRowspan
          : wrkNoRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      pickNo: null == pickNo
          ? _value.pickNo
          : pickNo // ignore: cast_nullable_to_non_nullable
              as String,
      othRackOutBtn: null == othRackOutBtn
          ? _value.othRackOutBtn
          : othRackOutBtn // ignore: cast_nullable_to_non_nullable
              as String,
      soNoRowspan: null == soNoRowspan
          ? _value.soNoRowspan
          : soNoRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      pjtNmRowspan: null == pjtNmRowspan
          ? _value.pjtNmRowspan
          : pjtNmRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
      pickQty: null == pickQty
          ? _value.pickQty
          : pickQty // ignore: cast_nullable_to_non_nullable
              as int,
      pickRankRowspan: null == pickRankRowspan
          ? _value.pickRankRowspan
          : pickRankRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      kYn: null == kYn
          ? _value.kYn
          : kYn // ignore: cast_nullable_to_non_nullable
              as String,
      othRackOutBtnRowspan: null == othRackOutBtnRowspan
          ? _value.othRackOutBtnRowspan
          : othRackOutBtnRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      locCd: null == locCd
          ? _value.locCd
          : locCd // ignore: cast_nullable_to_non_nullable
              as String,
      btnHeight: null == btnHeight
          ? _value.btnHeight
          : btnHeight // ignore: cast_nullable_to_non_nullable
              as int,
      pickQtyRowspan: null == pickQtyRowspan
          ? _value.pickQtyRowspan
          : pickQtyRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      pitmNmRowspan: null == pitmNmRowspan
          ? _value.pitmNmRowspan
          : pitmNmRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      rackOutBtnRowspan: null == rackOutBtnRowspan
          ? _value.rackOutBtnRowspan
          : rackOutBtnRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      cbxSeq: null == cbxSeq
          ? _value.cbxSeq
          : cbxSeq // ignore: cast_nullable_to_non_nullable
              as int,
      itemCd: null == itemCd
          ? _value.itemCd
          : itemCd // ignore: cast_nullable_to_non_nullable
              as String,
      pitmCd: null == pitmCd
          ? _value.pitmCd
          : pitmCd // ignore: cast_nullable_to_non_nullable
              as String,
      locCdRowspan: null == locCdRowspan
          ? _value.locCdRowspan
          : locCdRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      pickSeq: null == pickSeq
          ? _value.pickSeq
          : pickSeq // ignore: cast_nullable_to_non_nullable
              as int,
      plant: null == plant
          ? _value.plant
          : plant // ignore: cast_nullable_to_non_nullable
              as String,
      othRackOutBtnVisible: null == othRackOutBtnVisible
          ? _value.othRackOutBtnVisible
          : othRackOutBtnVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      pickNoRowspan: null == pickNoRowspan
          ? _value.pickNoRowspan
          : pickNoRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      mstKey: null == mstKey
          ? _value.mstKey
          : mstKey // ignore: cast_nullable_to_non_nullable
              as String,
      cbxNo: null == cbxNo
          ? _value.cbxNo
          : cbxNo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FreedomTableBodyCellImplCopyWith<$Res>
    implements $FreedomTableBodyCellCopyWith<$Res> {
  factory _$$FreedomTableBodyCellImplCopyWith(_$FreedomTableBodyCellImpl value,
          $Res Function(_$FreedomTableBodyCellImpl) then) =
      __$$FreedomTableBodyCellImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int pickRank,
      int pickOrdQtyRowspan,
      String rackOutBtn,
      String pjtNm,
      String grpKey,
      String soNo,
      String pitmNm,
      String itemNm,
      int pickOrdQty,
      int pitmCdRowspan,
      String wrkNo,
      int wrkNoRowspan,
      String pickNo,
      String othRackOutBtn,
      int soNoRowspan,
      int pjtNmRowspan,
      bool selected,
      int pickQty,
      int pickRankRowspan,
      String kYn,
      int othRackOutBtnRowspan,
      String locCd,
      int btnHeight,
      int pickQtyRowspan,
      int pitmNmRowspan,
      int rackOutBtnRowspan,
      int cbxSeq,
      String itemCd,
      String pitmCd,
      int locCdRowspan,
      int pickSeq,
      String plant,
      bool othRackOutBtnVisible,
      int pickNoRowspan,
      String mstKey,
      String cbxNo});
}

/// @nodoc
class __$$FreedomTableBodyCellImplCopyWithImpl<$Res>
    extends _$FreedomTableBodyCellCopyWithImpl<$Res, _$FreedomTableBodyCellImpl>
    implements _$$FreedomTableBodyCellImplCopyWith<$Res> {
  __$$FreedomTableBodyCellImplCopyWithImpl(_$FreedomTableBodyCellImpl _value,
      $Res Function(_$FreedomTableBodyCellImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pickRank = null,
    Object? pickOrdQtyRowspan = null,
    Object? rackOutBtn = null,
    Object? pjtNm = null,
    Object? grpKey = null,
    Object? soNo = null,
    Object? pitmNm = null,
    Object? itemNm = null,
    Object? pickOrdQty = null,
    Object? pitmCdRowspan = null,
    Object? wrkNo = null,
    Object? wrkNoRowspan = null,
    Object? pickNo = null,
    Object? othRackOutBtn = null,
    Object? soNoRowspan = null,
    Object? pjtNmRowspan = null,
    Object? selected = null,
    Object? pickQty = null,
    Object? pickRankRowspan = null,
    Object? kYn = null,
    Object? othRackOutBtnRowspan = null,
    Object? locCd = null,
    Object? btnHeight = null,
    Object? pickQtyRowspan = null,
    Object? pitmNmRowspan = null,
    Object? rackOutBtnRowspan = null,
    Object? cbxSeq = null,
    Object? itemCd = null,
    Object? pitmCd = null,
    Object? locCdRowspan = null,
    Object? pickSeq = null,
    Object? plant = null,
    Object? othRackOutBtnVisible = null,
    Object? pickNoRowspan = null,
    Object? mstKey = null,
    Object? cbxNo = null,
  }) {
    return _then(_$FreedomTableBodyCellImpl(
      pickRank: null == pickRank
          ? _value.pickRank
          : pickRank // ignore: cast_nullable_to_non_nullable
              as int,
      pickOrdQtyRowspan: null == pickOrdQtyRowspan
          ? _value.pickOrdQtyRowspan
          : pickOrdQtyRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      rackOutBtn: null == rackOutBtn
          ? _value.rackOutBtn
          : rackOutBtn // ignore: cast_nullable_to_non_nullable
              as String,
      pjtNm: null == pjtNm
          ? _value.pjtNm
          : pjtNm // ignore: cast_nullable_to_non_nullable
              as String,
      grpKey: null == grpKey
          ? _value.grpKey
          : grpKey // ignore: cast_nullable_to_non_nullable
              as String,
      soNo: null == soNo
          ? _value.soNo
          : soNo // ignore: cast_nullable_to_non_nullable
              as String,
      pitmNm: null == pitmNm
          ? _value.pitmNm
          : pitmNm // ignore: cast_nullable_to_non_nullable
              as String,
      itemNm: null == itemNm
          ? _value.itemNm
          : itemNm // ignore: cast_nullable_to_non_nullable
              as String,
      pickOrdQty: null == pickOrdQty
          ? _value.pickOrdQty
          : pickOrdQty // ignore: cast_nullable_to_non_nullable
              as int,
      pitmCdRowspan: null == pitmCdRowspan
          ? _value.pitmCdRowspan
          : pitmCdRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      wrkNo: null == wrkNo
          ? _value.wrkNo
          : wrkNo // ignore: cast_nullable_to_non_nullable
              as String,
      wrkNoRowspan: null == wrkNoRowspan
          ? _value.wrkNoRowspan
          : wrkNoRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      pickNo: null == pickNo
          ? _value.pickNo
          : pickNo // ignore: cast_nullable_to_non_nullable
              as String,
      othRackOutBtn: null == othRackOutBtn
          ? _value.othRackOutBtn
          : othRackOutBtn // ignore: cast_nullable_to_non_nullable
              as String,
      soNoRowspan: null == soNoRowspan
          ? _value.soNoRowspan
          : soNoRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      pjtNmRowspan: null == pjtNmRowspan
          ? _value.pjtNmRowspan
          : pjtNmRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
      pickQty: null == pickQty
          ? _value.pickQty
          : pickQty // ignore: cast_nullable_to_non_nullable
              as int,
      pickRankRowspan: null == pickRankRowspan
          ? _value.pickRankRowspan
          : pickRankRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      kYn: null == kYn
          ? _value.kYn
          : kYn // ignore: cast_nullable_to_non_nullable
              as String,
      othRackOutBtnRowspan: null == othRackOutBtnRowspan
          ? _value.othRackOutBtnRowspan
          : othRackOutBtnRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      locCd: null == locCd
          ? _value.locCd
          : locCd // ignore: cast_nullable_to_non_nullable
              as String,
      btnHeight: null == btnHeight
          ? _value.btnHeight
          : btnHeight // ignore: cast_nullable_to_non_nullable
              as int,
      pickQtyRowspan: null == pickQtyRowspan
          ? _value.pickQtyRowspan
          : pickQtyRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      pitmNmRowspan: null == pitmNmRowspan
          ? _value.pitmNmRowspan
          : pitmNmRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      rackOutBtnRowspan: null == rackOutBtnRowspan
          ? _value.rackOutBtnRowspan
          : rackOutBtnRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      cbxSeq: null == cbxSeq
          ? _value.cbxSeq
          : cbxSeq // ignore: cast_nullable_to_non_nullable
              as int,
      itemCd: null == itemCd
          ? _value.itemCd
          : itemCd // ignore: cast_nullable_to_non_nullable
              as String,
      pitmCd: null == pitmCd
          ? _value.pitmCd
          : pitmCd // ignore: cast_nullable_to_non_nullable
              as String,
      locCdRowspan: null == locCdRowspan
          ? _value.locCdRowspan
          : locCdRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      pickSeq: null == pickSeq
          ? _value.pickSeq
          : pickSeq // ignore: cast_nullable_to_non_nullable
              as int,
      plant: null == plant
          ? _value.plant
          : plant // ignore: cast_nullable_to_non_nullable
              as String,
      othRackOutBtnVisible: null == othRackOutBtnVisible
          ? _value.othRackOutBtnVisible
          : othRackOutBtnVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      pickNoRowspan: null == pickNoRowspan
          ? _value.pickNoRowspan
          : pickNoRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      mstKey: null == mstKey
          ? _value.mstKey
          : mstKey // ignore: cast_nullable_to_non_nullable
              as String,
      cbxNo: null == cbxNo
          ? _value.cbxNo
          : cbxNo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FreedomTableBodyCellImpl implements _FreedomTableBodyCell {
  const _$FreedomTableBodyCellImpl(
      {this.pickRank = 0,
      this.pickOrdQtyRowspan = 0,
      this.rackOutBtn = '',
      this.pjtNm = '',
      this.grpKey = '',
      this.soNo = '',
      this.pitmNm = '',
      this.itemNm = '',
      this.pickOrdQty = 0,
      this.pitmCdRowspan = 0,
      this.wrkNo = '',
      this.wrkNoRowspan = 0,
      this.pickNo = '',
      this.othRackOutBtn = '',
      this.soNoRowspan = 0,
      this.pjtNmRowspan = 0,
      this.selected = false,
      this.pickQty = 0,
      this.pickRankRowspan = 0,
      this.kYn = '',
      this.othRackOutBtnRowspan = 0,
      this.locCd = '',
      this.btnHeight = 0,
      this.pickQtyRowspan = 0,
      this.pitmNmRowspan = 0,
      this.rackOutBtnRowspan = 0,
      this.cbxSeq = 0,
      this.itemCd = '',
      this.pitmCd = '',
      this.locCdRowspan = 0,
      this.pickSeq = 0,
      this.plant = '',
      this.othRackOutBtnVisible = false,
      this.pickNoRowspan = 0,
      this.mstKey = '',
      this.cbxNo = ''});

  factory _$FreedomTableBodyCellImpl.fromJson(Map<String, dynamic> json) =>
      _$$FreedomTableBodyCellImplFromJson(json);

  @override
  @JsonKey()
  final int pickRank;
  @override
  @JsonKey()
  final int pickOrdQtyRowspan;
  @override
  @JsonKey()
  final String rackOutBtn;
  @override
  @JsonKey()
  final String pjtNm;
  @override
  @JsonKey()
  final String grpKey;
  @override
  @JsonKey()
  final String soNo;
  @override
  @JsonKey()
  final String pitmNm;
  @override
  @JsonKey()
  final String itemNm;
  @override
  @JsonKey()
  final int pickOrdQty;
  @override
  @JsonKey()
  final int pitmCdRowspan;
  @override
  @JsonKey()
  final String wrkNo;
  @override
  @JsonKey()
  final int wrkNoRowspan;
  @override
  @JsonKey()
  final String pickNo;
  @override
  @JsonKey()
  final String othRackOutBtn;
  @override
  @JsonKey()
  final int soNoRowspan;
  @override
  @JsonKey()
  final int pjtNmRowspan;
  @override
  @JsonKey()
  final bool selected;
  @override
  @JsonKey()
  final int pickQty;
  @override
  @JsonKey()
  final int pickRankRowspan;
  @override
  @JsonKey()
  final String kYn;
  @override
  @JsonKey()
  final int othRackOutBtnRowspan;
  @override
  @JsonKey()
  final String locCd;
  @override
  @JsonKey()
  final int btnHeight;
  @override
  @JsonKey()
  final int pickQtyRowspan;
  @override
  @JsonKey()
  final int pitmNmRowspan;
  @override
  @JsonKey()
  final int rackOutBtnRowspan;
  @override
  @JsonKey()
  final int cbxSeq;
  @override
  @JsonKey()
  final String itemCd;
  @override
  @JsonKey()
  final String pitmCd;
  @override
  @JsonKey()
  final int locCdRowspan;
  @override
  @JsonKey()
  final int pickSeq;
  @override
  @JsonKey()
  final String plant;
  @override
  @JsonKey()
  final bool othRackOutBtnVisible;
  @override
  @JsonKey()
  final int pickNoRowspan;
  @override
  @JsonKey()
  final String mstKey;
  @override
  @JsonKey()
  final String cbxNo;

  @override
  String toString() {
    return 'FreedomTableBodyCell(pickRank: $pickRank, pickOrdQtyRowspan: $pickOrdQtyRowspan, rackOutBtn: $rackOutBtn, pjtNm: $pjtNm, grpKey: $grpKey, soNo: $soNo, pitmNm: $pitmNm, itemNm: $itemNm, pickOrdQty: $pickOrdQty, pitmCdRowspan: $pitmCdRowspan, wrkNo: $wrkNo, wrkNoRowspan: $wrkNoRowspan, pickNo: $pickNo, othRackOutBtn: $othRackOutBtn, soNoRowspan: $soNoRowspan, pjtNmRowspan: $pjtNmRowspan, selected: $selected, pickQty: $pickQty, pickRankRowspan: $pickRankRowspan, kYn: $kYn, othRackOutBtnRowspan: $othRackOutBtnRowspan, locCd: $locCd, btnHeight: $btnHeight, pickQtyRowspan: $pickQtyRowspan, pitmNmRowspan: $pitmNmRowspan, rackOutBtnRowspan: $rackOutBtnRowspan, cbxSeq: $cbxSeq, itemCd: $itemCd, pitmCd: $pitmCd, locCdRowspan: $locCdRowspan, pickSeq: $pickSeq, plant: $plant, othRackOutBtnVisible: $othRackOutBtnVisible, pickNoRowspan: $pickNoRowspan, mstKey: $mstKey, cbxNo: $cbxNo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FreedomTableBodyCellImpl &&
            (identical(other.pickRank, pickRank) ||
                other.pickRank == pickRank) &&
            (identical(other.pickOrdQtyRowspan, pickOrdQtyRowspan) ||
                other.pickOrdQtyRowspan == pickOrdQtyRowspan) &&
            (identical(other.rackOutBtn, rackOutBtn) ||
                other.rackOutBtn == rackOutBtn) &&
            (identical(other.pjtNm, pjtNm) || other.pjtNm == pjtNm) &&
            (identical(other.grpKey, grpKey) || other.grpKey == grpKey) &&
            (identical(other.soNo, soNo) || other.soNo == soNo) &&
            (identical(other.pitmNm, pitmNm) || other.pitmNm == pitmNm) &&
            (identical(other.itemNm, itemNm) || other.itemNm == itemNm) &&
            (identical(other.pickOrdQty, pickOrdQty) ||
                other.pickOrdQty == pickOrdQty) &&
            (identical(other.pitmCdRowspan, pitmCdRowspan) ||
                other.pitmCdRowspan == pitmCdRowspan) &&
            (identical(other.wrkNo, wrkNo) || other.wrkNo == wrkNo) &&
            (identical(other.wrkNoRowspan, wrkNoRowspan) ||
                other.wrkNoRowspan == wrkNoRowspan) &&
            (identical(other.pickNo, pickNo) || other.pickNo == pickNo) &&
            (identical(other.othRackOutBtn, othRackOutBtn) ||
                other.othRackOutBtn == othRackOutBtn) &&
            (identical(other.soNoRowspan, soNoRowspan) ||
                other.soNoRowspan == soNoRowspan) &&
            (identical(other.pjtNmRowspan, pjtNmRowspan) ||
                other.pjtNmRowspan == pjtNmRowspan) &&
            (identical(other.selected, selected) ||
                other.selected == selected) &&
            (identical(other.pickQty, pickQty) || other.pickQty == pickQty) &&
            (identical(other.pickRankRowspan, pickRankRowspan) ||
                other.pickRankRowspan == pickRankRowspan) &&
            (identical(other.kYn, kYn) || other.kYn == kYn) &&
            (identical(other.othRackOutBtnRowspan, othRackOutBtnRowspan) ||
                other.othRackOutBtnRowspan == othRackOutBtnRowspan) &&
            (identical(other.locCd, locCd) || other.locCd == locCd) &&
            (identical(other.btnHeight, btnHeight) ||
                other.btnHeight == btnHeight) &&
            (identical(other.pickQtyRowspan, pickQtyRowspan) ||
                other.pickQtyRowspan == pickQtyRowspan) &&
            (identical(other.pitmNmRowspan, pitmNmRowspan) ||
                other.pitmNmRowspan == pitmNmRowspan) &&
            (identical(other.rackOutBtnRowspan, rackOutBtnRowspan) ||
                other.rackOutBtnRowspan == rackOutBtnRowspan) &&
            (identical(other.cbxSeq, cbxSeq) || other.cbxSeq == cbxSeq) &&
            (identical(other.itemCd, itemCd) || other.itemCd == itemCd) &&
            (identical(other.pitmCd, pitmCd) || other.pitmCd == pitmCd) &&
            (identical(other.locCdRowspan, locCdRowspan) ||
                other.locCdRowspan == locCdRowspan) &&
            (identical(other.pickSeq, pickSeq) || other.pickSeq == pickSeq) &&
            (identical(other.plant, plant) || other.plant == plant) &&
            (identical(other.othRackOutBtnVisible, othRackOutBtnVisible) ||
                other.othRackOutBtnVisible == othRackOutBtnVisible) &&
            (identical(other.pickNoRowspan, pickNoRowspan) ||
                other.pickNoRowspan == pickNoRowspan) &&
            (identical(other.mstKey, mstKey) || other.mstKey == mstKey) &&
            (identical(other.cbxNo, cbxNo) || other.cbxNo == cbxNo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        pickRank,
        pickOrdQtyRowspan,
        rackOutBtn,
        pjtNm,
        grpKey,
        soNo,
        pitmNm,
        itemNm,
        pickOrdQty,
        pitmCdRowspan,
        wrkNo,
        wrkNoRowspan,
        pickNo,
        othRackOutBtn,
        soNoRowspan,
        pjtNmRowspan,
        selected,
        pickQty,
        pickRankRowspan,
        kYn,
        othRackOutBtnRowspan,
        locCd,
        btnHeight,
        pickQtyRowspan,
        pitmNmRowspan,
        rackOutBtnRowspan,
        cbxSeq,
        itemCd,
        pitmCd,
        locCdRowspan,
        pickSeq,
        plant,
        othRackOutBtnVisible,
        pickNoRowspan,
        mstKey,
        cbxNo
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FreedomTableBodyCellImplCopyWith<_$FreedomTableBodyCellImpl>
      get copyWith =>
          __$$FreedomTableBodyCellImplCopyWithImpl<_$FreedomTableBodyCellImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FreedomTableBodyCellImplToJson(
      this,
    );
  }
}

abstract class _FreedomTableBodyCell implements FreedomTableBodyCell {
  const factory _FreedomTableBodyCell(
      {final int pickRank,
      final int pickOrdQtyRowspan,
      final String rackOutBtn,
      final String pjtNm,
      final String grpKey,
      final String soNo,
      final String pitmNm,
      final String itemNm,
      final int pickOrdQty,
      final int pitmCdRowspan,
      final String wrkNo,
      final int wrkNoRowspan,
      final String pickNo,
      final String othRackOutBtn,
      final int soNoRowspan,
      final int pjtNmRowspan,
      final bool selected,
      final int pickQty,
      final int pickRankRowspan,
      final String kYn,
      final int othRackOutBtnRowspan,
      final String locCd,
      final int btnHeight,
      final int pickQtyRowspan,
      final int pitmNmRowspan,
      final int rackOutBtnRowspan,
      final int cbxSeq,
      final String itemCd,
      final String pitmCd,
      final int locCdRowspan,
      final int pickSeq,
      final String plant,
      final bool othRackOutBtnVisible,
      final int pickNoRowspan,
      final String mstKey,
      final String cbxNo}) = _$FreedomTableBodyCellImpl;

  factory _FreedomTableBodyCell.fromJson(Map<String, dynamic> json) =
      _$FreedomTableBodyCellImpl.fromJson;

  @override
  int get pickRank;
  @override
  int get pickOrdQtyRowspan;
  @override
  String get rackOutBtn;
  @override
  String get pjtNm;
  @override
  String get grpKey;
  @override
  String get soNo;
  @override
  String get pitmNm;
  @override
  String get itemNm;
  @override
  int get pickOrdQty;
  @override
  int get pitmCdRowspan;
  @override
  String get wrkNo;
  @override
  int get wrkNoRowspan;
  @override
  String get pickNo;
  @override
  String get othRackOutBtn;
  @override
  int get soNoRowspan;
  @override
  int get pjtNmRowspan;
  @override
  bool get selected;
  @override
  int get pickQty;
  @override
  int get pickRankRowspan;
  @override
  String get kYn;
  @override
  int get othRackOutBtnRowspan;
  @override
  String get locCd;
  @override
  int get btnHeight;
  @override
  int get pickQtyRowspan;
  @override
  int get pitmNmRowspan;
  @override
  int get rackOutBtnRowspan;
  @override
  int get cbxSeq;
  @override
  String get itemCd;
  @override
  String get pitmCd;
  @override
  int get locCdRowspan;
  @override
  int get pickSeq;
  @override
  String get plant;
  @override
  bool get othRackOutBtnVisible;
  @override
  int get pickNoRowspan;
  @override
  String get mstKey;
  @override
  String get cbxNo;
  @override
  @JsonKey(ignore: true)
  _$$FreedomTableBodyCellImplCopyWith<_$FreedomTableBodyCellImpl>
      get copyWith => throw _privateConstructorUsedError;
}
