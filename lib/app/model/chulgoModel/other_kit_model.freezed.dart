// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'other_kit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OtherKitModel _$OtherKitModelFromJson(Map<String, dynamic> json) {
  return _OtherKitModel.fromJson(json);
}

/// @nodoc
mixin _$OtherKitModel {
  Header? get header => throw _privateConstructorUsedError;
  String get resultCode => throw _privateConstructorUsedError;
  String get resultMessage => throw _privateConstructorUsedError;
  List<Body>? get body => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OtherKitModelCopyWith<OtherKitModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtherKitModelCopyWith<$Res> {
  factory $OtherKitModelCopyWith(
          OtherKitModel value, $Res Function(OtherKitModel) then) =
      _$OtherKitModelCopyWithImpl<$Res, OtherKitModel>;
  @useResult
  $Res call(
      {Header? header,
      String resultCode,
      String resultMessage,
      List<Body>? body,
      bool hasError});

  $HeaderCopyWith<$Res>? get header;
}

/// @nodoc
class _$OtherKitModelCopyWithImpl<$Res, $Val extends OtherKitModel>
    implements $OtherKitModelCopyWith<$Res> {
  _$OtherKitModelCopyWithImpl(this._value, this._then);

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
              as List<Body>?,
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
abstract class _$$OtherKitModelImplCopyWith<$Res>
    implements $OtherKitModelCopyWith<$Res> {
  factory _$$OtherKitModelImplCopyWith(
          _$OtherKitModelImpl value, $Res Function(_$OtherKitModelImpl) then) =
      __$$OtherKitModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Header? header,
      String resultCode,
      String resultMessage,
      List<Body>? body,
      bool hasError});

  @override
  $HeaderCopyWith<$Res>? get header;
}

/// @nodoc
class __$$OtherKitModelImplCopyWithImpl<$Res>
    extends _$OtherKitModelCopyWithImpl<$Res, _$OtherKitModelImpl>
    implements _$$OtherKitModelImplCopyWith<$Res> {
  __$$OtherKitModelImplCopyWithImpl(
      _$OtherKitModelImpl _value, $Res Function(_$OtherKitModelImpl) _then)
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
    return _then(_$OtherKitModelImpl(
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
              as List<Body>?,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OtherKitModelImpl implements _OtherKitModel {
  const _$OtherKitModelImpl(
      {this.header,
      this.resultCode = '',
      this.resultMessage = '',
      final List<Body>? body,
      this.hasError = false})
      : _body = body;

  factory _$OtherKitModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OtherKitModelImplFromJson(json);

  @override
  final Header? header;
  @override
  @JsonKey()
  final String resultCode;
  @override
  @JsonKey()
  final String resultMessage;
  final List<Body>? _body;
  @override
  List<Body>? get body {
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
    return 'OtherKitModel(header: $header, resultCode: $resultCode, resultMessage: $resultMessage, body: $body, hasError: $hasError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtherKitModelImpl &&
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
  _$$OtherKitModelImplCopyWith<_$OtherKitModelImpl> get copyWith =>
      __$$OtherKitModelImplCopyWithImpl<_$OtherKitModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OtherKitModelImplToJson(
      this,
    );
  }
}

abstract class _OtherKitModel implements OtherKitModel {
  const factory _OtherKitModel(
      {final Header? header,
      final String resultCode,
      final String resultMessage,
      final List<Body>? body,
      final bool hasError}) = _$OtherKitModelImpl;

  factory _OtherKitModel.fromJson(Map<String, dynamic> json) =
      _$OtherKitModelImpl.fromJson;

  @override
  Header? get header;
  @override
  String get resultCode;
  @override
  String get resultMessage;
  @override
  List<Body>? get body;
  @override
  bool get hasError;
  @override
  @JsonKey(ignore: true)
  _$$OtherKitModelImplCopyWith<_$OtherKitModelImpl> get copyWith =>
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
  switch (json['runtimeType']) {
    case 'result':
      return BodyResult.fromJson(json);
    case 'dataList':
      return BodyDataList.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'Body',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$Body {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool resultValue,
            int resultRowCount,
            String resultCode,
            String resultMessage,
            dynamic errorState,
            dynamic errorProcedure,
            dynamic returnMessage)
        result,
    required TResult Function(List<ItemData> items) dataList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool resultValue,
            int resultRowCount,
            String resultCode,
            String resultMessage,
            dynamic errorState,
            dynamic errorProcedure,
            dynamic returnMessage)?
        result,
    TResult? Function(List<ItemData> items)? dataList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool resultValue,
            int resultRowCount,
            String resultCode,
            String resultMessage,
            dynamic errorState,
            dynamic errorProcedure,
            dynamic returnMessage)?
        result,
    TResult Function(List<ItemData> items)? dataList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BodyResult value) result,
    required TResult Function(BodyDataList value) dataList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BodyResult value)? result,
    TResult? Function(BodyDataList value)? dataList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BodyResult value)? result,
    TResult Function(BodyDataList value)? dataList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BodyCopyWith<$Res> {
  factory $BodyCopyWith(Body value, $Res Function(Body) then) =
      _$BodyCopyWithImpl<$Res, Body>;
}

