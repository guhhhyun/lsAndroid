// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'picking_first_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PickingFirstModel _$PickingFirstModelFromJson(Map<String, dynamic> json) {
  return _PickingFirstModel.fromJson(json);
}

/// @nodoc
mixin _$PickingFirstModel {
  Header? get header => throw _privateConstructorUsedError;
  String get resultCode => throw _privateConstructorUsedError;
  String get resultMessage => throw _privateConstructorUsedError;
  List<dynamic>? get body => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PickingFirstModelCopyWith<PickingFirstModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PickingFirstModelCopyWith<$Res> {
  factory $PickingFirstModelCopyWith(
          PickingFirstModel value, $Res Function(PickingFirstModel) then) =
      _$PickingFirstModelCopyWithImpl<$Res, PickingFirstModel>;
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
class _$PickingFirstModelCopyWithImpl<$Res, $Val extends PickingFirstModel>
    implements $PickingFirstModelCopyWith<$Res> {
  _$PickingFirstModelCopyWithImpl(this._value, this._then);

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
abstract class _$$PickingFirstModelImplCopyWith<$Res>
    implements $PickingFirstModelCopyWith<$Res> {
  factory _$$PickingFirstModelImplCopyWith(_$PickingFirstModelImpl value,
          $Res Function(_$PickingFirstModelImpl) then) =
      __$$PickingFirstModelImplCopyWithImpl<$Res>;
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
class __$$PickingFirstModelImplCopyWithImpl<$Res>
    extends _$PickingFirstModelCopyWithImpl<$Res, _$PickingFirstModelImpl>
    implements _$$PickingFirstModelImplCopyWith<$Res> {
  __$$PickingFirstModelImplCopyWithImpl(_$PickingFirstModelImpl _value,
      $Res Function(_$PickingFirstModelImpl) _then)
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
    return _then(_$PickingFirstModelImpl(
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
class _$PickingFirstModelImpl implements _PickingFirstModel {
  const _$PickingFirstModelImpl(
      {this.header,
      this.resultCode = '',
      this.resultMessage = '',
      final List<dynamic>? body,
      this.hasError = false})
      : _body = body;

  factory _$PickingFirstModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PickingFirstModelImplFromJson(json);

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
    return 'PickingFirstModel(header: $header, resultCode: $resultCode, resultMessage: $resultMessage, body: $body, hasError: $hasError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PickingFirstModelImpl &&
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
  _$$PickingFirstModelImplCopyWith<_$PickingFirstModelImpl> get copyWith =>
      __$$PickingFirstModelImplCopyWithImpl<_$PickingFirstModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PickingFirstModelImplToJson(
      this,
    );
  }
}

abstract class _PickingFirstModel implements PickingFirstModel {
  const factory _PickingFirstModel(
      {final Header? header,
      final String resultCode,
      final String resultMessage,
      final List<dynamic>? body,
      final bool hasError}) = _$PickingFirstModelImpl;

  factory _PickingFirstModel.fromJson(Map<String, dynamic> json) =
      _$PickingFirstModelImpl.fromJson;

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
  _$$PickingFirstModelImplCopyWith<_$PickingFirstModelImpl> get copyWith =>
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

ResponseBody _$ResponseBodyFromJson(Map<String, dynamic> json) {
  return _ResponseBody.fromJson(json);
}

/// @nodoc
mixin _$ResponseBody {
  bool get resultValue => throw _privateConstructorUsedError;
  int get resultRowCount => throw _privateConstructorUsedError;
  String get resultCode => throw _privateConstructorUsedError;
  dynamic get resultMessage => throw _privateConstructorUsedError;
  dynamic get errorState => throw _privateConstructorUsedError;
  dynamic get errorProcedure => throw _privateConstructorUsedError;
  dynamic get returnMessage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseBodyCopyWith<ResponseBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseBodyCopyWith<$Res> {
  factory $ResponseBodyCopyWith(
          ResponseBody value, $Res Function(ResponseBody) then) =
      _$ResponseBodyCopyWithImpl<$Res, ResponseBody>;
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
class _$ResponseBodyCopyWithImpl<$Res, $Val extends ResponseBody>
    implements $ResponseBodyCopyWith<$Res> {
  _$ResponseBodyCopyWithImpl(this._value, this._then);

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
abstract class _$$ResponseBodyImplCopyWith<$Res>
    implements $ResponseBodyCopyWith<$Res> {
  factory _$$ResponseBodyImplCopyWith(
          _$ResponseBodyImpl value, $Res Function(_$ResponseBodyImpl) then) =
      __$$ResponseBodyImplCopyWithImpl<$Res>;
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
class __$$ResponseBodyImplCopyWithImpl<$Res>
    extends _$ResponseBodyCopyWithImpl<$Res, _$ResponseBodyImpl>
    implements _$$ResponseBodyImplCopyWith<$Res> {
  __$$ResponseBodyImplCopyWithImpl(
      _$ResponseBodyImpl _value, $Res Function(_$ResponseBodyImpl) _then)
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
    return _then(_$ResponseBodyImpl(
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
class _$ResponseBodyImpl implements _ResponseBody {
  const _$ResponseBodyImpl(
      {this.resultValue = false,
      this.resultRowCount = 0,
      this.resultCode = '',
      this.resultMessage = '',
      this.errorState = '',
      this.errorProcedure = '',
      this.returnMessage = ''});

  factory _$ResponseBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseBodyImplFromJson(json);

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
    return 'ResponseBody(resultValue: $resultValue, resultRowCount: $resultRowCount, resultCode: $resultCode, resultMessage: $resultMessage, errorState: $errorState, errorProcedure: $errorProcedure, returnMessage: $returnMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseBodyImpl &&
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
  _$$ResponseBodyImplCopyWith<_$ResponseBodyImpl> get copyWith =>
      __$$ResponseBodyImplCopyWithImpl<_$ResponseBodyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseBodyImplToJson(
      this,
    );
  }
}

abstract class _ResponseBody implements ResponseBody {
  const factory _ResponseBody(
      {final bool resultValue,
      final int resultRowCount,
      final String resultCode,
      final dynamic resultMessage,
      final dynamic errorState,
      final dynamic errorProcedure,
      final dynamic returnMessage}) = _$ResponseBodyImpl;

  factory _ResponseBody.fromJson(Map<String, dynamic> json) =
      _$ResponseBodyImpl.fromJson;

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
  _$$ResponseBodyImplCopyWith<_$ResponseBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Item _$ItemFromJson(Map<String, dynamic> json) {
  return _Item.fromJson(json);
}

/// @nodoc
mixin _$Item {
  int get pickRank => throw _privateConstructorUsedError;
  String get pickUser => throw _privateConstructorUsedError;
  String get rackOutBtn => throw _privateConstructorUsedError;
  String get pjtNm => throw _privateConstructorUsedError;
  String get grpKey => throw _privateConstructorUsedError;
  int get cbxSeq => throw _privateConstructorUsedError;
  String get itemCd => throw _privateConstructorUsedError;
  String get itemNm => throw _privateConstructorUsedError;
  String get wrkNo => throw _privateConstructorUsedError;
  int get pickSeq => throw _privateConstructorUsedError;
  String get plant => throw _privateConstructorUsedError;
  String get pickNo => throw _privateConstructorUsedError;
  String get pickUserNm => throw _privateConstructorUsedError;
  String get mstKey => throw _privateConstructorUsedError;
  String get cbxNo => throw _privateConstructorUsedError;
  bool get selected => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemCopyWith<Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res, Item>;
  @useResult
  $Res call(
      {int pickRank,
      String pickUser,
      String rackOutBtn,
      String pjtNm,
      String grpKey,
      int cbxSeq,
      String itemCd,
      String itemNm,
      String wrkNo,
      int pickSeq,
      String plant,
      String pickNo,
      String pickUserNm,
      String mstKey,
      String cbxNo,
      bool selected});
}

/// @nodoc
class _$ItemCopyWithImpl<$Res, $Val extends Item>
    implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pickRank = null,
    Object? pickUser = null,
    Object? rackOutBtn = null,
    Object? pjtNm = null,
    Object? grpKey = null,
    Object? cbxSeq = null,
    Object? itemCd = null,
    Object? itemNm = null,
    Object? wrkNo = null,
    Object? pickSeq = null,
    Object? plant = null,
    Object? pickNo = null,
    Object? pickUserNm = null,
    Object? mstKey = null,
    Object? cbxNo = null,
    Object? selected = null,
  }) {
    return _then(_value.copyWith(
      pickRank: null == pickRank
          ? _value.pickRank
          : pickRank // ignore: cast_nullable_to_non_nullable
              as int,
      pickUser: null == pickUser
          ? _value.pickUser
          : pickUser // ignore: cast_nullable_to_non_nullable
              as String,
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
      cbxSeq: null == cbxSeq
          ? _value.cbxSeq
          : cbxSeq // ignore: cast_nullable_to_non_nullable
              as int,
      itemCd: null == itemCd
          ? _value.itemCd
          : itemCd // ignore: cast_nullable_to_non_nullable
              as String,
      itemNm: null == itemNm
          ? _value.itemNm
          : itemNm // ignore: cast_nullable_to_non_nullable
              as String,
      wrkNo: null == wrkNo
          ? _value.wrkNo
          : wrkNo // ignore: cast_nullable_to_non_nullable
              as String,
      pickSeq: null == pickSeq
          ? _value.pickSeq
          : pickSeq // ignore: cast_nullable_to_non_nullable
              as int,
      plant: null == plant
          ? _value.plant
          : plant // ignore: cast_nullable_to_non_nullable
              as String,
      pickNo: null == pickNo
          ? _value.pickNo
          : pickNo // ignore: cast_nullable_to_non_nullable
              as String,
      pickUserNm: null == pickUserNm
          ? _value.pickUserNm
          : pickUserNm // ignore: cast_nullable_to_non_nullable
              as String,
      mstKey: null == mstKey
          ? _value.mstKey
          : mstKey // ignore: cast_nullable_to_non_nullable
              as String,
      cbxNo: null == cbxNo
          ? _value.cbxNo
          : cbxNo // ignore: cast_nullable_to_non_nullable
              as String,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemImplCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$$ItemImplCopyWith(
          _$ItemImpl value, $Res Function(_$ItemImpl) then) =
      __$$ItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int pickRank,
      String pickUser,
      String rackOutBtn,
      String pjtNm,
      String grpKey,
      int cbxSeq,
      String itemCd,
      String itemNm,
      String wrkNo,
      int pickSeq,
      String plant,
      String pickNo,
      String pickUserNm,
      String mstKey,
      String cbxNo,
      bool selected});
}

/// @nodoc
class __$$ItemImplCopyWithImpl<$Res>
    extends _$ItemCopyWithImpl<$Res, _$ItemImpl>
    implements _$$ItemImplCopyWith<$Res> {
  __$$ItemImplCopyWithImpl(_$ItemImpl _value, $Res Function(_$ItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pickRank = null,
    Object? pickUser = null,
    Object? rackOutBtn = null,
    Object? pjtNm = null,
    Object? grpKey = null,
    Object? cbxSeq = null,
    Object? itemCd = null,
    Object? itemNm = null,
    Object? wrkNo = null,
    Object? pickSeq = null,
    Object? plant = null,
    Object? pickNo = null,
    Object? pickUserNm = null,
    Object? mstKey = null,
    Object? cbxNo = null,
    Object? selected = null,
  }) {
    return _then(_$ItemImpl(
      pickRank: null == pickRank
          ? _value.pickRank
          : pickRank // ignore: cast_nullable_to_non_nullable
              as int,
      pickUser: null == pickUser
          ? _value.pickUser
          : pickUser // ignore: cast_nullable_to_non_nullable
              as String,
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
      cbxSeq: null == cbxSeq
          ? _value.cbxSeq
          : cbxSeq // ignore: cast_nullable_to_non_nullable
              as int,
      itemCd: null == itemCd
          ? _value.itemCd
          : itemCd // ignore: cast_nullable_to_non_nullable
              as String,
      itemNm: null == itemNm
          ? _value.itemNm
          : itemNm // ignore: cast_nullable_to_non_nullable
              as String,
      wrkNo: null == wrkNo
          ? _value.wrkNo
          : wrkNo // ignore: cast_nullable_to_non_nullable
              as String,
      pickSeq: null == pickSeq
          ? _value.pickSeq
          : pickSeq // ignore: cast_nullable_to_non_nullable
              as int,
      plant: null == plant
          ? _value.plant
          : plant // ignore: cast_nullable_to_non_nullable
              as String,
      pickNo: null == pickNo
          ? _value.pickNo
          : pickNo // ignore: cast_nullable_to_non_nullable
              as String,
      pickUserNm: null == pickUserNm
          ? _value.pickUserNm
          : pickUserNm // ignore: cast_nullable_to_non_nullable
              as String,
      mstKey: null == mstKey
          ? _value.mstKey
          : mstKey // ignore: cast_nullable_to_non_nullable
              as String,
      cbxNo: null == cbxNo
          ? _value.cbxNo
          : cbxNo // ignore: cast_nullable_to_non_nullable
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
class _$ItemImpl implements _Item {
  const _$ItemImpl(
      {this.pickRank = 0,
      this.pickUser = '',
      this.rackOutBtn = '',
      this.pjtNm = '',
      this.grpKey = '',
      this.cbxSeq = 0,
      this.itemCd = '',
      this.itemNm = '',
      this.wrkNo = '',
      this.pickSeq = 0,
      this.plant = '',
      this.pickNo = '',
      this.pickUserNm = '',
      this.mstKey = '',
      this.cbxNo = '',
      this.selected = false});

  factory _$ItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemImplFromJson(json);

  @override
  @JsonKey()
  final int pickRank;
  @override
  @JsonKey()
  final String pickUser;
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
  final int cbxSeq;
  @override
  @JsonKey()
  final String itemCd;
  @override
  @JsonKey()
  final String itemNm;
  @override
  @JsonKey()
  final String wrkNo;
  @override
  @JsonKey()
  final int pickSeq;
  @override
  @JsonKey()
  final String plant;
  @override
  @JsonKey()
  final String pickNo;
  @override
  @JsonKey()
  final String pickUserNm;
  @override
  @JsonKey()
  final String mstKey;
  @override
  @JsonKey()
  final String cbxNo;
  @override
  @JsonKey()
  final bool selected;

  @override
  String toString() {
    return 'Item(pickRank: $pickRank, pickUser: $pickUser, rackOutBtn: $rackOutBtn, pjtNm: $pjtNm, grpKey: $grpKey, cbxSeq: $cbxSeq, itemCd: $itemCd, itemNm: $itemNm, wrkNo: $wrkNo, pickSeq: $pickSeq, plant: $plant, pickNo: $pickNo, pickUserNm: $pickUserNm, mstKey: $mstKey, cbxNo: $cbxNo, selected: $selected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemImpl &&
            (identical(other.pickRank, pickRank) ||
                other.pickRank == pickRank) &&
            (identical(other.pickUser, pickUser) ||
                other.pickUser == pickUser) &&
            (identical(other.rackOutBtn, rackOutBtn) ||
                other.rackOutBtn == rackOutBtn) &&
            (identical(other.pjtNm, pjtNm) || other.pjtNm == pjtNm) &&
            (identical(other.grpKey, grpKey) || other.grpKey == grpKey) &&
            (identical(other.cbxSeq, cbxSeq) || other.cbxSeq == cbxSeq) &&
            (identical(other.itemCd, itemCd) || other.itemCd == itemCd) &&
            (identical(other.itemNm, itemNm) || other.itemNm == itemNm) &&
            (identical(other.wrkNo, wrkNo) || other.wrkNo == wrkNo) &&
            (identical(other.pickSeq, pickSeq) || other.pickSeq == pickSeq) &&
            (identical(other.plant, plant) || other.plant == plant) &&
            (identical(other.pickNo, pickNo) || other.pickNo == pickNo) &&
            (identical(other.pickUserNm, pickUserNm) ||
                other.pickUserNm == pickUserNm) &&
            (identical(other.mstKey, mstKey) || other.mstKey == mstKey) &&
            (identical(other.cbxNo, cbxNo) || other.cbxNo == cbxNo) &&
            (identical(other.selected, selected) ||
                other.selected == selected));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      pickRank,
      pickUser,
      rackOutBtn,
      pjtNm,
      grpKey,
      cbxSeq,
      itemCd,
      itemNm,
      wrkNo,
      pickSeq,
      plant,
      pickNo,
      pickUserNm,
      mstKey,
      cbxNo,
      selected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      __$$ItemImplCopyWithImpl<_$ItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemImplToJson(
      this,
    );
  }
}

abstract class _Item implements Item {
  const factory _Item(
      {final int pickRank,
      final String pickUser,
      final String rackOutBtn,
      final String pjtNm,
      final String grpKey,
      final int cbxSeq,
      final String itemCd,
      final String itemNm,
      final String wrkNo,
      final int pickSeq,
      final String plant,
      final String pickNo,
      final String pickUserNm,
      final String mstKey,
      final String cbxNo,
      final bool selected}) = _$ItemImpl;

  factory _Item.fromJson(Map<String, dynamic> json) = _$ItemImpl.fromJson;

  @override
  int get pickRank;
  @override
  String get pickUser;
  @override
  String get rackOutBtn;
  @override
  String get pjtNm;
  @override
  String get grpKey;
  @override
  int get cbxSeq;
  @override
  String get itemCd;
  @override
  String get itemNm;
  @override
  String get wrkNo;
  @override
  int get pickSeq;
  @override
  String get plant;
  @override
  String get pickNo;
  @override
  String get pickUserNm;
  @override
  String get mstKey;
  @override
  String get cbxNo;
  @override
  bool get selected;
  @override
  @JsonKey(ignore: true)
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
