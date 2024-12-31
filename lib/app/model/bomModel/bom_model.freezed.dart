// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bom_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BomModel _$BomModelFromJson(Map<String, dynamic> json) {
  return _BomModel.fromJson(json);
}

/// @nodoc
mixin _$BomModel {
  Header? get header => throw _privateConstructorUsedError;
  String get resultCode => throw _privateConstructorUsedError;
  String get resultMessage => throw _privateConstructorUsedError;
  List<dynamic>? get body => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BomModelCopyWith<BomModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BomModelCopyWith<$Res> {
  factory $BomModelCopyWith(BomModel value, $Res Function(BomModel) then) =
      _$BomModelCopyWithImpl<$Res, BomModel>;
  @useResult
  $Res call(
      {Header? header,
      String resultCode,
      String resultMessage,
      List<dynamic>? body});

  $HeaderCopyWith<$Res>? get header;
}

/// @nodoc
class _$BomModelCopyWithImpl<$Res, $Val extends BomModel>
    implements $BomModelCopyWith<$Res> {
  _$BomModelCopyWithImpl(this._value, this._then);

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
abstract class _$$BomModelImplCopyWith<$Res>
    implements $BomModelCopyWith<$Res> {
  factory _$$BomModelImplCopyWith(
          _$BomModelImpl value, $Res Function(_$BomModelImpl) then) =
      __$$BomModelImplCopyWithImpl<$Res>;
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
class __$$BomModelImplCopyWithImpl<$Res>
    extends _$BomModelCopyWithImpl<$Res, _$BomModelImpl>
    implements _$$BomModelImplCopyWith<$Res> {
  __$$BomModelImplCopyWithImpl(
      _$BomModelImpl _value, $Res Function(_$BomModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? header = freezed,
    Object? resultCode = null,
    Object? resultMessage = null,
    Object? body = freezed,
  }) {
    return _then(_$BomModelImpl(
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
class _$BomModelImpl implements _BomModel {
  const _$BomModelImpl(
      {this.header,
      this.resultCode = '',
      this.resultMessage = '',
      final List<dynamic>? body})
      : _body = body;

  factory _$BomModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BomModelImplFromJson(json);

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
    return 'BomModel(header: $header, resultCode: $resultCode, resultMessage: $resultMessage, body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BomModelImpl &&
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
  _$$BomModelImplCopyWith<_$BomModelImpl> get copyWith =>
      __$$BomModelImplCopyWithImpl<_$BomModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BomModelImplToJson(
      this,
    );
  }
}

abstract class _BomModel implements BomModel {
  const factory _BomModel(
      {final Header? header,
      final String resultCode,
      final String resultMessage,
      final List<dynamic>? body}) = _$BomModelImpl;

  factory _BomModel.fromJson(Map<String, dynamic> json) =
      _$BomModelImpl.fromJson;

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
  _$$BomModelImplCopyWith<_$BomModelImpl> get copyWith =>
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
  String get bcAfUserId => throw _privateConstructorUsedError;
  String get BC_AF_RST => throw _privateConstructorUsedError;
  String get bcAfDtm => throw _privateConstructorUsedError;
  String get soNo => throw _privateConstructorUsedError;
  String get BC_TYPE => throw _privateConstructorUsedError;
  String get bcType => throw _privateConstructorUsedError;
  String get pitmCd => throw _privateConstructorUsedError;
  int get bcId => throw _privateConstructorUsedError;
  String get BC_STATUS => throw _privateConstructorUsedError;
  int get setQty => throw _privateConstructorUsedError;
  String get pdtNo => throw _privateConstructorUsedError;
  String get bxDtm => throw _privateConstructorUsedError;
  String get bcAfRst => throw _privateConstructorUsedError;
  String get bcRmk => throw _privateConstructorUsedError;
  String get bcStatus => throw _privateConstructorUsedError;
  int get selected => throw _privateConstructorUsedError;

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
      {String bcAfUserId,
      String BC_AF_RST,
      String bcAfDtm,
      String soNo,
      String BC_TYPE,
      String bcType,
      String pitmCd,
      int bcId,
      String BC_STATUS,
      int setQty,
      String pdtNo,
      String bxDtm,
      String bcAfRst,
      String bcRmk,
      String bcStatus,
      int selected});
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
    Object? bcAfUserId = null,
    Object? BC_AF_RST = null,
    Object? bcAfDtm = null,
    Object? soNo = null,
    Object? BC_TYPE = null,
    Object? bcType = null,
    Object? pitmCd = null,
    Object? bcId = null,
    Object? BC_STATUS = null,
    Object? setQty = null,
    Object? pdtNo = null,
    Object? bxDtm = null,
    Object? bcAfRst = null,
    Object? bcRmk = null,
    Object? bcStatus = null,
    Object? selected = null,
  }) {
    return _then(_value.copyWith(
      bcAfUserId: null == bcAfUserId
          ? _value.bcAfUserId
          : bcAfUserId // ignore: cast_nullable_to_non_nullable
              as String,
      BC_AF_RST: null == BC_AF_RST
          ? _value.BC_AF_RST
          : BC_AF_RST // ignore: cast_nullable_to_non_nullable
              as String,
      bcAfDtm: null == bcAfDtm
          ? _value.bcAfDtm
          : bcAfDtm // ignore: cast_nullable_to_non_nullable
              as String,
      soNo: null == soNo
          ? _value.soNo
          : soNo // ignore: cast_nullable_to_non_nullable
              as String,
      BC_TYPE: null == BC_TYPE
          ? _value.BC_TYPE
          : BC_TYPE // ignore: cast_nullable_to_non_nullable
              as String,
      bcType: null == bcType
          ? _value.bcType
          : bcType // ignore: cast_nullable_to_non_nullable
              as String,
      pitmCd: null == pitmCd
          ? _value.pitmCd
          : pitmCd // ignore: cast_nullable_to_non_nullable
              as String,
      bcId: null == bcId
          ? _value.bcId
          : bcId // ignore: cast_nullable_to_non_nullable
              as int,
      BC_STATUS: null == BC_STATUS
          ? _value.BC_STATUS
          : BC_STATUS // ignore: cast_nullable_to_non_nullable
              as String,
      setQty: null == setQty
          ? _value.setQty
          : setQty // ignore: cast_nullable_to_non_nullable
              as int,
      pdtNo: null == pdtNo
          ? _value.pdtNo
          : pdtNo // ignore: cast_nullable_to_non_nullable
              as String,
      bxDtm: null == bxDtm
          ? _value.bxDtm
          : bxDtm // ignore: cast_nullable_to_non_nullable
              as String,
      bcAfRst: null == bcAfRst
          ? _value.bcAfRst
          : bcAfRst // ignore: cast_nullable_to_non_nullable
              as String,
      bcRmk: null == bcRmk
          ? _value.bcRmk
          : bcRmk // ignore: cast_nullable_to_non_nullable
              as String,
      bcStatus: null == bcStatus
          ? _value.bcStatus
          : bcStatus // ignore: cast_nullable_to_non_nullable
              as String,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as int,
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
      {String bcAfUserId,
      String BC_AF_RST,
      String bcAfDtm,
      String soNo,
      String BC_TYPE,
      String bcType,
      String pitmCd,
      int bcId,
      String BC_STATUS,
      int setQty,
      String pdtNo,
      String bxDtm,
      String bcAfRst,
      String bcRmk,
      String bcStatus,
      int selected});
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
    Object? bcAfUserId = null,
    Object? BC_AF_RST = null,
    Object? bcAfDtm = null,
    Object? soNo = null,
    Object? BC_TYPE = null,
    Object? bcType = null,
    Object? pitmCd = null,
    Object? bcId = null,
    Object? BC_STATUS = null,
    Object? setQty = null,
    Object? pdtNo = null,
    Object? bxDtm = null,
    Object? bcAfRst = null,
    Object? bcRmk = null,
    Object? bcStatus = null,
    Object? selected = null,
  }) {
    return _then(_$SubBodyItemImpl(
      bcAfUserId: null == bcAfUserId
          ? _value.bcAfUserId
          : bcAfUserId // ignore: cast_nullable_to_non_nullable
              as String,
      BC_AF_RST: null == BC_AF_RST
          ? _value.BC_AF_RST
          : BC_AF_RST // ignore: cast_nullable_to_non_nullable
              as String,
      bcAfDtm: null == bcAfDtm
          ? _value.bcAfDtm
          : bcAfDtm // ignore: cast_nullable_to_non_nullable
              as String,
      soNo: null == soNo
          ? _value.soNo
          : soNo // ignore: cast_nullable_to_non_nullable
              as String,
      BC_TYPE: null == BC_TYPE
          ? _value.BC_TYPE
          : BC_TYPE // ignore: cast_nullable_to_non_nullable
              as String,
      bcType: null == bcType
          ? _value.bcType
          : bcType // ignore: cast_nullable_to_non_nullable
              as String,
      pitmCd: null == pitmCd
          ? _value.pitmCd
          : pitmCd // ignore: cast_nullable_to_non_nullable
              as String,
      bcId: null == bcId
          ? _value.bcId
          : bcId // ignore: cast_nullable_to_non_nullable
              as int,
      BC_STATUS: null == BC_STATUS
          ? _value.BC_STATUS
          : BC_STATUS // ignore: cast_nullable_to_non_nullable
              as String,
      setQty: null == setQty
          ? _value.setQty
          : setQty // ignore: cast_nullable_to_non_nullable
              as int,
      pdtNo: null == pdtNo
          ? _value.pdtNo
          : pdtNo // ignore: cast_nullable_to_non_nullable
              as String,
      bxDtm: null == bxDtm
          ? _value.bxDtm
          : bxDtm // ignore: cast_nullable_to_non_nullable
              as String,
      bcAfRst: null == bcAfRst
          ? _value.bcAfRst
          : bcAfRst // ignore: cast_nullable_to_non_nullable
              as String,
      bcRmk: null == bcRmk
          ? _value.bcRmk
          : bcRmk // ignore: cast_nullable_to_non_nullable
              as String,
      bcStatus: null == bcStatus
          ? _value.bcStatus
          : bcStatus // ignore: cast_nullable_to_non_nullable
              as String,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubBodyItemImpl implements _SubBodyItem {
  const _$SubBodyItemImpl(
      {this.bcAfUserId = '',
      this.BC_AF_RST = '',
      this.bcAfDtm = '',
      this.soNo = '',
      this.BC_TYPE = '',
      this.bcType = '',
      this.pitmCd = '',
      this.bcId = 0,
      this.BC_STATUS = '',
      this.setQty = 0,
      this.pdtNo = '',
      this.bxDtm = '',
      this.bcAfRst = '',
      this.bcRmk = '',
      this.bcStatus = '',
      this.selected = 0});

  factory _$SubBodyItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubBodyItemImplFromJson(json);

  @override
  @JsonKey()
  final String bcAfUserId;
  @override
  @JsonKey()
  final String BC_AF_RST;
  @override
  @JsonKey()
  final String bcAfDtm;
  @override
  @JsonKey()
  final String soNo;
  @override
  @JsonKey()
  final String BC_TYPE;
  @override
  @JsonKey()
  final String bcType;
  @override
  @JsonKey()
  final String pitmCd;
  @override
  @JsonKey()
  final int bcId;
  @override
  @JsonKey()
  final String BC_STATUS;
  @override
  @JsonKey()
  final int setQty;
  @override
  @JsonKey()
  final String pdtNo;
  @override
  @JsonKey()
  final String bxDtm;
  @override
  @JsonKey()
  final String bcAfRst;
  @override
  @JsonKey()
  final String bcRmk;
  @override
  @JsonKey()
  final String bcStatus;
  @override
  @JsonKey()
  final int selected;

  @override
  String toString() {
    return 'SubBodyItem(bcAfUserId: $bcAfUserId, BC_AF_RST: $BC_AF_RST, bcAfDtm: $bcAfDtm, soNo: $soNo, BC_TYPE: $BC_TYPE, bcType: $bcType, pitmCd: $pitmCd, bcId: $bcId, BC_STATUS: $BC_STATUS, setQty: $setQty, pdtNo: $pdtNo, bxDtm: $bxDtm, bcAfRst: $bcAfRst, bcRmk: $bcRmk, bcStatus: $bcStatus, selected: $selected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubBodyItemImpl &&
            (identical(other.bcAfUserId, bcAfUserId) ||
                other.bcAfUserId == bcAfUserId) &&
            (identical(other.BC_AF_RST, BC_AF_RST) ||
                other.BC_AF_RST == BC_AF_RST) &&
            (identical(other.bcAfDtm, bcAfDtm) || other.bcAfDtm == bcAfDtm) &&
            (identical(other.soNo, soNo) || other.soNo == soNo) &&
            (identical(other.BC_TYPE, BC_TYPE) || other.BC_TYPE == BC_TYPE) &&
            (identical(other.bcType, bcType) || other.bcType == bcType) &&
            (identical(other.pitmCd, pitmCd) || other.pitmCd == pitmCd) &&
            (identical(other.bcId, bcId) || other.bcId == bcId) &&
            (identical(other.BC_STATUS, BC_STATUS) ||
                other.BC_STATUS == BC_STATUS) &&
            (identical(other.setQty, setQty) || other.setQty == setQty) &&
            (identical(other.pdtNo, pdtNo) || other.pdtNo == pdtNo) &&
            (identical(other.bxDtm, bxDtm) || other.bxDtm == bxDtm) &&
            (identical(other.bcAfRst, bcAfRst) || other.bcAfRst == bcAfRst) &&
            (identical(other.bcRmk, bcRmk) || other.bcRmk == bcRmk) &&
            (identical(other.bcStatus, bcStatus) ||
                other.bcStatus == bcStatus) &&
            (identical(other.selected, selected) ||
                other.selected == selected));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      bcAfUserId,
      BC_AF_RST,
      bcAfDtm,
      soNo,
      BC_TYPE,
      bcType,
      pitmCd,
      bcId,
      BC_STATUS,
      setQty,
      pdtNo,
      bxDtm,
      bcAfRst,
      bcRmk,
      bcStatus,
      selected);

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
      {final String bcAfUserId,
      final String BC_AF_RST,
      final String bcAfDtm,
      final String soNo,
      final String BC_TYPE,
      final String bcType,
      final String pitmCd,
      final int bcId,
      final String BC_STATUS,
      final int setQty,
      final String pdtNo,
      final String bxDtm,
      final String bcAfRst,
      final String bcRmk,
      final String bcStatus,
      final int selected}) = _$SubBodyItemImpl;

  factory _SubBodyItem.fromJson(Map<String, dynamic> json) =
      _$SubBodyItemImpl.fromJson;

  @override
  String get bcAfUserId;
  @override
  String get BC_AF_RST;
  @override
  String get bcAfDtm;
  @override
  String get soNo;
  @override
  String get BC_TYPE;
  @override
  String get bcType;
  @override
  String get pitmCd;
  @override
  int get bcId;
  @override
  String get BC_STATUS;
  @override
  int get setQty;
  @override
  String get pdtNo;
  @override
  String get bxDtm;
  @override
  String get bcAfRst;
  @override
  String get bcRmk;
  @override
  String get bcStatus;
  @override
  int get selected;
  @override
  @JsonKey(ignore: true)
  _$$SubBodyItemImplCopyWith<_$SubBodyItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