/// @nodoc
class _$BodyCopyWithImpl<$Res, $Val extends Body>
    implements $BodyCopyWith<$Res> {
  _$BodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$BodyResultImplCopyWith<$Res> {
  factory _$$BodyResultImplCopyWith(
          _$BodyResultImpl value, $Res Function(_$BodyResultImpl) then) =
      __$$BodyResultImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {bool resultValue,
      int resultRowCount,
      String resultCode,
      String resultMessage,
      dynamic errorState,
      dynamic errorProcedure,
      dynamic returnMessage});
}

/// @nodoc
class __$$BodyResultImplCopyWithImpl<$Res>
    extends _$BodyCopyWithImpl<$Res, _$BodyResultImpl>
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
    Object? errorState = freezed,
    Object? errorProcedure = freezed,
    Object? returnMessage = freezed,
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
class _$BodyResultImpl implements BodyResult {
  const _$BodyResultImpl(
      {this.resultValue = false,
      this.resultRowCount = 0,
      this.resultCode = '',
      this.resultMessage = '',
      this.errorState = '',
      this.errorProcedure = '',
      this.returnMessage = '',
      final String? $type})
      : $type = $type ?? 'result';

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
  final dynamic errorState;
  @override
  @JsonKey()
  final dynamic errorProcedure;
  @override
  @JsonKey()
  final dynamic returnMessage;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Body.result(resultValue: $resultValue, resultRowCount: $resultRowCount, resultCode: $resultCode, resultMessage: $resultMessage, errorState: $errorState, errorProcedure: $errorProcedure, returnMessage: $returnMessage)';
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
      resultMessage,
      const DeepCollectionEquality().hash(errorState),
      const DeepCollectionEquality().hash(errorProcedure),
      const DeepCollectionEquality().hash(returnMessage));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BodyResultImplCopyWith<_$BodyResultImpl> get copyWith =>
      __$$BodyResultImplCopyWithImpl<_$BodyResultImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool resultValue,
            int resultRowCount,
            String resultCode,
            String resultMessage,
            dynamic errorState,
            dynamic errorProcedure,
            dynamic returnMessage)
        result,
    required TResult Function(List<ItemData> items) dataList,
  }) {
    return result(resultValue, resultRowCount, resultCode, resultMessage,
        errorState, errorProcedure, returnMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool resultValue,
            int resultRowCount,
            String resultCode,
            String resultMessage,
            dynamic errorState,
            dynamic errorProcedure,
            dynamic returnMessage)?
        result,
    TResult? Function(List<ItemData> items)? dataList,
  }) {
    return result?.call(resultValue, resultRowCount, resultCode, resultMessage,
        errorState, errorProcedure, returnMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool resultValue,
            int resultRowCount,
            String resultCode,
            String resultMessage,
            dynamic errorState,
            dynamic errorProcedure,
            dynamic returnMessage)?
        result,
    TResult Function(List<ItemData> items)? dataList,
    required TResult orElse(),
  }) {
    if (result != null) {
      return result(resultValue, resultRowCount, resultCode, resultMessage,
          errorState, errorProcedure, returnMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BodyResult value) result,
    required TResult Function(BodyDataList value) dataList,
  }) {
    return result(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BodyResult value)? result,
    TResult? Function(BodyDataList value)? dataList,
  }) {
    return result?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BodyResult value)? result,
    TResult Function(BodyDataList value)? dataList,
    required TResult orElse(),
  }) {
    if (result != null) {
      return result(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$BodyResultImplToJson(
      this,
    );
  }
}

abstract class BodyResult implements Body {
  const factory BodyResult(
      {final bool resultValue,
      final int resultRowCount,
      final String resultCode,
      final String resultMessage,
      final dynamic errorState,
      final dynamic errorProcedure,
      final dynamic returnMessage}) = _$BodyResultImpl;

  factory BodyResult.fromJson(Map<String, dynamic> json) =
      _$BodyResultImpl.fromJson;

  bool get resultValue;
  int get resultRowCount;
  String get resultCode;
  String get resultMessage;
  dynamic get errorState;
  dynamic get errorProcedure;
  dynamic get returnMessage;
  @JsonKey(ignore: true)
  _$$BodyResultImplCopyWith<_$BodyResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BodyDataListImplCopyWith<$Res> {
  factory _$$BodyDataListImplCopyWith(
          _$BodyDataListImpl value, $Res Function(_$BodyDataListImpl) then) =
      __$$BodyDataListImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ItemData> items});
}

