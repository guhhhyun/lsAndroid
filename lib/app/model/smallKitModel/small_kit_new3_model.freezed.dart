// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'small_kit_new3_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SmallKitNew3Model _$SmallKitNew3ModelFromJson(Map<String, dynamic> json) {
  return _SmallKitNew3Model.fromJson(json);
}

/// @nodoc
mixin _$SmallKitNew3Model {
  Header? get header => throw _privateConstructorUsedError;
  String get resultCode => throw _privateConstructorUsedError;
  String get resultMessage => throw _privateConstructorUsedError;
  List<dynamic>? get body => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SmallKitNew3ModelCopyWith<SmallKitNew3Model> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SmallKitNew3ModelCopyWith<$Res> {
  factory $SmallKitNew3ModelCopyWith(
          SmallKitNew3Model value, $Res Function(SmallKitNew3Model) then) =
      _$SmallKitNew3ModelCopyWithImpl<$Res, SmallKitNew3Model>;
  @useResult
  $Res call(
      {Header? header,
      String resultCode,
      String resultMessage,
      List<dynamic>? body});

  $HeaderCopyWith<$Res>? get header;
}

/// @nodoc
class _$SmallKitNew3ModelCopyWithImpl<$Res, $Val extends SmallKitNew3Model>
    implements $SmallKitNew3ModelCopyWith<$Res> {
  _$SmallKitNew3ModelCopyWithImpl(this._value, this._then);

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
abstract class _$$SmallKitNew3ModelImplCopyWith<$Res>
    implements $SmallKitNew3ModelCopyWith<$Res> {
  factory _$$SmallKitNew3ModelImplCopyWith(_$SmallKitNew3ModelImpl value,
          $Res Function(_$SmallKitNew3ModelImpl) then) =
      __$$SmallKitNew3ModelImplCopyWithImpl<$Res>;
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
class __$$SmallKitNew3ModelImplCopyWithImpl<$Res>
    extends _$SmallKitNew3ModelCopyWithImpl<$Res, _$SmallKitNew3ModelImpl>
    implements _$$SmallKitNew3ModelImplCopyWith<$Res> {
  __$$SmallKitNew3ModelImplCopyWithImpl(_$SmallKitNew3ModelImpl _value,
      $Res Function(_$SmallKitNew3ModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? header = freezed,
    Object? resultCode = null,
    Object? resultMessage = null,
    Object? body = freezed,
  }) {
    return _then(_$SmallKitNew3ModelImpl(
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
class _$SmallKitNew3ModelImpl implements _SmallKitNew3Model {
  const _$SmallKitNew3ModelImpl(
      {this.header,
      this.resultCode = '',
      this.resultMessage = '',
      final List<dynamic>? body})
      : _body = body;

  factory _$SmallKitNew3ModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SmallKitNew3ModelImplFromJson(json);

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
    return 'SmallKitNew3Model(header: $header, resultCode: $resultCode, resultMessage: $resultMessage, body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SmallKitNew3ModelImpl &&
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
  _$$SmallKitNew3ModelImplCopyWith<_$SmallKitNew3ModelImpl> get copyWith =>
      __$$SmallKitNew3ModelImplCopyWithImpl<_$SmallKitNew3ModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SmallKitNew3ModelImplToJson(
      this,
    );
  }
}

abstract class _SmallKitNew3Model implements SmallKitNew3Model {
  const factory _SmallKitNew3Model(
      {final Header? header,
      final String resultCode,
      final String resultMessage,
      final List<dynamic>? body}) = _$SmallKitNew3ModelImpl;

  factory _SmallKitNew3Model.fromJson(Map<String, dynamic> json) =
      _$SmallKitNew3ModelImpl.fromJson;

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
  _$$SmallKitNew3ModelImplCopyWith<_$SmallKitNew3ModelImpl> get copyWith =>
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

BodyItem _$BodyItemFromJson(Map<String, dynamic> json) {
  return _BodyItem.fromJson(json);
}

/// @nodoc
mixin _$BodyItem {
  bool get resultValue => throw _privateConstructorUsedError;
  int get resultRowCount => throw _privateConstructorUsedError;
  String get resultCode => throw _privateConstructorUsedError;
  dynamic get resultMessage => throw _privateConstructorUsedError;
  dynamic get errorState => throw _privateConstructorUsedError;
  dynamic get errorProcedure => throw _privateConstructorUsedError;
  dynamic get returnMessage => throw _privateConstructorUsedError;

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
      dynamic resultMessage,
      dynamic errorState,
      dynamic errorProcedure,
      dynamic returnMessage});
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
    Object? resultMessage = freezed,
    Object? errorState = freezed,
    Object? errorProcedure = freezed,
    Object? returnMessage = freezed,
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
      resultMessage: freezed == resultMessage
          ? _value.resultMessage
          : resultMessage // ignore: cast_nullable_to_non_nullable
              as dynamic,
      errorState: freezed == errorState
          ? _value.errorState
          : errorState // ignore: cast_nullable_to_non_nullable
              as dynamic,
      errorProcedure: freezed == errorProcedure
          ? _value.errorProcedure
          : errorProcedure // ignore: cast_nullable_to_non_nullable
              as dynamic,
      returnMessage: freezed == returnMessage
          ? _value.returnMessage
          : returnMessage // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
      dynamic resultMessage,
      dynamic errorState,
      dynamic errorProcedure,
      dynamic returnMessage});
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
    Object? resultMessage = freezed,
    Object? errorState = freezed,
    Object? errorProcedure = freezed,
    Object? returnMessage = freezed,
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
      resultMessage:
          freezed == resultMessage ? _value.resultMessage! : resultMessage,
      errorState: freezed == errorState ? _value.errorState! : errorState,
      errorProcedure:
          freezed == errorProcedure ? _value.errorProcedure! : errorProcedure,
      returnMessage:
          freezed == returnMessage ? _value.returnMessage! : returnMessage,
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
  final dynamic resultMessage;
  @override
  @JsonKey()
  final dynamic errorState;
  @override
  @JsonKey()
  final dynamic errorProcedure;
  @override
  @JsonKey()
  final dynamic returnMessage;

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
            const DeepCollectionEquality()
                .equals(other.resultMessage, resultMessage) &&
            const DeepCollectionEquality()
                .equals(other.errorState, errorState) &&
            const DeepCollectionEquality()
                .equals(other.errorProcedure, errorProcedure) &&
            const DeepCollectionEquality()
                .equals(other.returnMessage, returnMessage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      resultValue,
      resultRowCount,
      resultCode,
      const DeepCollectionEquality().hash(resultMessage),
      const DeepCollectionEquality().hash(errorState),
      const DeepCollectionEquality().hash(errorProcedure),
      const DeepCollectionEquality().hash(returnMessage));

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
      final dynamic resultMessage,
      final dynamic errorState,
      final dynamic errorProcedure,
      final dynamic returnMessage}) = _$BodyItemImpl;

  factory _BodyItem.fromJson(Map<String, dynamic> json) =
      _$BodyItemImpl.fromJson;

  @override
  bool get resultValue;
  @override
  int get resultRowCount;
  @override
  String get resultCode;
  @override
  dynamic get resultMessage;
  @override
  dynamic get errorState;
  @override
  dynamic get errorProcedure;
  @override
  dynamic get returnMessage;
  @override
  @JsonKey(ignore: true)
  _$$BodyItemImplCopyWith<_$BodyItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SubBodyItem _$SubBodyItemFromJson(Map<String, dynamic> json) {
  return _SubBodyItem.fromJson(json);
}

/// @nodoc
mixin _$SubBodyItem {
  String get scanNo => throw _privateConstructorUsedError;
  int get wrkSeq => throw _privateConstructorUsedError;
  String get qtyUnit => throw _privateConstructorUsedError;
  String get syncYn => throw _privateConstructorUsedError;
  String get itemCd => throw _privateConstructorUsedError;
  String get cbxSuNo => throw _privateConstructorUsedError;
  String get cbxSuSeq => throw _privateConstructorUsedError;
  String get itemNm => throw _privateConstructorUsedError;
  String get btn => throw _privateConstructorUsedError;
  int get wrkQty => throw _privateConstructorUsedError;
  String get ncbxRmk => throw _privateConstructorUsedError;
  String get vendNm => throw _privateConstructorUsedError;
  String get sboxNo => throw _privateConstructorUsedError;
  double get bomQty => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubBodyItemCopyWith<SubBodyItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubBodyItemCopyWith<$Res> {
  factory $SubBodyItemCopyWith(
          SubBodyItem value, $Res Function(SubBodyItem) then) =
      _$SubBodyItemCopyWithImpl<$Res, SubBodyItem>;
  @useResult
  $Res call(
      {String scanNo,
      int wrkSeq,
      String qtyUnit,
      String syncYn,
      String itemCd,
      String cbxSuNo,
      String cbxSuSeq,
      String itemNm,
      String btn,
      int wrkQty,
      String ncbxRmk,
      String vendNm,
      String sboxNo,
      double bomQty});
}

/// @nodoc
class _$SubBodyItemCopyWithImpl<$Res, $Val extends SubBodyItem>
    implements $SubBodyItemCopyWith<$Res> {
  _$SubBodyItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scanNo = null,
    Object? wrkSeq = null,
    Object? qtyUnit = null,
    Object? syncYn = null,
    Object? itemCd = null,
    Object? cbxSuNo = null,
    Object? cbxSuSeq = null,
    Object? itemNm = null,
    Object? btn = null,
    Object? wrkQty = null,
    Object? ncbxRmk = null,
    Object? vendNm = null,
    Object? sboxNo = null,
    Object? bomQty = null,
  }) {
    return _then(_value.copyWith(
      scanNo: null == scanNo
          ? _value.scanNo
          : scanNo // ignore: cast_nullable_to_non_nullable
              as String,
      wrkSeq: null == wrkSeq
          ? _value.wrkSeq
          : wrkSeq // ignore: cast_nullable_to_non_nullable
              as int,
      qtyUnit: null == qtyUnit
          ? _value.qtyUnit
          : qtyUnit // ignore: cast_nullable_to_non_nullable
              as String,
      syncYn: null == syncYn
          ? _value.syncYn
          : syncYn // ignore: cast_nullable_to_non_nullable
              as String,
      itemCd: null == itemCd
          ? _value.itemCd
          : itemCd // ignore: cast_nullable_to_non_nullable
              as String,
      cbxSuNo: null == cbxSuNo
          ? _value.cbxSuNo
          : cbxSuNo // ignore: cast_nullable_to_non_nullable
              as String,
      cbxSuSeq: null == cbxSuSeq
          ? _value.cbxSuSeq
          : cbxSuSeq // ignore: cast_nullable_to_non_nullable
              as String,
      itemNm: null == itemNm
          ? _value.itemNm
          : itemNm // ignore: cast_nullable_to_non_nullable
              as String,
      btn: null == btn
          ? _value.btn
          : btn // ignore: cast_nullable_to_non_nullable
              as String,
      wrkQty: null == wrkQty
          ? _value.wrkQty
          : wrkQty // ignore: cast_nullable_to_non_nullable
              as int,
      ncbxRmk: null == ncbxRmk
          ? _value.ncbxRmk
          : ncbxRmk // ignore: cast_nullable_to_non_nullable
              as String,
      vendNm: null == vendNm
          ? _value.vendNm
          : vendNm // ignore: cast_nullable_to_non_nullable
              as String,
      sboxNo: null == sboxNo
          ? _value.sboxNo
          : sboxNo // ignore: cast_nullable_to_non_nullable
              as String,
      bomQty: null == bomQty
          ? _value.bomQty
          : bomQty // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubBodyItemImplCopyWith<$Res>
    implements $SubBodyItemCopyWith<$Res> {
  factory _$$SubBodyItemImplCopyWith(
          _$SubBodyItemImpl value, $Res Function(_$SubBodyItemImpl) then) =
      __$$SubBodyItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String scanNo,
      int wrkSeq,
      String qtyUnit,
      String syncYn,
      String itemCd,
      String cbxSuNo,
      String cbxSuSeq,
      String itemNm,
      String btn,
      int wrkQty,
      String ncbxRmk,
      String vendNm,
      String sboxNo,
      double bomQty});
}

/// @nodoc
class __$$SubBodyItemImplCopyWithImpl<$Res>
    extends _$SubBodyItemCopyWithImpl<$Res, _$SubBodyItemImpl>
    implements _$$SubBodyItemImplCopyWith<$Res> {
  __$$SubBodyItemImplCopyWithImpl(
      _$SubBodyItemImpl _value, $Res Function(_$SubBodyItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scanNo = null,
    Object? wrkSeq = null,
    Object? qtyUnit = null,
    Object? syncYn = null,
    Object? itemCd = null,
    Object? cbxSuNo = null,
    Object? cbxSuSeq = null,
    Object? itemNm = null,
    Object? btn = null,
    Object? wrkQty = null,
    Object? ncbxRmk = null,
    Object? vendNm = null,
    Object? sboxNo = null,
    Object? bomQty = null,
  }) {
    return _then(_$SubBodyItemImpl(
      scanNo: null == scanNo
          ? _value.scanNo
          : scanNo // ignore: cast_nullable_to_non_nullable
              as String,
      wrkSeq: null == wrkSeq
          ? _value.wrkSeq
          : wrkSeq // ignore: cast_nullable_to_non_nullable
              as int,
      qtyUnit: null == qtyUnit
          ? _value.qtyUnit
          : qtyUnit // ignore: cast_nullable_to_non_nullable
              as String,
      syncYn: null == syncYn
          ? _value.syncYn
          : syncYn // ignore: cast_nullable_to_non_nullable
              as String,
      itemCd: null == itemCd
          ? _value.itemCd
          : itemCd // ignore: cast_nullable_to_non_nullable
              as String,
      cbxSuNo: null == cbxSuNo
          ? _value.cbxSuNo
          : cbxSuNo // ignore: cast_nullable_to_non_nullable
              as String,
      cbxSuSeq: null == cbxSuSeq
          ? _value.cbxSuSeq
          : cbxSuSeq // ignore: cast_nullable_to_non_nullable
              as String,
      itemNm: null == itemNm
          ? _value.itemNm
          : itemNm // ignore: cast_nullable_to_non_nullable
              as String,
      btn: null == btn
          ? _value.btn
          : btn // ignore: cast_nullable_to_non_nullable
              as String,
      wrkQty: null == wrkQty
          ? _value.wrkQty
          : wrkQty // ignore: cast_nullable_to_non_nullable
              as int,
      ncbxRmk: null == ncbxRmk
          ? _value.ncbxRmk
          : ncbxRmk // ignore: cast_nullable_to_non_nullable
              as String,
      vendNm: null == vendNm
          ? _value.vendNm
          : vendNm // ignore: cast_nullable_to_non_nullable
              as String,
      sboxNo: null == sboxNo
          ? _value.sboxNo
          : sboxNo // ignore: cast_nullable_to_non_nullable
              as String,
      bomQty: null == bomQty
          ? _value.bomQty
          : bomQty // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubBodyItemImpl implements _SubBodyItem {
  const _$SubBodyItemImpl(
      {this.scanNo = '',
      this.wrkSeq = 0,
      this.qtyUnit = '',
      this.syncYn = '',
      this.itemCd = '',
      this.cbxSuNo = '',
      this.cbxSuSeq = '',
      this.itemNm = '',
      this.btn = '',
      this.wrkQty = 0,
      this.ncbxRmk = '',
      this.vendNm = '',
      this.sboxNo = '',
      this.bomQty = 0.0});

  factory _$SubBodyItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubBodyItemImplFromJson(json);

  @override
  @JsonKey()
  final String scanNo;
  @override
  @JsonKey()
  final int wrkSeq;
  @override
  @JsonKey()
  final String qtyUnit;
  @override
  @JsonKey()
  final String syncYn;
  @override
  @JsonKey()
  final String itemCd;
  @override
  @JsonKey()
  final String cbxSuNo;
  @override
  @JsonKey()
  final String cbxSuSeq;
  @override
  @JsonKey()
  final String itemNm;
  @override
  @JsonKey()
  final String btn;
  @override
  @JsonKey()
  final int wrkQty;
  @override
  @JsonKey()
  final String ncbxRmk;
  @override
  @JsonKey()
  final String vendNm;
  @override
  @JsonKey()
  final String sboxNo;
  @override
  @JsonKey()
  final double bomQty;

  @override
  String toString() {
    return 'SubBodyItem(scanNo: $scanNo, wrkSeq: $wrkSeq, qtyUnit: $qtyUnit, syncYn: $syncYn, itemCd: $itemCd, cbxSuNo: $cbxSuNo, cbxSuSeq: $cbxSuSeq, itemNm: $itemNm, btn: $btn, wrkQty: $wrkQty, ncbxRmk: $ncbxRmk, vendNm: $vendNm, sboxNo: $sboxNo, bomQty: $bomQty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubBodyItemImpl &&
            (identical(other.scanNo, scanNo) || other.scanNo == scanNo) &&
            (identical(other.wrkSeq, wrkSeq) || other.wrkSeq == wrkSeq) &&
            (identical(other.qtyUnit, qtyUnit) || other.qtyUnit == qtyUnit) &&
            (identical(other.syncYn, syncYn) || other.syncYn == syncYn) &&
            (identical(other.itemCd, itemCd) || other.itemCd == itemCd) &&
            (identical(other.cbxSuNo, cbxSuNo) || other.cbxSuNo == cbxSuNo) &&
            (identical(other.cbxSuSeq, cbxSuSeq) ||
                other.cbxSuSeq == cbxSuSeq) &&
            (identical(other.itemNm, itemNm) || other.itemNm == itemNm) &&
            (identical(other.btn, btn) || other.btn == btn) &&
            (identical(other.wrkQty, wrkQty) || other.wrkQty == wrkQty) &&
            (identical(other.ncbxRmk, ncbxRmk) || other.ncbxRmk == ncbxRmk) &&
            (identical(other.vendNm, vendNm) || other.vendNm == vendNm) &&
            (identical(other.sboxNo, sboxNo) || other.sboxNo == sboxNo) &&
            (identical(other.bomQty, bomQty) || other.bomQty == bomQty));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      scanNo,
      wrkSeq,
      qtyUnit,
      syncYn,
      itemCd,
      cbxSuNo,
      cbxSuSeq,
      itemNm,
      btn,
      wrkQty,
      ncbxRmk,
      vendNm,
      sboxNo,
      bomQty);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubBodyItemImplCopyWith<_$SubBodyItemImpl> get copyWith =>
      __$$SubBodyItemImplCopyWithImpl<_$SubBodyItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubBodyItemImplToJson(
      this,
    );
  }
}

abstract class _SubBodyItem implements SubBodyItem {
  const factory _SubBodyItem(
      {final String scanNo,
      final int wrkSeq,
      final String qtyUnit,
      final String syncYn,
      final String itemCd,
      final String cbxSuNo,
      final String cbxSuSeq,
      final String itemNm,
      final String btn,
      final int wrkQty,
      final String ncbxRmk,
      final String vendNm,
      final String sboxNo,
      final double bomQty}) = _$SubBodyItemImpl;

  factory _SubBodyItem.fromJson(Map<String, dynamic> json) =
      _$SubBodyItemImpl.fromJson;

  @override
  String get scanNo;
  @override
  int get wrkSeq;
  @override
  String get qtyUnit;
  @override
  String get syncYn;
  @override
  String get itemCd;
  @override
  String get cbxSuNo;
  @override
  String get cbxSuSeq;
  @override
  String get itemNm;
  @override
  String get btn;
  @override
  int get wrkQty;
  @override
  String get ncbxRmk;
  @override
  String get vendNm;
  @override
  String get sboxNo;
  @override
  double get bomQty;
  @override
  @JsonKey(ignore: true)
  _$$SubBodyItemImplCopyWith<_$SubBodyItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
