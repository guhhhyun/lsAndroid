// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'etc_ipgo_second_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EtcIpgoSecondModel _$EtcIpgoSecondModelFromJson(Map<String, dynamic> json) {
  return _EtcIpgoSecondModel.fromJson(json);
}

/// @nodoc
mixin _$EtcIpgoSecondModel {
  Header? get header => throw _privateConstructorUsedError;
  String get resultCode => throw _privateConstructorUsedError;
  String get resultMessage => throw _privateConstructorUsedError;
  List<dynamic>? get body => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EtcIpgoSecondModelCopyWith<EtcIpgoSecondModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EtcIpgoSecondModelCopyWith<$Res> {
  factory $EtcIpgoSecondModelCopyWith(
          EtcIpgoSecondModel value, $Res Function(EtcIpgoSecondModel) then) =
      _$EtcIpgoSecondModelCopyWithImpl<$Res, EtcIpgoSecondModel>;
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
class _$EtcIpgoSecondModelCopyWithImpl<$Res, $Val extends EtcIpgoSecondModel>
    implements $EtcIpgoSecondModelCopyWith<$Res> {
  _$EtcIpgoSecondModelCopyWithImpl(this._value, this._then);

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
abstract class _$$EtcIpgoSecondModelImplCopyWith<$Res>
    implements $EtcIpgoSecondModelCopyWith<$Res> {
  factory _$$EtcIpgoSecondModelImplCopyWith(_$EtcIpgoSecondModelImpl value,
          $Res Function(_$EtcIpgoSecondModelImpl) then) =
      __$$EtcIpgoSecondModelImplCopyWithImpl<$Res>;
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
class __$$EtcIpgoSecondModelImplCopyWithImpl<$Res>
    extends _$EtcIpgoSecondModelCopyWithImpl<$Res, _$EtcIpgoSecondModelImpl>
    implements _$$EtcIpgoSecondModelImplCopyWith<$Res> {
  __$$EtcIpgoSecondModelImplCopyWithImpl(_$EtcIpgoSecondModelImpl _value,
      $Res Function(_$EtcIpgoSecondModelImpl) _then)
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
    return _then(_$EtcIpgoSecondModelImpl(
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
class _$EtcIpgoSecondModelImpl implements _EtcIpgoSecondModel {
  const _$EtcIpgoSecondModelImpl(
      {this.header,
      this.resultCode = '',
      this.resultMessage = '',
      final List<dynamic>? body,
      this.hasError = false})
      : _body = body;

  factory _$EtcIpgoSecondModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EtcIpgoSecondModelImplFromJson(json);

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
    return 'EtcIpgoSecondModel(header: $header, resultCode: $resultCode, resultMessage: $resultMessage, body: $body, hasError: $hasError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EtcIpgoSecondModelImpl &&
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
  _$$EtcIpgoSecondModelImplCopyWith<_$EtcIpgoSecondModelImpl> get copyWith =>
      __$$EtcIpgoSecondModelImplCopyWithImpl<_$EtcIpgoSecondModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EtcIpgoSecondModelImplToJson(
      this,
    );
  }
}

abstract class _EtcIpgoSecondModel implements EtcIpgoSecondModel {
  const factory _EtcIpgoSecondModel(
      {final Header? header,
      final String resultCode,
      final String resultMessage,
      final List<dynamic>? body,
      final bool hasError}) = _$EtcIpgoSecondModelImpl;

  factory _EtcIpgoSecondModel.fromJson(Map<String, dynamic> json) =
      _$EtcIpgoSecondModelImpl.fromJson;

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
  _$$EtcIpgoSecondModelImplCopyWith<_$EtcIpgoSecondModelImpl> get copyWith =>
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
  const factory _Header(
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
  List<SubBodyItem>? get items => throw _privateConstructorUsedError;

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
      List<SubBodyItem>? items});
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
    Object? items = freezed,
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
      items: freezed == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<SubBodyItem>?,
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
      List<SubBodyItem>? items});
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
    Object? items = freezed,
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
      items: freezed == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<SubBodyItem>?,
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
      this.returnMessage = '',
      final List<SubBodyItem>? items})
      : _items = items;

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
  final List<SubBodyItem>? _items;
  @override
  List<SubBodyItem>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'BodyItem(resultValue: $resultValue, resultRowCount: $resultRowCount, resultCode: $resultCode, resultMessage: $resultMessage, errorState: $errorState, errorProcedure: $errorProcedure, returnMessage: $returnMessage, items: $items)';
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
            const DeepCollectionEquality().equals(other._items, _items));
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
      const DeepCollectionEquality().hash(_items));

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
      final String returnMessage,
      final List<SubBodyItem>? items}) = _$BodyItemImpl;

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
  List<SubBodyItem>? get items;
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
  int get zoneNmRowspan => throw _privateConstructorUsedError;
  String get wht => throw _privateConstructorUsedError;
  int get tagId => throw _privateConstructorUsedError;
  String get pjtNm => throw _privateConstructorUsedError;
  String get grpKey => throw _privateConstructorUsedError;
  String get whNm => throw _privateConstructorUsedError;
  String get expDt => throw _privateConstructorUsedError;
  String get remark => throw _privateConstructorUsedError;
  int get tagTypeNmRowspan => throw _privateConstructorUsedError;
  String get itemNm => throw _privateConstructorUsedError;
  int get selectedRowspan => throw _privateConstructorUsedError;
  String get lotNo => throw _privateConstructorUsedError;
  String get usrNm => throw _privateConstructorUsedError;
  int get vendNmRowspan => throw _privateConstructorUsedError;
  String get tagType => throw _privateConstructorUsedError;
  String get vendNm => throw _privateConstructorUsedError;
  int get prtDtRowspan => throw _privateConstructorUsedError;
  int get tagSeq => throw _privateConstructorUsedError;
  int get pjtNmRowspan => throw _privateConstructorUsedError;
  int get selected => throw _privateConstructorUsedError;
  int get whNmRowspan => throw _privateConstructorUsedError;
  int get inbNoRowspan => throw _privateConstructorUsedError;
  int get remarkRowspan => throw _privateConstructorUsedError;
  String get locCd => throw _privateConstructorUsedError;
  String get whCd => throw _privateConstructorUsedError;
  String get tagNo => throw _privateConstructorUsedError;
  String get itemCd => throw _privateConstructorUsedError;
  int get locCdRowspan => throw _privateConstructorUsedError;
  String get whtUnit => throw _privateConstructorUsedError;
  int get tagNoRowspan => throw _privateConstructorUsedError;
  String get zoneNm => throw _privateConstructorUsedError;
  String get inbDt => throw _privateConstructorUsedError;
  String get setQty => throw _privateConstructorUsedError;
  String get plant => throw _privateConstructorUsedError;
  String get qrNo => throw _privateConstructorUsedError;
  int get usrNmRowspan => throw _privateConstructorUsedError;
  int get inbDtRowspan => throw _privateConstructorUsedError;
  double get qty => throw _privateConstructorUsedError;
  String get tagTypeNm => throw _privateConstructorUsedError;
  String get qtyUnit => throw _privateConstructorUsedError;
  String get prtDt => throw _privateConstructorUsedError;

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
      {int zoneNmRowspan,
      String wht,
      int tagId,
      String pjtNm,
      String grpKey,
      String whNm,
      String expDt,
      String remark,
      int tagTypeNmRowspan,
      String itemNm,
      int selectedRowspan,
      String lotNo,
      String usrNm,
      int vendNmRowspan,
      String tagType,
      String vendNm,
      int prtDtRowspan,
      int tagSeq,
      int pjtNmRowspan,
      int selected,
      int whNmRowspan,
      int inbNoRowspan,
      int remarkRowspan,
      String locCd,
      String whCd,
      String tagNo,
      String itemCd,
      int locCdRowspan,
      String whtUnit,
      int tagNoRowspan,
      String zoneNm,
      String inbDt,
      String setQty,
      String plant,
      String qrNo,
      int usrNmRowspan,
      int inbDtRowspan,
      double qty,
      String tagTypeNm,
      String qtyUnit,
      String prtDt});
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
    Object? zoneNmRowspan = null,
    Object? wht = null,
    Object? tagId = null,
    Object? pjtNm = null,
    Object? grpKey = null,
    Object? whNm = null,
    Object? expDt = null,
    Object? remark = null,
    Object? tagTypeNmRowspan = null,
    Object? itemNm = null,
    Object? selectedRowspan = null,
    Object? lotNo = null,
    Object? usrNm = null,
    Object? vendNmRowspan = null,
    Object? tagType = null,
    Object? vendNm = null,
    Object? prtDtRowspan = null,
    Object? tagSeq = null,
    Object? pjtNmRowspan = null,
    Object? selected = null,
    Object? whNmRowspan = null,
    Object? inbNoRowspan = null,
    Object? remarkRowspan = null,
    Object? locCd = null,
    Object? whCd = null,
    Object? tagNo = null,
    Object? itemCd = null,
    Object? locCdRowspan = null,
    Object? whtUnit = null,
    Object? tagNoRowspan = null,
    Object? zoneNm = null,
    Object? inbDt = null,
    Object? setQty = null,
    Object? plant = null,
    Object? qrNo = null,
    Object? usrNmRowspan = null,
    Object? inbDtRowspan = null,
    Object? qty = null,
    Object? tagTypeNm = null,
    Object? qtyUnit = null,
    Object? prtDt = null,
  }) {
    return _then(_value.copyWith(
      zoneNmRowspan: null == zoneNmRowspan
          ? _value.zoneNmRowspan
          : zoneNmRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      wht: null == wht
          ? _value.wht
          : wht // ignore: cast_nullable_to_non_nullable
              as String,
      tagId: null == tagId
          ? _value.tagId
          : tagId // ignore: cast_nullable_to_non_nullable
              as int,
      pjtNm: null == pjtNm
          ? _value.pjtNm
          : pjtNm // ignore: cast_nullable_to_non_nullable
              as String,
      grpKey: null == grpKey
          ? _value.grpKey
          : grpKey // ignore: cast_nullable_to_non_nullable
              as String,
      whNm: null == whNm
          ? _value.whNm
          : whNm // ignore: cast_nullable_to_non_nullable
              as String,
      expDt: null == expDt
          ? _value.expDt
          : expDt // ignore: cast_nullable_to_non_nullable
              as String,
      remark: null == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
      tagTypeNmRowspan: null == tagTypeNmRowspan
          ? _value.tagTypeNmRowspan
          : tagTypeNmRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      itemNm: null == itemNm
          ? _value.itemNm
          : itemNm // ignore: cast_nullable_to_non_nullable
              as String,
      selectedRowspan: null == selectedRowspan
          ? _value.selectedRowspan
          : selectedRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      lotNo: null == lotNo
          ? _value.lotNo
          : lotNo // ignore: cast_nullable_to_non_nullable
              as String,
      usrNm: null == usrNm
          ? _value.usrNm
          : usrNm // ignore: cast_nullable_to_non_nullable
              as String,
      vendNmRowspan: null == vendNmRowspan
          ? _value.vendNmRowspan
          : vendNmRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      tagType: null == tagType
          ? _value.tagType
          : tagType // ignore: cast_nullable_to_non_nullable
              as String,
      vendNm: null == vendNm
          ? _value.vendNm
          : vendNm // ignore: cast_nullable_to_non_nullable
              as String,
      prtDtRowspan: null == prtDtRowspan
          ? _value.prtDtRowspan
          : prtDtRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      tagSeq: null == tagSeq
          ? _value.tagSeq
          : tagSeq // ignore: cast_nullable_to_non_nullable
              as int,
      pjtNmRowspan: null == pjtNmRowspan
          ? _value.pjtNmRowspan
          : pjtNmRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as int,
      whNmRowspan: null == whNmRowspan
          ? _value.whNmRowspan
          : whNmRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      inbNoRowspan: null == inbNoRowspan
          ? _value.inbNoRowspan
          : inbNoRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      remarkRowspan: null == remarkRowspan
          ? _value.remarkRowspan
          : remarkRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      locCd: null == locCd
          ? _value.locCd
          : locCd // ignore: cast_nullable_to_non_nullable
              as String,
      whCd: null == whCd
          ? _value.whCd
          : whCd // ignore: cast_nullable_to_non_nullable
              as String,
      tagNo: null == tagNo
          ? _value.tagNo
          : tagNo // ignore: cast_nullable_to_non_nullable
              as String,
      itemCd: null == itemCd
          ? _value.itemCd
          : itemCd // ignore: cast_nullable_to_non_nullable
              as String,
      locCdRowspan: null == locCdRowspan
          ? _value.locCdRowspan
          : locCdRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      whtUnit: null == whtUnit
          ? _value.whtUnit
          : whtUnit // ignore: cast_nullable_to_non_nullable
              as String,
      tagNoRowspan: null == tagNoRowspan
          ? _value.tagNoRowspan
          : tagNoRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      zoneNm: null == zoneNm
          ? _value.zoneNm
          : zoneNm // ignore: cast_nullable_to_non_nullable
              as String,
      inbDt: null == inbDt
          ? _value.inbDt
          : inbDt // ignore: cast_nullable_to_non_nullable
              as String,
      setQty: null == setQty
          ? _value.setQty
          : setQty // ignore: cast_nullable_to_non_nullable
              as String,
      plant: null == plant
          ? _value.plant
          : plant // ignore: cast_nullable_to_non_nullable
              as String,
      qrNo: null == qrNo
          ? _value.qrNo
          : qrNo // ignore: cast_nullable_to_non_nullable
              as String,
      usrNmRowspan: null == usrNmRowspan
          ? _value.usrNmRowspan
          : usrNmRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      inbDtRowspan: null == inbDtRowspan
          ? _value.inbDtRowspan
          : inbDtRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as double,
      tagTypeNm: null == tagTypeNm
          ? _value.tagTypeNm
          : tagTypeNm // ignore: cast_nullable_to_non_nullable
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
abstract class _$$SubBodyItemImplCopyWith<$Res>
    implements $SubBodyItemCopyWith<$Res> {
  factory _$$SubBodyItemImplCopyWith(
          _$SubBodyItemImpl value, $Res Function(_$SubBodyItemImpl) then) =
      __$$SubBodyItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int zoneNmRowspan,
      String wht,
      int tagId,
      String pjtNm,
      String grpKey,
      String whNm,
      String expDt,
      String remark,
      int tagTypeNmRowspan,
      String itemNm,
      int selectedRowspan,
      String lotNo,
      String usrNm,
      int vendNmRowspan,
      String tagType,
      String vendNm,
      int prtDtRowspan,
      int tagSeq,
      int pjtNmRowspan,
      int selected,
      int whNmRowspan,
      int inbNoRowspan,
      int remarkRowspan,
      String locCd,
      String whCd,
      String tagNo,
      String itemCd,
      int locCdRowspan,
      String whtUnit,
      int tagNoRowspan,
      String zoneNm,
      String inbDt,
      String setQty,
      String plant,
      String qrNo,
      int usrNmRowspan,
      int inbDtRowspan,
      double qty,
      String tagTypeNm,
      String qtyUnit,
      String prtDt});
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
    Object? zoneNmRowspan = null,
    Object? wht = null,
    Object? tagId = null,
    Object? pjtNm = null,
    Object? grpKey = null,
    Object? whNm = null,
    Object? expDt = null,
    Object? remark = null,
    Object? tagTypeNmRowspan = null,
    Object? itemNm = null,
    Object? selectedRowspan = null,
    Object? lotNo = null,
    Object? usrNm = null,
    Object? vendNmRowspan = null,
    Object? tagType = null,
    Object? vendNm = null,
    Object? prtDtRowspan = null,
    Object? tagSeq = null,
    Object? pjtNmRowspan = null,
    Object? selected = null,
    Object? whNmRowspan = null,
    Object? inbNoRowspan = null,
    Object? remarkRowspan = null,
    Object? locCd = null,
    Object? whCd = null,
    Object? tagNo = null,
    Object? itemCd = null,
    Object? locCdRowspan = null,
    Object? whtUnit = null,
    Object? tagNoRowspan = null,
    Object? zoneNm = null,
    Object? inbDt = null,
    Object? setQty = null,
    Object? plant = null,
    Object? qrNo = null,
    Object? usrNmRowspan = null,
    Object? inbDtRowspan = null,
    Object? qty = null,
    Object? tagTypeNm = null,
    Object? qtyUnit = null,
    Object? prtDt = null,
  }) {
    return _then(_$SubBodyItemImpl(
      zoneNmRowspan: null == zoneNmRowspan
          ? _value.zoneNmRowspan
          : zoneNmRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      wht: null == wht
          ? _value.wht
          : wht // ignore: cast_nullable_to_non_nullable
              as String,
      tagId: null == tagId
          ? _value.tagId
          : tagId // ignore: cast_nullable_to_non_nullable
              as int,
      pjtNm: null == pjtNm
          ? _value.pjtNm
          : pjtNm // ignore: cast_nullable_to_non_nullable
              as String,
      grpKey: null == grpKey
          ? _value.grpKey
          : grpKey // ignore: cast_nullable_to_non_nullable
              as String,
      whNm: null == whNm
          ? _value.whNm
          : whNm // ignore: cast_nullable_to_non_nullable
              as String,
      expDt: null == expDt
          ? _value.expDt
          : expDt // ignore: cast_nullable_to_non_nullable
              as String,
      remark: null == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
      tagTypeNmRowspan: null == tagTypeNmRowspan
          ? _value.tagTypeNmRowspan
          : tagTypeNmRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      itemNm: null == itemNm
          ? _value.itemNm
          : itemNm // ignore: cast_nullable_to_non_nullable
              as String,
      selectedRowspan: null == selectedRowspan
          ? _value.selectedRowspan
          : selectedRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      lotNo: null == lotNo
          ? _value.lotNo
          : lotNo // ignore: cast_nullable_to_non_nullable
              as String,
      usrNm: null == usrNm
          ? _value.usrNm
          : usrNm // ignore: cast_nullable_to_non_nullable
              as String,
      vendNmRowspan: null == vendNmRowspan
          ? _value.vendNmRowspan
          : vendNmRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      tagType: null == tagType
          ? _value.tagType
          : tagType // ignore: cast_nullable_to_non_nullable
              as String,
      vendNm: null == vendNm
          ? _value.vendNm
          : vendNm // ignore: cast_nullable_to_non_nullable
              as String,
      prtDtRowspan: null == prtDtRowspan
          ? _value.prtDtRowspan
          : prtDtRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      tagSeq: null == tagSeq
          ? _value.tagSeq
          : tagSeq // ignore: cast_nullable_to_non_nullable
              as int,
      pjtNmRowspan: null == pjtNmRowspan
          ? _value.pjtNmRowspan
          : pjtNmRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as int,
      whNmRowspan: null == whNmRowspan
          ? _value.whNmRowspan
          : whNmRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      inbNoRowspan: null == inbNoRowspan
          ? _value.inbNoRowspan
          : inbNoRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      remarkRowspan: null == remarkRowspan
          ? _value.remarkRowspan
          : remarkRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      locCd: null == locCd
          ? _value.locCd
          : locCd // ignore: cast_nullable_to_non_nullable
              as String,
      whCd: null == whCd
          ? _value.whCd
          : whCd // ignore: cast_nullable_to_non_nullable
              as String,
      tagNo: null == tagNo
          ? _value.tagNo
          : tagNo // ignore: cast_nullable_to_non_nullable
              as String,
      itemCd: null == itemCd
          ? _value.itemCd
          : itemCd // ignore: cast_nullable_to_non_nullable
              as String,
      locCdRowspan: null == locCdRowspan
          ? _value.locCdRowspan
          : locCdRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      whtUnit: null == whtUnit
          ? _value.whtUnit
          : whtUnit // ignore: cast_nullable_to_non_nullable
              as String,
      tagNoRowspan: null == tagNoRowspan
          ? _value.tagNoRowspan
          : tagNoRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      zoneNm: null == zoneNm
          ? _value.zoneNm
          : zoneNm // ignore: cast_nullable_to_non_nullable
              as String,
      inbDt: null == inbDt
          ? _value.inbDt
          : inbDt // ignore: cast_nullable_to_non_nullable
              as String,
      setQty: null == setQty
          ? _value.setQty
          : setQty // ignore: cast_nullable_to_non_nullable
              as String,
      plant: null == plant
          ? _value.plant
          : plant // ignore: cast_nullable_to_non_nullable
              as String,
      qrNo: null == qrNo
          ? _value.qrNo
          : qrNo // ignore: cast_nullable_to_non_nullable
              as String,
      usrNmRowspan: null == usrNmRowspan
          ? _value.usrNmRowspan
          : usrNmRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      inbDtRowspan: null == inbDtRowspan
          ? _value.inbDtRowspan
          : inbDtRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as double,
      tagTypeNm: null == tagTypeNm
          ? _value.tagTypeNm
          : tagTypeNm // ignore: cast_nullable_to_non_nullable
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
class _$SubBodyItemImpl implements _SubBodyItem {
  const _$SubBodyItemImpl(
      {this.zoneNmRowspan = 0,
      this.wht = '',
      this.tagId = 0,
      this.pjtNm = '',
      this.grpKey = '',
      this.whNm = '',
      this.expDt = '',
      this.remark = '',
      this.tagTypeNmRowspan = 0,
      this.itemNm = '',
      this.selectedRowspan = 0,
      this.lotNo = '',
      this.usrNm = '',
      this.vendNmRowspan = 0,
      this.tagType = '',
      this.vendNm = '',
      this.prtDtRowspan = 0,
      this.tagSeq = 0,
      this.pjtNmRowspan = 0,
      this.selected = 0,
      this.whNmRowspan = 0,
      this.inbNoRowspan = 0,
      this.remarkRowspan = 0,
      this.locCd = '',
      this.whCd = '',
      this.tagNo = '',
      this.itemCd = '',
      this.locCdRowspan = 0,
      this.whtUnit = '',
      this.tagNoRowspan = 0,
      this.zoneNm = '',
      this.inbDt = '',
      this.setQty = '',
      this.plant = '',
      this.qrNo = '',
      this.usrNmRowspan = 0,
      this.inbDtRowspan = 0,
      this.qty = 0.0,
      this.tagTypeNm = '',
      this.qtyUnit = '',
      this.prtDt = ''});

  factory _$SubBodyItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubBodyItemImplFromJson(json);

  @override
  @JsonKey()
  final int zoneNmRowspan;
  @override
  @JsonKey()
  final String wht;
  @override
  @JsonKey()
  final int tagId;
  @override
  @JsonKey()
  final String pjtNm;
  @override
  @JsonKey()
  final String grpKey;
  @override
  @JsonKey()
  final String whNm;
  @override
  @JsonKey()
  final String expDt;
  @override
  @JsonKey()
  final String remark;
  @override
  @JsonKey()
  final int tagTypeNmRowspan;
  @override
  @JsonKey()
  final String itemNm;
  @override
  @JsonKey()
  final int selectedRowspan;
  @override
  @JsonKey()
  final String lotNo;
  @override
  @JsonKey()
  final String usrNm;
  @override
  @JsonKey()
  final int vendNmRowspan;
  @override
  @JsonKey()
  final String tagType;
  @override
  @JsonKey()
  final String vendNm;
  @override
  @JsonKey()
  final int prtDtRowspan;
  @override
  @JsonKey()
  final int tagSeq;
  @override
  @JsonKey()
  final int pjtNmRowspan;
  @override
  @JsonKey()
  final int selected;
  @override
  @JsonKey()
  final int whNmRowspan;
  @override
  @JsonKey()
  final int inbNoRowspan;
  @override
  @JsonKey()
  final int remarkRowspan;
  @override
  @JsonKey()
  final String locCd;
  @override
  @JsonKey()
  final String whCd;
  @override
  @JsonKey()
  final String tagNo;
  @override
  @JsonKey()
  final String itemCd;
  @override
  @JsonKey()
  final int locCdRowspan;
  @override
  @JsonKey()
  final String whtUnit;
  @override
  @JsonKey()
  final int tagNoRowspan;
  @override
  @JsonKey()
  final String zoneNm;
  @override
  @JsonKey()
  final String inbDt;
  @override
  @JsonKey()
  final String setQty;
  @override
  @JsonKey()
  final String plant;
  @override
  @JsonKey()
  final String qrNo;
  @override
  @JsonKey()
  final int usrNmRowspan;
  @override
  @JsonKey()
  final int inbDtRowspan;
  @override
  @JsonKey()
  final double qty;
  @override
  @JsonKey()
  final String tagTypeNm;
  @override
  @JsonKey()
  final String qtyUnit;
  @override
  @JsonKey()
  final String prtDt;

  @override
  String toString() {
    return 'SubBodyItem(zoneNmRowspan: $zoneNmRowspan, wht: $wht, tagId: $tagId, pjtNm: $pjtNm, grpKey: $grpKey, whNm: $whNm, expDt: $expDt, remark: $remark, tagTypeNmRowspan: $tagTypeNmRowspan, itemNm: $itemNm, selectedRowspan: $selectedRowspan, lotNo: $lotNo, usrNm: $usrNm, vendNmRowspan: $vendNmRowspan, tagType: $tagType, vendNm: $vendNm, prtDtRowspan: $prtDtRowspan, tagSeq: $tagSeq, pjtNmRowspan: $pjtNmRowspan, selected: $selected, whNmRowspan: $whNmRowspan, inbNoRowspan: $inbNoRowspan, remarkRowspan: $remarkRowspan, locCd: $locCd, whCd: $whCd, tagNo: $tagNo, itemCd: $itemCd, locCdRowspan: $locCdRowspan, whtUnit: $whtUnit, tagNoRowspan: $tagNoRowspan, zoneNm: $zoneNm, inbDt: $inbDt, setQty: $setQty, plant: $plant, qrNo: $qrNo, usrNmRowspan: $usrNmRowspan, inbDtRowspan: $inbDtRowspan, qty: $qty, tagTypeNm: $tagTypeNm, qtyUnit: $qtyUnit, prtDt: $prtDt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubBodyItemImpl &&
            (identical(other.zoneNmRowspan, zoneNmRowspan) ||
                other.zoneNmRowspan == zoneNmRowspan) &&
            (identical(other.wht, wht) || other.wht == wht) &&
            (identical(other.tagId, tagId) || other.tagId == tagId) &&
            (identical(other.pjtNm, pjtNm) || other.pjtNm == pjtNm) &&
            (identical(other.grpKey, grpKey) || other.grpKey == grpKey) &&
            (identical(other.whNm, whNm) || other.whNm == whNm) &&
            (identical(other.expDt, expDt) || other.expDt == expDt) &&
            (identical(other.remark, remark) || other.remark == remark) &&
            (identical(other.tagTypeNmRowspan, tagTypeNmRowspan) ||
                other.tagTypeNmRowspan == tagTypeNmRowspan) &&
            (identical(other.itemNm, itemNm) || other.itemNm == itemNm) &&
            (identical(other.selectedRowspan, selectedRowspan) ||
                other.selectedRowspan == selectedRowspan) &&
            (identical(other.lotNo, lotNo) || other.lotNo == lotNo) &&
            (identical(other.usrNm, usrNm) || other.usrNm == usrNm) &&
            (identical(other.vendNmRowspan, vendNmRowspan) ||
                other.vendNmRowspan == vendNmRowspan) &&
            (identical(other.tagType, tagType) || other.tagType == tagType) &&
            (identical(other.vendNm, vendNm) || other.vendNm == vendNm) &&
            (identical(other.prtDtRowspan, prtDtRowspan) ||
                other.prtDtRowspan == prtDtRowspan) &&
            (identical(other.tagSeq, tagSeq) || other.tagSeq == tagSeq) &&
            (identical(other.pjtNmRowspan, pjtNmRowspan) ||
                other.pjtNmRowspan == pjtNmRowspan) &&
            (identical(other.selected, selected) ||
                other.selected == selected) &&
            (identical(other.whNmRowspan, whNmRowspan) ||
                other.whNmRowspan == whNmRowspan) &&
            (identical(other.inbNoRowspan, inbNoRowspan) ||
                other.inbNoRowspan == inbNoRowspan) &&
            (identical(other.remarkRowspan, remarkRowspan) ||
                other.remarkRowspan == remarkRowspan) &&
            (identical(other.locCd, locCd) || other.locCd == locCd) &&
            (identical(other.whCd, whCd) || other.whCd == whCd) &&
            (identical(other.tagNo, tagNo) || other.tagNo == tagNo) &&
            (identical(other.itemCd, itemCd) || other.itemCd == itemCd) &&
            (identical(other.locCdRowspan, locCdRowspan) ||
                other.locCdRowspan == locCdRowspan) &&
            (identical(other.whtUnit, whtUnit) || other.whtUnit == whtUnit) &&
            (identical(other.tagNoRowspan, tagNoRowspan) ||
                other.tagNoRowspan == tagNoRowspan) &&
            (identical(other.zoneNm, zoneNm) || other.zoneNm == zoneNm) &&
            (identical(other.inbDt, inbDt) || other.inbDt == inbDt) &&
            (identical(other.setQty, setQty) || other.setQty == setQty) &&
            (identical(other.plant, plant) || other.plant == plant) &&
            (identical(other.qrNo, qrNo) || other.qrNo == qrNo) &&
            (identical(other.usrNmRowspan, usrNmRowspan) ||
                other.usrNmRowspan == usrNmRowspan) &&
            (identical(other.inbDtRowspan, inbDtRowspan) ||
                other.inbDtRowspan == inbDtRowspan) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.tagTypeNm, tagTypeNm) ||
                other.tagTypeNm == tagTypeNm) &&
            (identical(other.qtyUnit, qtyUnit) || other.qtyUnit == qtyUnit) &&
            (identical(other.prtDt, prtDt) || other.prtDt == prtDt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        zoneNmRowspan,
        wht,
        tagId,
        pjtNm,
        grpKey,
        whNm,
        expDt,
        remark,
        tagTypeNmRowspan,
        itemNm,
        selectedRowspan,
        lotNo,
        usrNm,
        vendNmRowspan,
        tagType,
        vendNm,
        prtDtRowspan,
        tagSeq,
        pjtNmRowspan,
        selected,
        whNmRowspan,
        inbNoRowspan,
        remarkRowspan,
        locCd,
        whCd,
        tagNo,
        itemCd,
        locCdRowspan,
        whtUnit,
        tagNoRowspan,
        zoneNm,
        inbDt,
        setQty,
        plant,
        qrNo,
        usrNmRowspan,
        inbDtRowspan,
        qty,
        tagTypeNm,
        qtyUnit,
        prtDt
      ]);

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
      {final int zoneNmRowspan,
      final String wht,
      final int tagId,
      final String pjtNm,
      final String grpKey,
      final String whNm,
      final String expDt,
      final String remark,
      final int tagTypeNmRowspan,
      final String itemNm,
      final int selectedRowspan,
      final String lotNo,
      final String usrNm,
      final int vendNmRowspan,
      final String tagType,
      final String vendNm,
      final int prtDtRowspan,
      final int tagSeq,
      final int pjtNmRowspan,
      final int selected,
      final int whNmRowspan,
      final int inbNoRowspan,
      final int remarkRowspan,
      final String locCd,
      final String whCd,
      final String tagNo,
      final String itemCd,
      final int locCdRowspan,
      final String whtUnit,
      final int tagNoRowspan,
      final String zoneNm,
      final String inbDt,
      final String setQty,
      final String plant,
      final String qrNo,
      final int usrNmRowspan,
      final int inbDtRowspan,
      final double qty,
      final String tagTypeNm,
      final String qtyUnit,
      final String prtDt}) = _$SubBodyItemImpl;

  factory _SubBodyItem.fromJson(Map<String, dynamic> json) =
      _$SubBodyItemImpl.fromJson;

  @override
  int get zoneNmRowspan;
  @override
  String get wht;
  @override
  int get tagId;
  @override
  String get pjtNm;
  @override
  String get grpKey;
  @override
  String get whNm;
  @override
  String get expDt;
  @override
  String get remark;
  @override
  int get tagTypeNmRowspan;
  @override
  String get itemNm;
  @override
  int get selectedRowspan;
  @override
  String get lotNo;
  @override
  String get usrNm;
  @override
  int get vendNmRowspan;
  @override
  String get tagType;
  @override
  String get vendNm;
  @override
  int get prtDtRowspan;
  @override
  int get tagSeq;
  @override
  int get pjtNmRowspan;
  @override
  int get selected;
  @override
  int get whNmRowspan;
  @override
  int get inbNoRowspan;
  @override
  int get remarkRowspan;
  @override
  String get locCd;
  @override
  String get whCd;
  @override
  String get tagNo;
  @override
  String get itemCd;
  @override
  int get locCdRowspan;
  @override
  String get whtUnit;
  @override
  int get tagNoRowspan;
  @override
  String get zoneNm;
  @override
  String get inbDt;
  @override
  String get setQty;
  @override
  String get plant;
  @override
  String get qrNo;
  @override
  int get usrNmRowspan;
  @override
  int get inbDtRowspan;
  @override
  double get qty;
  @override
  String get tagTypeNm;
  @override
  String get qtyUnit;
  @override
  String get prtDt;
  @override
  @JsonKey(ignore: true)
  _$$SubBodyItemImplCopyWith<_$SubBodyItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