/// @nodoc
class __$$BodyDataListImplCopyWithImpl<$Res>
    extends _$BodyCopyWithImpl<$Res, _$BodyDataListImpl>
    implements _$$BodyDataListImplCopyWith<$Res> {
  __$$BodyDataListImplCopyWithImpl(
      _$BodyDataListImpl _value, $Res Function(_$BodyDataListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$BodyDataListImpl(
      null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ItemData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BodyDataListImpl implements BodyDataList {
  const _$BodyDataListImpl(final List<ItemData> items, {final String? $type})
      : _items = items,
        $type = $type ?? 'dataList';

  factory _$BodyDataListImpl.fromJson(Map<String, dynamic> json) =>
      _$$BodyDataListImplFromJson(json);

  final List<ItemData> _items;
  @override
  List<ItemData> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Body.dataList(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BodyDataListImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BodyDataListImplCopyWith<_$BodyDataListImpl> get copyWith =>
      __$$BodyDataListImplCopyWithImpl<_$BodyDataListImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool resultValue,
            int resultRowCount,
            String resultCode,
            String resultMessage,
            dynamic errorState,
            dynamic errorProcedure,
            dynamic returnMessage)
        result,
    required TResult Function(List<ItemData> items) dataList,
  }) {
    return dataList(items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool resultValue,
            int resultRowCount,
            String resultCode,
            String resultMessage,
            dynamic errorState,
            dynamic errorProcedure,
            dynamic returnMessage)?
        result,
    TResult? Function(List<ItemData> items)? dataList,
  }) {
    return dataList?.call(items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool resultValue,
            int resultRowCount,
            String resultCode,
            String resultMessage,
            dynamic errorState,
            dynamic errorProcedure,
            dynamic returnMessage)?
        result,
    TResult Function(List<ItemData> items)? dataList,
    required TResult orElse(),
  }) {
    if (dataList != null) {
      return dataList(items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BodyResult value) result,
    required TResult Function(BodyDataList value) dataList,
  }) {
    return dataList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BodyResult value)? result,
    TResult? Function(BodyDataList value)? dataList,
  }) {
    return dataList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BodyResult value)? result,
    TResult Function(BodyDataList value)? dataList,
    required TResult orElse(),
  }) {
    if (dataList != null) {
      return dataList(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$BodyDataListImplToJson(
      this,
    );
  }
}

abstract class BodyDataList implements Body {
  const factory BodyDataList(final List<ItemData> items) = _$BodyDataListImpl;

  factory BodyDataList.fromJson(Map<String, dynamic> json) =
      _$BodyDataListImpl.fromJson;

  List<ItemData> get items;
  @JsonKey(ignore: true)
  _$$BodyDataListImplCopyWith<_$BodyDataListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ItemData _$ItemDataFromJson(Map<String, dynamic> json) {
  return _ItemData.fromJson(json);
}

/// @nodoc
mixin _$ItemData {
  dynamic get scanNo => throw _privateConstructorUsedError;
  dynamic get pkgSeq => throw _privateConstructorUsedError;
  dynamic get scanSeq => throw _privateConstructorUsedError;
  dynamic get dTagNo => throw _privateConstructorUsedError;
  String get syncYn => throw _privateConstructorUsedError;
  dynamic get remark => throw _privateConstructorUsedError;
  dynamic get pitmNm => throw _privateConstructorUsedError;
  dynamic get itemNm => throw _privateConstructorUsedError;
  dynamic get wrkRemark => throw _privateConstructorUsedError;
  dynamic get wrkItemCd => throw _privateConstructorUsedError;
  dynamic get dScanNo => throw _privateConstructorUsedError;
  dynamic get pjtNm2 => throw _privateConstructorUsedError;
  dynamic get wrkCfmYn => throw _privateConstructorUsedError;
  dynamic get setCbxQty => throw _privateConstructorUsedError;
  dynamic get wrkCfmDttm => throw _privateConstructorUsedError;
  dynamic get tagNo => throw _privateConstructorUsedError;
  dynamic get itemCd => throw _privateConstructorUsedError;
  dynamic get scanYn => throw _privateConstructorUsedError;
  dynamic get cbxExNo => throw _privateConstructorUsedError;
  dynamic get pitmCd => throw _privateConstructorUsedError;
  dynamic get wrkQty => throw _privateConstructorUsedError;
  dynamic get pkgNo => throw _privateConstructorUsedError;
  dynamic get cbxQty => throw _privateConstructorUsedError;
  dynamic get cbxExSeq => throw _privateConstructorUsedError;
  dynamic get totWrkNo => throw _privateConstructorUsedError;
  dynamic get setQty => throw _privateConstructorUsedError;
  dynamic get wrkItemNm => throw _privateConstructorUsedError;
  dynamic get wrkQtySync => throw _privateConstructorUsedError;
  dynamic get dWrkQty => throw _privateConstructorUsedError;
  dynamic get pdtNo => throw _privateConstructorUsedError;
  dynamic get qtyUnit => throw _privateConstructorUsedError;
  dynamic get itemNmNonKit => throw _privateConstructorUsedError;
  dynamic get wksNo => throw _privateConstructorUsedError;
  dynamic get ncbxRmk => throw _privateConstructorUsedError;

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
      {dynamic scanNo,
      dynamic pkgSeq,
      dynamic scanSeq,
      dynamic dTagNo,
      String syncYn,
      dynamic remark,
      dynamic pitmNm,
      dynamic itemNm,
      dynamic wrkRemark,
      dynamic wrkItemCd,
      dynamic dScanNo,
      dynamic pjtNm2,
      dynamic wrkCfmYn,
      dynamic setCbxQty,
      dynamic wrkCfmDttm,
      dynamic tagNo,
      dynamic itemCd,
      dynamic scanYn,
      dynamic cbxExNo,
      dynamic pitmCd,
      dynamic wrkQty,
      dynamic pkgNo,
      dynamic cbxQty,
      dynamic cbxExSeq,
      dynamic totWrkNo,
      dynamic setQty,
      dynamic wrkItemNm,
      dynamic wrkQtySync,
      dynamic dWrkQty,
      dynamic pdtNo,
      dynamic qtyUnit,
      dynamic itemNmNonKit,
      dynamic wksNo,
      dynamic ncbxRmk});
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
    Object? scanNo = freezed,
    Object? pkgSeq = freezed,
    Object? scanSeq = freezed,
    Object? dTagNo = freezed,
    Object? syncYn = null,
    Object? remark = freezed,
    Object? pitmNm = freezed,
    Object? itemNm = freezed,
    Object? wrkRemark = freezed,
    Object? wrkItemCd = freezed,
    Object? dScanNo = freezed,
    Object? pjtNm2 = freezed,
    Object? wrkCfmYn = freezed,
    Object? setCbxQty = freezed,
    Object? wrkCfmDttm = freezed,
    Object? tagNo = freezed,
    Object? itemCd = freezed,
    Object? scanYn = freezed,
    Object? cbxExNo = freezed,
    Object? pitmCd = freezed,
    Object? wrkQty = freezed,
    Object? pkgNo = freezed,
    Object? cbxQty = freezed,
    Object? cbxExSeq = freezed,
    Object? totWrkNo = freezed,
    Object? setQty = freezed,
    Object? wrkItemNm = freezed,
    Object? wrkQtySync = freezed,
    Object? dWrkQty = freezed,
    Object? pdtNo = freezed,
    Object? qtyUnit = freezed,
    Object? itemNmNonKit = freezed,
    Object? wksNo = freezed,
    Object? ncbxRmk = freezed,
  }) {
    return _then(_value.copyWith(
      scanNo: freezed == scanNo
          ? _value.scanNo
          : scanNo // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pkgSeq: freezed == pkgSeq
          ? _value.pkgSeq
          : pkgSeq // ignore: cast_nullable_to_non_nullable
              as dynamic,
      scanSeq: freezed == scanSeq
          ? _value.scanSeq
          : scanSeq // ignore: cast_nullable_to_non_nullable
              as dynamic,
      dTagNo: freezed == dTagNo
          ? _value.dTagNo
          : dTagNo // ignore: cast_nullable_to_non_nullable
              as dynamic,
      syncYn: null == syncYn
          ? _value.syncYn
          : syncYn // ignore: cast_nullable_to_non_nullable
              as String,
      remark: freezed == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pitmNm: freezed == pitmNm
          ? _value.pitmNm
          : pitmNm // ignore: cast_nullable_to_non_nullable
              as dynamic,
      itemNm: freezed == itemNm
          ? _value.itemNm
          : itemNm // ignore: cast_nullable_to_non_nullable
              as dynamic,
      wrkRemark: freezed == wrkRemark
          ? _value.wrkRemark
          : wrkRemark // ignore: cast_nullable_to_non_nullable
              as dynamic,
      wrkItemCd: freezed == wrkItemCd
          ? _value.wrkItemCd
          : wrkItemCd // ignore: cast_nullable_to_non_nullable
              as dynamic,
      dScanNo: freezed == dScanNo
          ? _value.dScanNo
          : dScanNo // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pjtNm2: freezed == pjtNm2
          ? _value.pjtNm2
          : pjtNm2 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      wrkCfmYn: freezed == wrkCfmYn
          ? _value.wrkCfmYn
          : wrkCfmYn // ignore: cast_nullable_to_non_nullable
              as dynamic,
      setCbxQty: freezed == setCbxQty
          ? _value.setCbxQty
          : setCbxQty // ignore: cast_nullable_to_non_nullable
              as dynamic,
      wrkCfmDttm: freezed == wrkCfmDttm
          ? _value.wrkCfmDttm
          : wrkCfmDttm // ignore: cast_nullable_to_non_nullable
              as dynamic,
      tagNo: freezed == tagNo
          ? _value.tagNo
          : tagNo // ignore: cast_nullable_to_non_nullable
              as dynamic,
      itemCd: freezed == itemCd
          ? _value.itemCd
          : itemCd // ignore: cast_nullable_to_non_nullable
              as dynamic,
      scanYn: freezed == scanYn
          ? _value.scanYn
          : scanYn // ignore: cast_nullable_to_non_nullable
              as dynamic,
      cbxExNo: freezed == cbxExNo
          ? _value.cbxExNo
          : cbxExNo // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pitmCd: freezed == pitmCd
          ? _value.pitmCd
          : pitmCd // ignore: cast_nullable_to_non_nullable
              as dynamic,
      wrkQty: freezed == wrkQty
          ? _value.wrkQty
          : wrkQty // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pkgNo: freezed == pkgNo
          ? _value.pkgNo
          : pkgNo // ignore: cast_nullable_to_non_nullable
              as dynamic,
      cbxQty: freezed == cbxQty
          ? _value.cbxQty
          : cbxQty // ignore: cast_nullable_to_non_nullable
              as dynamic,
      cbxExSeq: freezed == cbxExSeq
          ? _value.cbxExSeq
          : cbxExSeq // ignore: cast_nullable_to_non_nullable
              as dynamic,
      totWrkNo: freezed == totWrkNo
          ? _value.totWrkNo
          : totWrkNo // ignore: cast_nullable_to_non_nullable
              as dynamic,
      setQty: freezed == setQty
          ? _value.setQty
          : setQty // ignore: cast_nullable_to_non_nullable
              as dynamic,
      wrkItemNm: freezed == wrkItemNm
          ? _value.wrkItemNm
          : wrkItemNm // ignore: cast_nullable_to_non_nullable
              as dynamic,
      wrkQtySync: freezed == wrkQtySync
          ? _value.wrkQtySync
          : wrkQtySync // ignore: cast_nullable_to_non_nullable
              as dynamic,
      dWrkQty: freezed == dWrkQty
          ? _value.dWrkQty
          : dWrkQty // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pdtNo: freezed == pdtNo
          ? _value.pdtNo
          : pdtNo // ignore: cast_nullable_to_non_nullable
              as dynamic,
      qtyUnit: freezed == qtyUnit
          ? _value.qtyUnit
          : qtyUnit // ignore: cast_nullable_to_non_nullable
              as dynamic,
      itemNmNonKit: freezed == itemNmNonKit
          ? _value.itemNmNonKit
          : itemNmNonKit // ignore: cast_nullable_to_non_nullable
              as dynamic,
      wksNo: freezed == wksNo
          ? _value.wksNo
          : wksNo // ignore: cast_nullable_to_non_nullable
              as dynamic,
      ncbxRmk: freezed == ncbxRmk
          ? _value.ncbxRmk
          : ncbxRmk // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
      {dynamic scanNo,
      dynamic pkgSeq,
      dynamic scanSeq,
      dynamic dTagNo,
      String syncYn,
      dynamic remark,
      dynamic pitmNm,
      dynamic itemNm,
      dynamic wrkRemark,
      dynamic wrkItemCd,
      dynamic dScanNo,
      dynamic pjtNm2,
      dynamic wrkCfmYn,
      dynamic setCbxQty,
      dynamic wrkCfmDttm,
      dynamic tagNo,
      dynamic itemCd,
      dynamic scanYn,
      dynamic cbxExNo,
      dynamic pitmCd,
      dynamic wrkQty,
      dynamic pkgNo,
      dynamic cbxQty,
      dynamic cbxExSeq,
      dynamic totWrkNo,
      dynamic setQty,
      dynamic wrkItemNm,
      dynamic wrkQtySync,
      dynamic dWrkQty,
      dynamic pdtNo,
      dynamic qtyUnit,
      dynamic itemNmNonKit,
      dynamic wksNo,
      dynamic ncbxRmk});
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
    Object? scanNo = freezed,
    Object? pkgSeq = freezed,
    Object? scanSeq = freezed,
    Object? dTagNo = freezed,
    Object? syncYn = null,
    Object? remark = freezed,
    Object? pitmNm = freezed,
    Object? itemNm = freezed,
    Object? wrkRemark = freezed,
    Object? wrkItemCd = freezed,
    Object? dScanNo = freezed,
    Object? pjtNm2 = freezed,
    Object? wrkCfmYn = freezed,
    Object? setCbxQty = freezed,
    Object? wrkCfmDttm = freezed,
    Object? tagNo = freezed,
    Object? itemCd = freezed,
    Object? scanYn = freezed,
    Object? cbxExNo = freezed,
    Object? pitmCd = freezed,
    Object? wrkQty = freezed,
    Object? pkgNo = freezed,
    Object? cbxQty = freezed,
    Object? cbxExSeq = freezed,
    Object? totWrkNo = freezed,
    Object? setQty = freezed,
    Object? wrkItemNm = freezed,
    Object? wrkQtySync = freezed,
    Object? dWrkQty = freezed,
    Object? pdtNo = freezed,
    Object? qtyUnit = freezed,
    Object? itemNmNonKit = freezed,
    Object? wksNo = freezed,
    Object? ncbxRmk = freezed,
  }) {
    return _then(_$ItemDataImpl(
      scanNo: freezed == scanNo ? _value.scanNo! : scanNo,
      pkgSeq: freezed == pkgSeq ? _value.pkgSeq! : pkgSeq,
      scanSeq: freezed == scanSeq ? _value.scanSeq! : scanSeq,
      dTagNo: freezed == dTagNo ? _value.dTagNo! : dTagNo,
      syncYn: null == syncYn
          ? _value.syncYn
          : syncYn // ignore: cast_nullable_to_non_nullable
              as String,
      remark: freezed == remark ? _value.remark! : remark,
      pitmNm: freezed == pitmNm ? _value.pitmNm! : pitmNm,
      itemNm: freezed == itemNm ? _value.itemNm! : itemNm,
      wrkRemark: freezed == wrkRemark ? _value.wrkRemark! : wrkRemark,
      wrkItemCd: freezed == wrkItemCd ? _value.wrkItemCd! : wrkItemCd,
      dScanNo: freezed == dScanNo ? _value.dScanNo! : dScanNo,
      pjtNm2: freezed == pjtNm2 ? _value.pjtNm2! : pjtNm2,
      wrkCfmYn: freezed == wrkCfmYn ? _value.wrkCfmYn! : wrkCfmYn,
      setCbxQty: freezed == setCbxQty ? _value.setCbxQty! : setCbxQty,
      wrkCfmDttm: freezed == wrkCfmDttm ? _value.wrkCfmDttm! : wrkCfmDttm,
      tagNo: freezed == tagNo ? _value.tagNo! : tagNo,
      itemCd: freezed == itemCd ? _value.itemCd! : itemCd,
      scanYn: freezed == scanYn ? _value.scanYn! : scanYn,
      cbxExNo: freezed == cbxExNo ? _value.cbxExNo! : cbxExNo,
      pitmCd: freezed == pitmCd ? _value.pitmCd! : pitmCd,
      wrkQty: freezed == wrkQty ? _value.wrkQty! : wrkQty,
      pkgNo: freezed == pkgNo ? _value.pkgNo! : pkgNo,
      cbxQty: freezed == cbxQty ? _value.cbxQty! : cbxQty,
      cbxExSeq: freezed == cbxExSeq ? _value.cbxExSeq! : cbxExSeq,
      totWrkNo: freezed == totWrkNo ? _value.totWrkNo! : totWrkNo,
      setQty: freezed == setQty ? _value.setQty! : setQty,
      wrkItemNm: freezed == wrkItemNm ? _value.wrkItemNm! : wrkItemNm,
      wrkQtySync: freezed == wrkQtySync ? _value.wrkQtySync! : wrkQtySync,
      dWrkQty: freezed == dWrkQty ? _value.dWrkQty! : dWrkQty,
      pdtNo: freezed == pdtNo ? _value.pdtNo! : pdtNo,
      qtyUnit: freezed == qtyUnit ? _value.qtyUnit! : qtyUnit,
      itemNmNonKit:
          freezed == itemNmNonKit ? _value.itemNmNonKit! : itemNmNonKit,
      wksNo: freezed == wksNo ? _value.wksNo! : wksNo,
      ncbxRmk: freezed == ncbxRmk ? _value.ncbxRmk! : ncbxRmk,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemDataImpl implements _ItemData {
  const _$ItemDataImpl(
      {this.scanNo = '',
      this.pkgSeq = 0,
      this.scanSeq = 0,
      this.dTagNo = '',
      this.syncYn = '',
      this.remark = '',
      this.pitmNm = '',
      this.itemNm = '',
      this.wrkRemark = '',
      this.wrkItemCd = '',
      this.dScanNo = '',
      this.pjtNm2 = '',
      this.wrkCfmYn = '',
      this.setCbxQty = 0.0,
      this.wrkCfmDttm = '',
      this.tagNo = '',
      this.itemCd = '',
      this.scanYn = '',
      this.cbxExNo = '',
      this.pitmCd = '',
      this.wrkQty = 0,
      this.pkgNo = '',
      this.cbxQty = 0,
      this.cbxExSeq = 0,
      this.totWrkNo = '',
      this.setQty = 0,
      this.wrkItemNm = '',
      this.wrkQtySync = 0,
      this.dWrkQty = 0,
      this.pdtNo = '',
      this.qtyUnit = '',
      this.itemNmNonKit = '',
      this.wksNo = '',
      this.ncbxRmk = ''});

  factory _$ItemDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemDataImplFromJson(json);

  @override
  @JsonKey()
  final dynamic scanNo;
  @override
  @JsonKey()
  final dynamic pkgSeq;
  @override
  @JsonKey()
  final dynamic scanSeq;
  @override
  @JsonKey()
  final dynamic dTagNo;
  @override
  @JsonKey()
  final String syncYn;
  @override
  @JsonKey()
  final dynamic remark;
  @override
  @JsonKey()
  final dynamic pitmNm;
  @override
  @JsonKey()
  final dynamic itemNm;
  @override
  @JsonKey()
  final dynamic wrkRemark;
  @override
  @JsonKey()
  final dynamic wrkItemCd;
  @override
  @JsonKey()
  final dynamic dScanNo;
  @override
  @JsonKey()
  final dynamic pjtNm2;
  @override
  @JsonKey()
  final dynamic wrkCfmYn;
  @override
  @JsonKey()
  final dynamic setCbxQty;
  @override
  @JsonKey()
  final dynamic wrkCfmDttm;
  @override
  @JsonKey()
  final dynamic tagNo;
  @override
  @JsonKey()
  final dynamic itemCd;
  @override
  @JsonKey()
  final dynamic scanYn;
  @override
  @JsonKey()
  final dynamic cbxExNo;
  @override
  @JsonKey()
  final dynamic pitmCd;
  @override
  @JsonKey()
  final dynamic wrkQty;
  @override
  @JsonKey()
  final dynamic pkgNo;
  @override
  @JsonKey()
  final dynamic cbxQty;
  @override
  @JsonKey()
  final dynamic cbxExSeq;
  @override
  @JsonKey()
  final dynamic totWrkNo;
  @override
  @JsonKey()
  final dynamic setQty;
  @override
  @JsonKey()
  final dynamic wrkItemNm;
  @override
  @JsonKey()
  final dynamic wrkQtySync;
  @override
  @JsonKey()
  final dynamic dWrkQty;
  @override
  @JsonKey()
  final dynamic pdtNo;
  @override
  @JsonKey()
  final dynamic qtyUnit;
  @override
  @JsonKey()
  final dynamic itemNmNonKit;
  @override
  @JsonKey()
  final dynamic wksNo;
  @override
  @JsonKey()
  final dynamic ncbxRmk;

  @override
  String toString() {
    return 'ItemData(scanNo: $scanNo, pkgSeq: $pkgSeq, scanSeq: $scanSeq, dTagNo: $dTagNo, syncYn: $syncYn, remark: $remark, pitmNm: $pitmNm, itemNm: $itemNm, wrkRemark: $wrkRemark, wrkItemCd: $wrkItemCd, dScanNo: $dScanNo, pjtNm2: $pjtNm2, wrkCfmYn: $wrkCfmYn, setCbxQty: $setCbxQty, wrkCfmDttm: $wrkCfmDttm, tagNo: $tagNo, itemCd: $itemCd, scanYn: $scanYn, cbxExNo: $cbxExNo, pitmCd: $pitmCd, wrkQty: $wrkQty, pkgNo: $pkgNo, cbxQty: $cbxQty, cbxExSeq: $cbxExSeq, totWrkNo: $totWrkNo, setQty: $setQty, wrkItemNm: $wrkItemNm, wrkQtySync: $wrkQtySync, dWrkQty: $dWrkQty, pdtNo: $pdtNo, qtyUnit: $qtyUnit, itemNmNonKit: $itemNmNonKit, wksNo: $wksNo, ncbxRmk: $ncbxRmk)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemDataImpl &&
            const DeepCollectionEquality().equals(other.scanNo, scanNo) &&
            const DeepCollectionEquality().equals(other.pkgSeq, pkgSeq) &&
            const DeepCollectionEquality().equals(other.scanSeq, scanSeq) &&
            const DeepCollectionEquality().equals(other.dTagNo, dTagNo) &&
            (identical(other.syncYn, syncYn) || other.syncYn == syncYn) &&
            const DeepCollectionEquality().equals(other.remark, remark) &&
            const DeepCollectionEquality().equals(other.pitmNm, pitmNm) &&
            const DeepCollectionEquality().equals(other.itemNm, itemNm) &&
            const DeepCollectionEquality().equals(other.wrkRemark, wrkRemark) &&
            const DeepCollectionEquality().equals(other.wrkItemCd, wrkItemCd) &&
            const DeepCollectionEquality().equals(other.dScanNo, dScanNo) &&
            const DeepCollectionEquality().equals(other.pjtNm2, pjtNm2) &&
            const DeepCollectionEquality().equals(other.wrkCfmYn, wrkCfmYn) &&
            const DeepCollectionEquality().equals(other.setCbxQty, setCbxQty) &&
            const DeepCollectionEquality()
                .equals(other.wrkCfmDttm, wrkCfmDttm) &&
            const DeepCollectionEquality().equals(other.tagNo, tagNo) &&
            const DeepCollectionEquality().equals(other.itemCd, itemCd) &&
            const DeepCollectionEquality().equals(other.scanYn, scanYn) &&
            const DeepCollectionEquality().equals(other.cbxExNo, cbxExNo) &&
            const DeepCollectionEquality().equals(other.pitmCd, pitmCd) &&
            const DeepCollectionEquality().equals(other.wrkQty, wrkQty) &&
            const DeepCollectionEquality().equals(other.pkgNo, pkgNo) &&
            const DeepCollectionEquality().equals(other.cbxQty, cbxQty) &&
            const DeepCollectionEquality().equals(other.cbxExSeq, cbxExSeq) &&
            const DeepCollectionEquality().equals(other.totWrkNo, totWrkNo) &&
            const DeepCollectionEquality().equals(other.setQty, setQty) &&
            const DeepCollectionEquality().equals(other.wrkItemNm, wrkItemNm) &&
            const DeepCollectionEquality()
                .equals(other.wrkQtySync, wrkQtySync) &&
            const DeepCollectionEquality().equals(other.dWrkQty, dWrkQty) &&
            const DeepCollectionEquality().equals(other.pdtNo, pdtNo) &&
            const DeepCollectionEquality().equals(other.qtyUnit, qtyUnit) &&
            const DeepCollectionEquality()
                .equals(other.itemNmNonKit, itemNmNonKit) &&
            const DeepCollectionEquality().equals(other.wksNo, wksNo) &&
            const DeepCollectionEquality().equals(other.ncbxRmk, ncbxRmk));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(scanNo),
        const DeepCollectionEquality().hash(pkgSeq),
        const DeepCollectionEquality().hash(scanSeq),
        const DeepCollectionEquality().hash(dTagNo),
        syncYn,
        const DeepCollectionEquality().hash(remark),
        const DeepCollectionEquality().hash(pitmNm),
        const DeepCollectionEquality().hash(itemNm),
        const DeepCollectionEquality().hash(wrkRemark),
        const DeepCollectionEquality().hash(wrkItemCd),
        const DeepCollectionEquality().hash(dScanNo),
        const DeepCollectionEquality().hash(pjtNm2),
        const DeepCollectionEquality().hash(wrkCfmYn),
        const DeepCollectionEquality().hash(setCbxQty),
        const DeepCollectionEquality().hash(wrkCfmDttm),
        const DeepCollectionEquality().hash(tagNo),
        const DeepCollectionEquality().hash(itemCd),
        const DeepCollectionEquality().hash(scanYn),
        const DeepCollectionEquality().hash(cbxExNo),
        const DeepCollectionEquality().hash(pitmCd),
        const DeepCollectionEquality().hash(wrkQty),
        const DeepCollectionEquality().hash(pkgNo),
        const DeepCollectionEquality().hash(cbxQty),
        const DeepCollectionEquality().hash(cbxExSeq),
        const DeepCollectionEquality().hash(totWrkNo),
        const DeepCollectionEquality().hash(setQty),
        const DeepCollectionEquality().hash(wrkItemNm),
        const DeepCollectionEquality().hash(wrkQtySync),
        const DeepCollectionEquality().hash(dWrkQty),
        const DeepCollectionEquality().hash(pdtNo),
        const DeepCollectionEquality().hash(qtyUnit),
        const DeepCollectionEquality().hash(itemNmNonKit),
        const DeepCollectionEquality().hash(wksNo),
        const DeepCollectionEquality().hash(ncbxRmk)
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
  const factory _ItemData(
      {final dynamic scanNo,
      final dynamic pkgSeq,
      final dynamic scanSeq,
      final dynamic dTagNo,
      final String syncYn,
      final dynamic remark,
      final dynamic pitmNm,
      final dynamic itemNm,
      final dynamic wrkRemark,
      final dynamic wrkItemCd,
      final dynamic dScanNo,
      final dynamic pjtNm2,
      final dynamic wrkCfmYn,
      final dynamic setCbxQty,
      final dynamic wrkCfmDttm,
      final dynamic tagNo,
      final dynamic itemCd,
      final dynamic scanYn,
      final dynamic cbxExNo,
      final dynamic pitmCd,
      final dynamic wrkQty,
      final dynamic pkgNo,
      final dynamic cbxQty,
      final dynamic cbxExSeq,
      final dynamic totWrkNo,
      final dynamic setQty,
      final dynamic wrkItemNm,
      final dynamic wrkQtySync,
      final dynamic dWrkQty,
      final dynamic pdtNo,
      final dynamic qtyUnit,
      final dynamic itemNmNonKit,
      final dynamic wksNo,
      final dynamic ncbxRmk}) = _$ItemDataImpl;

  factory _ItemData.fromJson(Map<String, dynamic> json) =
      _$ItemDataImpl.fromJson;

  @override
  dynamic get scanNo;
  @override
  dynamic get pkgSeq;
  @override
  dynamic get scanSeq;
  @override
  dynamic get dTagNo;
  @override
  String get syncYn;
  @override
  dynamic get remark;
  @override
  dynamic get pitmNm;
  @override
  dynamic get itemNm;
  @override
  dynamic get wrkRemark;
  @override
  dynamic get wrkItemCd;
  @override
  dynamic get dScanNo;
  @override
  dynamic get pjtNm2;
  @override
  dynamic get wrkCfmYn;
  @override
  dynamic get setCbxQty;
  @override
  dynamic get wrkCfmDttm;
  @override
  dynamic get tagNo;
  @override
  dynamic get itemCd;
  @override
  dynamic get scanYn;
  @override
  dynamic get cbxExNo;
  @override
  dynamic get pitmCd;
  @override
  dynamic get wrkQty;
  @override
  dynamic get pkgNo;
  @override
  dynamic get cbxQty;
  @override
  dynamic get cbxExSeq;
  @override
  dynamic get totWrkNo;
  @override
  dynamic get setQty;
  @override
  dynamic get wrkItemNm;
  @override
  dynamic get wrkQtySync;
  @override
  dynamic get dWrkQty;
  @override
  dynamic get pdtNo;
  @override
  dynamic get qtyUnit;
  @override
  dynamic get itemNmNonKit;
  @override
  dynamic get wksNo;
  @override
  dynamic get ncbxRmk;
  @override
  @JsonKey(ignore: true)
  _$$ItemDataImplCopyWith<_$ItemDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
