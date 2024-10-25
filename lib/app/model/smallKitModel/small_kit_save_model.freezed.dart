// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'small_kit_save_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SmallKitSaveModel _$SmallKitSaveModelFromJson(Map<String, dynamic> json) {
  return _SmallKitSaveModel.fromJson(json);
}

/// @nodoc
mixin _$SmallKitSaveModel {
  Header? get header => throw _privateConstructorUsedError;
  String get resultCode => throw _privateConstructorUsedError;
  String get resultMessage => throw _privateConstructorUsedError;
  List<dynamic>? get body => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SmallKitSaveModelCopyWith<SmallKitSaveModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SmallKitSaveModelCopyWith<$Res> {
  factory $SmallKitSaveModelCopyWith(
          SmallKitSaveModel value, $Res Function(SmallKitSaveModel) then) =
      _$SmallKitSaveModelCopyWithImpl<$Res, SmallKitSaveModel>;
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
class _$SmallKitSaveModelCopyWithImpl<$Res, $Val extends SmallKitSaveModel>
    implements $SmallKitSaveModelCopyWith<$Res> {
  _$SmallKitSaveModelCopyWithImpl(this._value, this._then);

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
abstract class _$$SmallKitSaveModelImplCopyWith<$Res>
    implements $SmallKitSaveModelCopyWith<$Res> {
  factory _$$SmallKitSaveModelImplCopyWith(_$SmallKitSaveModelImpl value,
          $Res Function(_$SmallKitSaveModelImpl) then) =
      __$$SmallKitSaveModelImplCopyWithImpl<$Res>;
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
class __$$SmallKitSaveModelImplCopyWithImpl<$Res>
    extends _$SmallKitSaveModelCopyWithImpl<$Res, _$SmallKitSaveModelImpl>
    implements _$$SmallKitSaveModelImplCopyWith<$Res> {
  __$$SmallKitSaveModelImplCopyWithImpl(_$SmallKitSaveModelImpl _value,
      $Res Function(_$SmallKitSaveModelImpl) _then)
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
    return _then(_$SmallKitSaveModelImpl(
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
class _$SmallKitSaveModelImpl implements _SmallKitSaveModel {
  _$SmallKitSaveModelImpl(
      {this.header,
      this.resultCode = '',
      this.resultMessage = '',
      final List<dynamic>? body,
      this.hasError = false})
      : _body = body;

  factory _$SmallKitSaveModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SmallKitSaveModelImplFromJson(json);

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
    return 'SmallKitSaveModel(header: $header, resultCode: $resultCode, resultMessage: $resultMessage, body: $body, hasError: $hasError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SmallKitSaveModelImpl &&
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
  _$$SmallKitSaveModelImplCopyWith<_$SmallKitSaveModelImpl> get copyWith =>
      __$$SmallKitSaveModelImplCopyWithImpl<_$SmallKitSaveModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SmallKitSaveModelImplToJson(
      this,
    );
  }
}

abstract class _SmallKitSaveModel implements SmallKitSaveModel {
  factory _SmallKitSaveModel(
      {final Header? header,
      final String resultCode,
      final String resultMessage,
      final List<dynamic>? body,
      final bool hasError}) = _$SmallKitSaveModelImpl;

  factory _SmallKitSaveModel.fromJson(Map<String, dynamic> json) =
      _$SmallKitSaveModelImpl.fromJson;

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
  _$$SmallKitSaveModelImplCopyWith<_$SmallKitSaveModelImpl> get copyWith =>
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
  factory _Header(
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
  List<InnerBodyItem>? get innerBody => throw _privateConstructorUsedError;

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
      String returnMessage,
      List<InnerBodyItem>? innerBody});
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
    Object? innerBody = freezed,
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
      innerBody: freezed == innerBody
          ? _value.innerBody
          : innerBody // ignore: cast_nullable_to_non_nullable
              as List<InnerBodyItem>?,
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
      String returnMessage,
      List<InnerBodyItem>? innerBody});
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
    Object? innerBody = freezed,
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
      innerBody: freezed == innerBody
          ? _value._innerBody
          : innerBody // ignore: cast_nullable_to_non_nullable
              as List<InnerBodyItem>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BodyItemImpl implements _BodyItem {
  _$BodyItemImpl(
      {this.resultValue = true,
      this.resultRowCount = 0,
      this.resultCode = '',
      this.resultMessage = '',
      this.errorState = '',
      this.errorProcedure = '',
      this.returnMessage = '',
      final List<InnerBodyItem>? innerBody})
      : _innerBody = innerBody;

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
  final List<InnerBodyItem>? _innerBody;
  @override
  List<InnerBodyItem>? get innerBody {
    final value = _innerBody;
    if (value == null) return null;
    if (_innerBody is EqualUnmodifiableListView) return _innerBody;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'BodyItem(resultValue: $resultValue, resultRowCount: $resultRowCount, resultCode: $resultCode, resultMessage: $resultMessage, errorState: $errorState, errorProcedure: $errorProcedure, returnMessage: $returnMessage, innerBody: $innerBody)';
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
                other.returnMessage == returnMessage) &&
            const DeepCollectionEquality()
                .equals(other._innerBody, _innerBody));
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
      const DeepCollectionEquality().hash(_innerBody));

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
  factory _BodyItem(
      {final bool resultValue,
      final int resultRowCount,
      final String resultCode,
      final String resultMessage,
      final String errorState,
      final String errorProcedure,
      final String returnMessage,
      final List<InnerBodyItem>? innerBody}) = _$BodyItemImpl;

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
  List<InnerBodyItem>? get innerBody;
  @override
  @JsonKey(ignore: true)
  _$$BodyItemImplCopyWith<_$BodyItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InnerBodyItem _$InnerBodyItemFromJson(Map<String, dynamic> json) {
  return _InnerBodyItem.fromJson(json);
}

/// @nodoc
mixin _$InnerBodyItem {
  String get wht => throw _privateConstructorUsedError;
  String get custCd => throw _privateConstructorUsedError;
  String get extrVal => throw _privateConstructorUsedError;
  String get pjtNm => throw _privateConstructorUsedError;
  String get pjtNo => throw _privateConstructorUsedError;
  String get expDt => throw _privateConstructorUsedError;
  String get remark => throw _privateConstructorUsedError;
  String get prtNo => throw _privateConstructorUsedError;
  String get itemNm => throw _privateConstructorUsedError;
  String get lotNo => throw _privateConstructorUsedError;
  String get locDt => throw _privateConstructorUsedError;
  String get tagType => throw _privateConstructorUsedError;
  String get vendNm => throw _privateConstructorUsedError;
  String get dQty => throw _privateConstructorUsedError;
  String get locCd => throw _privateConstructorUsedError;
  String get inbYn => throw _privateConstructorUsedError;
  String get itemCd => throw _privateConstructorUsedError;
  String get tagNo => throw _privateConstructorUsedError;
  String get totWht => throw _privateConstructorUsedError;
  String get whtUnit => throw _privateConstructorUsedError;
  String get boxNm => throw _privateConstructorUsedError;
  String get boxNo => throw _privateConstructorUsedError;
  String get setQty => throw _privateConstructorUsedError;
  String get boxWht => throw _privateConstructorUsedError;
  String get qrNo => throw _privateConstructorUsedError;
  double get qty => throw _privateConstructorUsedError;
  String get vendCd => throw _privateConstructorUsedError;
  String get qtyUnit => throw _privateConstructorUsedError;
  String get prtDt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InnerBodyItemCopyWith<InnerBodyItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InnerBodyItemCopyWith<$Res> {
  factory $InnerBodyItemCopyWith(
          InnerBodyItem value, $Res Function(InnerBodyItem) then) =
      _$InnerBodyItemCopyWithImpl<$Res, InnerBodyItem>;
  @useResult
  $Res call(
      {String wht,
      String custCd,
      String extrVal,
      String pjtNm,
      String pjtNo,
      String expDt,
      String remark,
      String prtNo,
      String itemNm,
      String lotNo,
      String locDt,
      String tagType,
      String vendNm,
      String dQty,
      String locCd,
      String inbYn,
      String itemCd,
      String tagNo,
      String totWht,
      String whtUnit,
      String boxNm,
      String boxNo,
      String setQty,
      String boxWht,
      String qrNo,
      double qty,
      String vendCd,
      String qtyUnit,
      String prtDt});
}

/// @nodoc
class _$InnerBodyItemCopyWithImpl<$Res, $Val extends InnerBodyItem>
    implements $InnerBodyItemCopyWith<$Res> {
  _$InnerBodyItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wht = null,
    Object? custCd = null,
    Object? extrVal = null,
    Object? pjtNm = null,
    Object? pjtNo = null,
    Object? expDt = null,
    Object? remark = null,
    Object? prtNo = null,
    Object? itemNm = null,
    Object? lotNo = null,
    Object? locDt = null,
    Object? tagType = null,
    Object? vendNm = null,
    Object? dQty = null,
    Object? locCd = null,
    Object? inbYn = null,
    Object? itemCd = null,
    Object? tagNo = null,
    Object? totWht = null,
    Object? whtUnit = null,
    Object? boxNm = null,
    Object? boxNo = null,
    Object? setQty = null,
    Object? boxWht = null,
    Object? qrNo = null,
    Object? qty = null,
    Object? vendCd = null,
    Object? qtyUnit = null,
    Object? prtDt = null,
  }) {
    return _then(_value.copyWith(
      wht: null == wht
          ? _value.wht
          : wht // ignore: cast_nullable_to_non_nullable
              as String,
      custCd: null == custCd
          ? _value.custCd
          : custCd // ignore: cast_nullable_to_non_nullable
              as String,
      extrVal: null == extrVal
          ? _value.extrVal
          : extrVal // ignore: cast_nullable_to_non_nullable
              as String,
      pjtNm: null == pjtNm
          ? _value.pjtNm
          : pjtNm // ignore: cast_nullable_to_non_nullable
              as String,
      pjtNo: null == pjtNo
          ? _value.pjtNo
          : pjtNo // ignore: cast_nullable_to_non_nullable
              as String,
      expDt: null == expDt
          ? _value.expDt
          : expDt // ignore: cast_nullable_to_non_nullable
              as String,
      remark: null == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
      prtNo: null == prtNo
          ? _value.prtNo
          : prtNo // ignore: cast_nullable_to_non_nullable
              as String,
      itemNm: null == itemNm
          ? _value.itemNm
          : itemNm // ignore: cast_nullable_to_non_nullable
              as String,
      lotNo: null == lotNo
          ? _value.lotNo
          : lotNo // ignore: cast_nullable_to_non_nullable
              as String,
      locDt: null == locDt
          ? _value.locDt
          : locDt // ignore: cast_nullable_to_non_nullable
              as String,
      tagType: null == tagType
          ? _value.tagType
          : tagType // ignore: cast_nullable_to_non_nullable
              as String,
      vendNm: null == vendNm
          ? _value.vendNm
          : vendNm // ignore: cast_nullable_to_non_nullable
              as String,
      dQty: null == dQty
          ? _value.dQty
          : dQty // ignore: cast_nullable_to_non_nullable
              as String,
      locCd: null == locCd
          ? _value.locCd
          : locCd // ignore: cast_nullable_to_non_nullable
              as String,
      inbYn: null == inbYn
          ? _value.inbYn
          : inbYn // ignore: cast_nullable_to_non_nullable
              as String,
      itemCd: null == itemCd
          ? _value.itemCd
          : itemCd // ignore: cast_nullable_to_non_nullable
              as String,
      tagNo: null == tagNo
          ? _value.tagNo
          : tagNo // ignore: cast_nullable_to_non_nullable
              as String,
      totWht: null == totWht
          ? _value.totWht
          : totWht // ignore: cast_nullable_to_non_nullable
              as String,
      whtUnit: null == whtUnit
          ? _value.whtUnit
          : whtUnit // ignore: cast_nullable_to_non_nullable
              as String,
      boxNm: null == boxNm
          ? _value.boxNm
          : boxNm // ignore: cast_nullable_to_non_nullable
              as String,
      boxNo: null == boxNo
          ? _value.boxNo
          : boxNo // ignore: cast_nullable_to_non_nullable
              as String,
      setQty: null == setQty
          ? _value.setQty
          : setQty // ignore: cast_nullable_to_non_nullable
              as String,
      boxWht: null == boxWht
          ? _value.boxWht
          : boxWht // ignore: cast_nullable_to_non_nullable
              as String,
      qrNo: null == qrNo
          ? _value.qrNo
          : qrNo // ignore: cast_nullable_to_non_nullable
              as String,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as double,
      vendCd: null == vendCd
          ? _value.vendCd
          : vendCd // ignore: cast_nullable_to_non_nullable
              as String,
      qtyUnit: null == qtyUnit
          ? _value.qtyUnit
          : qtyUnit // ignore: cast_nullable_to_non_nullable
              as String,
      prtDt: null == prtDt
          ? _value.prtDt
          : prtDt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InnerBodyItemImplCopyWith<$Res>
    implements $InnerBodyItemCopyWith<$Res> {
  factory _$$InnerBodyItemImplCopyWith(
          _$InnerBodyItemImpl value, $Res Function(_$InnerBodyItemImpl) then) =
      __$$InnerBodyItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String wht,
      String custCd,
      String extrVal,
      String pjtNm,
      String pjtNo,
      String expDt,
      String remark,
      String prtNo,
      String itemNm,
      String lotNo,
      String locDt,
      String tagType,
      String vendNm,
      String dQty,
      String locCd,
      String inbYn,
      String itemCd,
      String tagNo,
      String totWht,
      String whtUnit,
      String boxNm,
      String boxNo,
      String setQty,
      String boxWht,
      String qrNo,
      double qty,
      String vendCd,
      String qtyUnit,
      String prtDt});
}

/// @nodoc
class __$$InnerBodyItemImplCopyWithImpl<$Res>
    extends _$InnerBodyItemCopyWithImpl<$Res, _$InnerBodyItemImpl>
    implements _$$InnerBodyItemImplCopyWith<$Res> {
  __$$InnerBodyItemImplCopyWithImpl(
      _$InnerBodyItemImpl _value, $Res Function(_$InnerBodyItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wht = null,
    Object? custCd = null,
    Object? extrVal = null,
    Object? pjtNm = null,
    Object? pjtNo = null,
    Object? expDt = null,
    Object? remark = null,
    Object? prtNo = null,
    Object? itemNm = null,
    Object? lotNo = null,
    Object? locDt = null,
    Object? tagType = null,
    Object? vendNm = null,
    Object? dQty = null,
    Object? locCd = null,
    Object? inbYn = null,
    Object? itemCd = null,
    Object? tagNo = null,
    Object? totWht = null,
    Object? whtUnit = null,
    Object? boxNm = null,
    Object? boxNo = null,
    Object? setQty = null,
    Object? boxWht = null,
    Object? qrNo = null,
    Object? qty = null,
    Object? vendCd = null,
    Object? qtyUnit = null,
    Object? prtDt = null,
  }) {
    return _then(_$InnerBodyItemImpl(
      wht: null == wht
          ? _value.wht
          : wht // ignore: cast_nullable_to_non_nullable
              as String,
      custCd: null == custCd
          ? _value.custCd
          : custCd // ignore: cast_nullable_to_non_nullable
              as String,
      extrVal: null == extrVal
          ? _value.extrVal
          : extrVal // ignore: cast_nullable_to_non_nullable
              as String,
      pjtNm: null == pjtNm
          ? _value.pjtNm
          : pjtNm // ignore: cast_nullable_to_non_nullable
              as String,
      pjtNo: null == pjtNo
          ? _value.pjtNo
          : pjtNo // ignore: cast_nullable_to_non_nullable
              as String,
      expDt: null == expDt
          ? _value.expDt
          : expDt // ignore: cast_nullable_to_non_nullable
              as String,
      remark: null == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
      prtNo: null == prtNo
          ? _value.prtNo
          : prtNo // ignore: cast_nullable_to_non_nullable
              as String,
      itemNm: null == itemNm
          ? _value.itemNm
          : itemNm // ignore: cast_nullable_to_non_nullable
              as String,
      lotNo: null == lotNo
          ? _value.lotNo
          : lotNo // ignore: cast_nullable_to_non_nullable
              as String,
      locDt: null == locDt
          ? _value.locDt
          : locDt // ignore: cast_nullable_to_non_nullable
              as String,
      tagType: null == tagType
          ? _value.tagType
          : tagType // ignore: cast_nullable_to_non_nullable
              as String,
      vendNm: null == vendNm
          ? _value.vendNm
          : vendNm // ignore: cast_nullable_to_non_nullable
              as String,
      dQty: null == dQty
          ? _value.dQty
          : dQty // ignore: cast_nullable_to_non_nullable
              as String,
      locCd: null == locCd
          ? _value.locCd
          : locCd // ignore: cast_nullable_to_non_nullable
              as String,
      inbYn: null == inbYn
          ? _value.inbYn
          : inbYn // ignore: cast_nullable_to_non_nullable
              as String,
      itemCd: null == itemCd
          ? _value.itemCd
          : itemCd // ignore: cast_nullable_to_non_nullable
              as String,
      tagNo: null == tagNo
          ? _value.tagNo
          : tagNo // ignore: cast_nullable_to_non_nullable
              as String,
      totWht: null == totWht
          ? _value.totWht
          : totWht // ignore: cast_nullable_to_non_nullable
              as String,
      whtUnit: null == whtUnit
          ? _value.whtUnit
          : whtUnit // ignore: cast_nullable_to_non_nullable
              as String,
      boxNm: null == boxNm
          ? _value.boxNm
          : boxNm // ignore: cast_nullable_to_non_nullable
              as String,
      boxNo: null == boxNo
          ? _value.boxNo
          : boxNo // ignore: cast_nullable_to_non_nullable
              as String,
      setQty: null == setQty
          ? _value.setQty
          : setQty // ignore: cast_nullable_to_non_nullable
              as String,
      boxWht: null == boxWht
          ? _value.boxWht
          : boxWht // ignore: cast_nullable_to_non_nullable
              as String,
      qrNo: null == qrNo
          ? _value.qrNo
          : qrNo // ignore: cast_nullable_to_non_nullable
              as String,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as double,
      vendCd: null == vendCd
          ? _value.vendCd
          : vendCd // ignore: cast_nullable_to_non_nullable
              as String,
      qtyUnit: null == qtyUnit
          ? _value.qtyUnit
          : qtyUnit // ignore: cast_nullable_to_non_nullable
              as String,
      prtDt: null == prtDt
          ? _value.prtDt
          : prtDt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InnerBodyItemImpl implements _InnerBodyItem {
  _$InnerBodyItemImpl(
      {this.wht = '',
      this.custCd = '',
      this.extrVal = '',
      this.pjtNm = '',
      this.pjtNo = '',
      this.expDt = '',
      this.remark = '',
      this.prtNo = '',
      this.itemNm = '',
      this.lotNo = '',
      this.locDt = '',
      this.tagType = '',
      this.vendNm = '',
      this.dQty = '',
      this.locCd = '',
      this.inbYn = '',
      this.itemCd = '',
      this.tagNo = '',
      this.totWht = '',
      this.whtUnit = '',
      this.boxNm = '',
      this.boxNo = '',
      this.setQty = '',
      this.boxWht = '',
      this.qrNo = '',
      this.qty = 0.0,
      this.vendCd = '',
      this.qtyUnit = '',
      this.prtDt = ''});

  factory _$InnerBodyItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$InnerBodyItemImplFromJson(json);

  @override
  @JsonKey()
  final String wht;
  @override
  @JsonKey()
  final String custCd;
  @override
  @JsonKey()
  final String extrVal;
  @override
  @JsonKey()
  final String pjtNm;
  @override
  @JsonKey()
  final String pjtNo;
  @override
  @JsonKey()
  final String expDt;
  @override
  @JsonKey()
  final String remark;
  @override
  @JsonKey()
  final String prtNo;
  @override
  @JsonKey()
  final String itemNm;
  @override
  @JsonKey()
  final String lotNo;
  @override
  @JsonKey()
  final String locDt;
  @override
  @JsonKey()
  final String tagType;
  @override
  @JsonKey()
  final String vendNm;
  @override
  @JsonKey()
  final String dQty;
  @override
  @JsonKey()
  final String locCd;
  @override
  @JsonKey()
  final String inbYn;
  @override
  @JsonKey()
  final String itemCd;
  @override
  @JsonKey()
  final String tagNo;
  @override
  @JsonKey()
  final String totWht;
  @override
  @JsonKey()
  final String whtUnit;
  @override
  @JsonKey()
  final String boxNm;
  @override
  @JsonKey()
  final String boxNo;
  @override
  @JsonKey()
  final String setQty;
  @override
  @JsonKey()
  final String boxWht;
  @override
  @JsonKey()
  final String qrNo;
  @override
  @JsonKey()
  final double qty;
  @override
  @JsonKey()
  final String vendCd;
  @override
  @JsonKey()
  final String qtyUnit;
  @override
  @JsonKey()
  final String prtDt;

  @override
  String toString() {
    return 'InnerBodyItem(wht: $wht, custCd: $custCd, extrVal: $extrVal, pjtNm: $pjtNm, pjtNo: $pjtNo, expDt: $expDt, remark: $remark, prtNo: $prtNo, itemNm: $itemNm, lotNo: $lotNo, locDt: $locDt, tagType: $tagType, vendNm: $vendNm, dQty: $dQty, locCd: $locCd, inbYn: $inbYn, itemCd: $itemCd, tagNo: $tagNo, totWht: $totWht, whtUnit: $whtUnit, boxNm: $boxNm, boxNo: $boxNo, setQty: $setQty, boxWht: $boxWht, qrNo: $qrNo, qty: $qty, vendCd: $vendCd, qtyUnit: $qtyUnit, prtDt: $prtDt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InnerBodyItemImpl &&
            (identical(other.wht, wht) || other.wht == wht) &&
            (identical(other.custCd, custCd) || other.custCd == custCd) &&
            (identical(other.extrVal, extrVal) || other.extrVal == extrVal) &&
            (identical(other.pjtNm, pjtNm) || other.pjtNm == pjtNm) &&
            (identical(other.pjtNo, pjtNo) || other.pjtNo == pjtNo) &&
            (identical(other.expDt, expDt) || other.expDt == expDt) &&
            (identical(other.remark, remark) || other.remark == remark) &&
            (identical(other.prtNo, prtNo) || other.prtNo == prtNo) &&
            (identical(other.itemNm, itemNm) || other.itemNm == itemNm) &&
            (identical(other.lotNo, lotNo) || other.lotNo == lotNo) &&
            (identical(other.locDt, locDt) || other.locDt == locDt) &&
            (identical(other.tagType, tagType) || other.tagType == tagType) &&
            (identical(other.vendNm, vendNm) || other.vendNm == vendNm) &&
            (identical(other.dQty, dQty) || other.dQty == dQty) &&
            (identical(other.locCd, locCd) || other.locCd == locCd) &&
            (identical(other.inbYn, inbYn) || other.inbYn == inbYn) &&
            (identical(other.itemCd, itemCd) || other.itemCd == itemCd) &&
            (identical(other.tagNo, tagNo) || other.tagNo == tagNo) &&
            (identical(other.totWht, totWht) || other.totWht == totWht) &&
            (identical(other.whtUnit, whtUnit) || other.whtUnit == whtUnit) &&
            (identical(other.boxNm, boxNm) || other.boxNm == boxNm) &&
            (identical(other.boxNo, boxNo) || other.boxNo == boxNo) &&
            (identical(other.setQty, setQty) || other.setQty == setQty) &&
            (identical(other.boxWht, boxWht) || other.boxWht == boxWht) &&
            (identical(other.qrNo, qrNo) || other.qrNo == qrNo) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.vendCd, vendCd) || other.vendCd == vendCd) &&
            (identical(other.qtyUnit, qtyUnit) || other.qtyUnit == qtyUnit) &&
            (identical(other.prtDt, prtDt) || other.prtDt == prtDt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        wht,
        custCd,
        extrVal,
        pjtNm,
        pjtNo,
        expDt,
        remark,
        prtNo,
        itemNm,
        lotNo,
        locDt,
        tagType,
        vendNm,
        dQty,
        locCd,
        inbYn,
        itemCd,
        tagNo,
        totWht,
        whtUnit,
        boxNm,
        boxNo,
        setQty,
        boxWht,
        qrNo,
        qty,
        vendCd,
        qtyUnit,
        prtDt
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InnerBodyItemImplCopyWith<_$InnerBodyItemImpl> get copyWith =>
      __$$InnerBodyItemImplCopyWithImpl<_$InnerBodyItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InnerBodyItemImplToJson(
      this,
    );
  }
}

abstract class _InnerBodyItem implements InnerBodyItem {
  factory _InnerBodyItem(
      {final String wht,
      final String custCd,
      final String extrVal,
      final String pjtNm,
      final String pjtNo,
      final String expDt,
      final String remark,
      final String prtNo,
      final String itemNm,
      final String lotNo,
      final String locDt,
      final String tagType,
      final String vendNm,
      final String dQty,
      final String locCd,
      final String inbYn,
      final String itemCd,
      final String tagNo,
      final String totWht,
      final String whtUnit,
      final String boxNm,
      final String boxNo,
      final String setQty,
      final String boxWht,
      final String qrNo,
      final double qty,
      final String vendCd,
      final String qtyUnit,
      final String prtDt}) = _$InnerBodyItemImpl;

  factory _InnerBodyItem.fromJson(Map<String, dynamic> json) =
      _$InnerBodyItemImpl.fromJson;

  @override
  String get wht;
  @override
  String get custCd;
  @override
  String get extrVal;
  @override
  String get pjtNm;
  @override
  String get pjtNo;
  @override
  String get expDt;
  @override
  String get remark;
  @override
  String get prtNo;
  @override
  String get itemNm;
  @override
  String get lotNo;
  @override
  String get locDt;
  @override
  String get tagType;
  @override
  String get vendNm;
  @override
  String get dQty;
  @override
  String get locCd;
  @override
  String get inbYn;
  @override
  String get itemCd;
  @override
  String get tagNo;
  @override
  String get totWht;
  @override
  String get whtUnit;
  @override
  String get boxNm;
  @override
  String get boxNo;
  @override
  String get setQty;
  @override
  String get boxWht;
  @override
  String get qrNo;
  @override
  double get qty;
  @override
  String get vendCd;
  @override
  String get qtyUnit;
  @override
  String get prtDt;
  @override
  @JsonKey(ignore: true)
  _$$InnerBodyItemImplCopyWith<_$InnerBodyItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
