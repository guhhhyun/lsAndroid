// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chul_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChulModel _$ChulModelFromJson(Map<String, dynamic> json) {
  return _ChulModel.fromJson(json);
}

/// @nodoc
mixin _$ChulModel {
  Header? get header => throw _privateConstructorUsedError;
  String get resultCode => throw _privateConstructorUsedError;
  String get resultMessage => throw _privateConstructorUsedError;
  List<dynamic>? get body => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChulModelCopyWith<ChulModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChulModelCopyWith<$Res> {
  factory $ChulModelCopyWith(ChulModel value, $Res Function(ChulModel) then) =
      _$ChulModelCopyWithImpl<$Res, ChulModel>;
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
class _$ChulModelCopyWithImpl<$Res, $Val extends ChulModel>
    implements $ChulModelCopyWith<$Res> {
  _$ChulModelCopyWithImpl(this._value, this._then);

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
abstract class _$$ChulModelImplCopyWith<$Res>
    implements $ChulModelCopyWith<$Res> {
  factory _$$ChulModelImplCopyWith(
          _$ChulModelImpl value, $Res Function(_$ChulModelImpl) then) =
      __$$ChulModelImplCopyWithImpl<$Res>;
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
class __$$ChulModelImplCopyWithImpl<$Res>
    extends _$ChulModelCopyWithImpl<$Res, _$ChulModelImpl>
    implements _$$ChulModelImplCopyWith<$Res> {
  __$$ChulModelImplCopyWithImpl(
      _$ChulModelImpl _value, $Res Function(_$ChulModelImpl) _then)
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
    return _then(_$ChulModelImpl(
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
class _$ChulModelImpl implements _ChulModel {
  const _$ChulModelImpl(
      {this.header,
      this.resultCode = '',
      this.resultMessage = '',
      final List<dynamic>? body,
      this.hasError = false})
      : _body = body;

  factory _$ChulModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChulModelImplFromJson(json);

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
    return 'ChulModel(header: $header, resultCode: $resultCode, resultMessage: $resultMessage, body: $body, hasError: $hasError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChulModelImpl &&
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
  _$$ChulModelImplCopyWith<_$ChulModelImpl> get copyWith =>
      __$$ChulModelImplCopyWithImpl<_$ChulModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChulModelImplToJson(
      this,
    );
  }
}

abstract class _ChulModel implements ChulModel {
  const factory _ChulModel(
      {final Header? header,
      final String resultCode,
      final String resultMessage,
      final List<dynamic>? body,
      final bool hasError}) = _$ChulModelImpl;

  factory _ChulModel.fromJson(Map<String, dynamic> json) =
      _$ChulModelImpl.fromJson;

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
  _$$ChulModelImplCopyWith<_$ChulModelImpl> get copyWith =>
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

DetailItem _$DetailItemFromJson(Map<String, dynamic> json) {
  return _DetailItem.fromJson(json);
}

/// @nodoc
mixin _$DetailItem {
  String get pjtNm => throw _privateConstructorUsedError;
  String get soNo => throw _privateConstructorUsedError;
  String get bomChgSts => throw _privateConstructorUsedError;
  String get remark => throw _privateConstructorUsedError;
  String get otbNo => throw _privateConstructorUsedError;
  dynamic get delOrdTypeNm => throw _privateConstructorUsedError;
  String get otbPsbSts => throw _privateConstructorUsedError;
  String get delOrdNo => throw _privateConstructorUsedError;
  String get kitCfmSts => throw _privateConstructorUsedError;
  String get delPreDt => throw _privateConstructorUsedError;
  String get mstKey => throw _privateConstructorUsedError;
  String get delOrdType => throw _privateConstructorUsedError;
  bool get selected => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailItemCopyWith<DetailItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailItemCopyWith<$Res> {
  factory $DetailItemCopyWith(
          DetailItem value, $Res Function(DetailItem) then) =
      _$DetailItemCopyWithImpl<$Res, DetailItem>;
  @useResult
  $Res call(
      {String pjtNm,
      String soNo,
      String bomChgSts,
      String remark,
      String otbNo,
      dynamic delOrdTypeNm,
      String otbPsbSts,
      String delOrdNo,
      String kitCfmSts,
      String delPreDt,
      String mstKey,
      String delOrdType,
      bool selected});
}

/// @nodoc
class _$DetailItemCopyWithImpl<$Res, $Val extends DetailItem>
    implements $DetailItemCopyWith<$Res> {
  _$DetailItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pjtNm = null,
    Object? soNo = null,
    Object? bomChgSts = null,
    Object? remark = null,
    Object? otbNo = null,
    Object? delOrdTypeNm = freezed,
    Object? otbPsbSts = null,
    Object? delOrdNo = null,
    Object? kitCfmSts = null,
    Object? delPreDt = null,
    Object? mstKey = null,
    Object? delOrdType = null,
    Object? selected = null,
  }) {
    return _then(_value.copyWith(
      pjtNm: null == pjtNm
          ? _value.pjtNm
          : pjtNm // ignore: cast_nullable_to_non_nullable
              as String,
      soNo: null == soNo
          ? _value.soNo
          : soNo // ignore: cast_nullable_to_non_nullable
              as String,
      bomChgSts: null == bomChgSts
          ? _value.bomChgSts
          : bomChgSts // ignore: cast_nullable_to_non_nullable
              as String,
      remark: null == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
      otbNo: null == otbNo
          ? _value.otbNo
          : otbNo // ignore: cast_nullable_to_non_nullable
              as String,
      delOrdTypeNm: freezed == delOrdTypeNm
          ? _value.delOrdTypeNm
          : delOrdTypeNm // ignore: cast_nullable_to_non_nullable
              as dynamic,
      otbPsbSts: null == otbPsbSts
          ? _value.otbPsbSts
          : otbPsbSts // ignore: cast_nullable_to_non_nullable
              as String,
      delOrdNo: null == delOrdNo
          ? _value.delOrdNo
          : delOrdNo // ignore: cast_nullable_to_non_nullable
              as String,
      kitCfmSts: null == kitCfmSts
          ? _value.kitCfmSts
          : kitCfmSts // ignore: cast_nullable_to_non_nullable
              as String,
      delPreDt: null == delPreDt
          ? _value.delPreDt
          : delPreDt // ignore: cast_nullable_to_non_nullable
              as String,
      mstKey: null == mstKey
          ? _value.mstKey
          : mstKey // ignore: cast_nullable_to_non_nullable
              as String,
      delOrdType: null == delOrdType
          ? _value.delOrdType
          : delOrdType // ignore: cast_nullable_to_non_nullable
              as String,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailItemImplCopyWith<$Res>
    implements $DetailItemCopyWith<$Res> {
  factory _$$DetailItemImplCopyWith(
          _$DetailItemImpl value, $Res Function(_$DetailItemImpl) then) =
      __$$DetailItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String pjtNm,
      String soNo,
      String bomChgSts,
      String remark,
      String otbNo,
      dynamic delOrdTypeNm,
      String otbPsbSts,
      String delOrdNo,
      String kitCfmSts,
      String delPreDt,
      String mstKey,
      String delOrdType,
      bool selected});
}

/// @nodoc
class __$$DetailItemImplCopyWithImpl<$Res>
    extends _$DetailItemCopyWithImpl<$Res, _$DetailItemImpl>
    implements _$$DetailItemImplCopyWith<$Res> {
  __$$DetailItemImplCopyWithImpl(
      _$DetailItemImpl _value, $Res Function(_$DetailItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pjtNm = null,
    Object? soNo = null,
    Object? bomChgSts = null,
    Object? remark = null,
    Object? otbNo = null,
    Object? delOrdTypeNm = freezed,
    Object? otbPsbSts = null,
    Object? delOrdNo = null,
    Object? kitCfmSts = null,
    Object? delPreDt = null,
    Object? mstKey = null,
    Object? delOrdType = null,
    Object? selected = null,
  }) {
    return _then(_$DetailItemImpl(
      pjtNm: null == pjtNm
          ? _value.pjtNm
          : pjtNm // ignore: cast_nullable_to_non_nullable
              as String,
      soNo: null == soNo
          ? _value.soNo
          : soNo // ignore: cast_nullable_to_non_nullable
              as String,
      bomChgSts: null == bomChgSts
          ? _value.bomChgSts
          : bomChgSts // ignore: cast_nullable_to_non_nullable
              as String,
      remark: null == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
      otbNo: null == otbNo
          ? _value.otbNo
          : otbNo // ignore: cast_nullable_to_non_nullable
              as String,
      delOrdTypeNm:
          freezed == delOrdTypeNm ? _value.delOrdTypeNm! : delOrdTypeNm,
      otbPsbSts: null == otbPsbSts
          ? _value.otbPsbSts
          : otbPsbSts // ignore: cast_nullable_to_non_nullable
              as String,
      delOrdNo: null == delOrdNo
          ? _value.delOrdNo
          : delOrdNo // ignore: cast_nullable_to_non_nullable
              as String,
      kitCfmSts: null == kitCfmSts
          ? _value.kitCfmSts
          : kitCfmSts // ignore: cast_nullable_to_non_nullable
              as String,
      delPreDt: null == delPreDt
          ? _value.delPreDt
          : delPreDt // ignore: cast_nullable_to_non_nullable
              as String,
      mstKey: null == mstKey
          ? _value.mstKey
          : mstKey // ignore: cast_nullable_to_non_nullable
              as String,
      delOrdType: null == delOrdType
          ? _value.delOrdType
          : delOrdType // ignore: cast_nullable_to_non_nullable
              as String,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailItemImpl implements _DetailItem {
  const _$DetailItemImpl(
      {this.pjtNm = '',
      this.soNo = '',
      this.bomChgSts = '',
      this.remark = '',
      this.otbNo = '',
      this.delOrdTypeNm = '',
      this.otbPsbSts = '',
      this.delOrdNo = '',
      this.kitCfmSts = '',
      this.delPreDt = '',
      this.mstKey = '',
      this.delOrdType = '',
      this.selected = false});

  factory _$DetailItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailItemImplFromJson(json);

  @override
  @JsonKey()
  final String pjtNm;
  @override
  @JsonKey()
  final String soNo;
  @override
  @JsonKey()
  final String bomChgSts;
  @override
  @JsonKey()
  final String remark;
  @override
  @JsonKey()
  final String otbNo;
  @override
  @JsonKey()
  final dynamic delOrdTypeNm;
  @override
  @JsonKey()
  final String otbPsbSts;
  @override
  @JsonKey()
  final String delOrdNo;
  @override
  @JsonKey()
  final String kitCfmSts;
  @override
  @JsonKey()
  final String delPreDt;
  @override
  @JsonKey()
  final String mstKey;
  @override
  @JsonKey()
  final String delOrdType;
  @override
  @JsonKey()
  final bool selected;

  @override
  String toString() {
    return 'DetailItem(pjtNm: $pjtNm, soNo: $soNo, bomChgSts: $bomChgSts, remark: $remark, otbNo: $otbNo, delOrdTypeNm: $delOrdTypeNm, otbPsbSts: $otbPsbSts, delOrdNo: $delOrdNo, kitCfmSts: $kitCfmSts, delPreDt: $delPreDt, mstKey: $mstKey, delOrdType: $delOrdType, selected: $selected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailItemImpl &&
            (identical(other.pjtNm, pjtNm) || other.pjtNm == pjtNm) &&
            (identical(other.soNo, soNo) || other.soNo == soNo) &&
            (identical(other.bomChgSts, bomChgSts) ||
                other.bomChgSts == bomChgSts) &&
            (identical(other.remark, remark) || other.remark == remark) &&
            (identical(other.otbNo, otbNo) || other.otbNo == otbNo) &&
            const DeepCollectionEquality()
                .equals(other.delOrdTypeNm, delOrdTypeNm) &&
            (identical(other.otbPsbSts, otbPsbSts) ||
                other.otbPsbSts == otbPsbSts) &&
            (identical(other.delOrdNo, delOrdNo) ||
                other.delOrdNo == delOrdNo) &&
            (identical(other.kitCfmSts, kitCfmSts) ||
                other.kitCfmSts == kitCfmSts) &&
            (identical(other.delPreDt, delPreDt) ||
                other.delPreDt == delPreDt) &&
            (identical(other.mstKey, mstKey) || other.mstKey == mstKey) &&
            (identical(other.delOrdType, delOrdType) ||
                other.delOrdType == delOrdType) &&
            (identical(other.selected, selected) ||
                other.selected == selected));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      pjtNm,
      soNo,
      bomChgSts,
      remark,
      otbNo,
      const DeepCollectionEquality().hash(delOrdTypeNm),
      otbPsbSts,
      delOrdNo,
      kitCfmSts,
      delPreDt,
      mstKey,
      delOrdType,
      selected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailItemImplCopyWith<_$DetailItemImpl> get copyWith =>
      __$$DetailItemImplCopyWithImpl<_$DetailItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailItemImplToJson(
      this,
    );
  }
}

abstract class _DetailItem implements DetailItem {
  const factory _DetailItem(
      {final String pjtNm,
      final String soNo,
      final String bomChgSts,
      final String remark,
      final String otbNo,
      final dynamic delOrdTypeNm,
      final String otbPsbSts,
      final String delOrdNo,
      final String kitCfmSts,
      final String delPreDt,
      final String mstKey,
      final String delOrdType,
      final bool selected}) = _$DetailItemImpl;

  factory _DetailItem.fromJson(Map<String, dynamic> json) =
      _$DetailItemImpl.fromJson;

  @override
  String get pjtNm;
  @override
  String get soNo;
  @override
  String get bomChgSts;
  @override
  String get remark;
  @override
  String get otbNo;
  @override
  dynamic get delOrdTypeNm;
  @override
  String get otbPsbSts;
  @override
  String get delOrdNo;
  @override
  String get kitCfmSts;
  @override
  String get delPreDt;
  @override
  String get mstKey;
  @override
  String get delOrdType;
  @override
  bool get selected;
  @override
  @JsonKey(ignore: true)
  _$$DetailItemImplCopyWith<_$DetailItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
