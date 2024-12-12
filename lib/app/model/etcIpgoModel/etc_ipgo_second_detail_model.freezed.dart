// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'etc_ipgo_second_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EtcIpgoSecondDetailModel _$EtcIpgoSecondDetailModelFromJson(
    Map<String, dynamic> json) {
  return _EtcIpgoSecondDetailModel.fromJson(json);
}

/// @nodoc
mixin _$EtcIpgoSecondDetailModel {
  Header? get header => throw _privateConstructorUsedError;
  String get resultCode => throw _privateConstructorUsedError;
  String get resultMessage => throw _privateConstructorUsedError;
  List<dynamic>? get body => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EtcIpgoSecondDetailModelCopyWith<EtcIpgoSecondDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EtcIpgoSecondDetailModelCopyWith<$Res> {
  factory $EtcIpgoSecondDetailModelCopyWith(EtcIpgoSecondDetailModel value,
          $Res Function(EtcIpgoSecondDetailModel) then) =
      _$EtcIpgoSecondDetailModelCopyWithImpl<$Res, EtcIpgoSecondDetailModel>;
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
class _$EtcIpgoSecondDetailModelCopyWithImpl<$Res,
        $Val extends EtcIpgoSecondDetailModel>
    implements $EtcIpgoSecondDetailModelCopyWith<$Res> {
  _$EtcIpgoSecondDetailModelCopyWithImpl(this._value, this._then);

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
abstract class _$$EtcIpgoSecondDetailModelImplCopyWith<$Res>
    implements $EtcIpgoSecondDetailModelCopyWith<$Res> {
  factory _$$EtcIpgoSecondDetailModelImplCopyWith(
          _$EtcIpgoSecondDetailModelImpl value,
          $Res Function(_$EtcIpgoSecondDetailModelImpl) then) =
      __$$EtcIpgoSecondDetailModelImplCopyWithImpl<$Res>;
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
class __$$EtcIpgoSecondDetailModelImplCopyWithImpl<$Res>
    extends _$EtcIpgoSecondDetailModelCopyWithImpl<$Res,
        _$EtcIpgoSecondDetailModelImpl>
    implements _$$EtcIpgoSecondDetailModelImplCopyWith<$Res> {
  __$$EtcIpgoSecondDetailModelImplCopyWithImpl(
      _$EtcIpgoSecondDetailModelImpl _value,
      $Res Function(_$EtcIpgoSecondDetailModelImpl) _then)
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
    return _then(_$EtcIpgoSecondDetailModelImpl(
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
class _$EtcIpgoSecondDetailModelImpl implements _EtcIpgoSecondDetailModel {
  const _$EtcIpgoSecondDetailModelImpl(
      {this.header,
      this.resultCode = '',
      this.resultMessage = '',
      final List<dynamic>? body,
      this.hasError = false})
      : _body = body;

  factory _$EtcIpgoSecondDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EtcIpgoSecondDetailModelImplFromJson(json);

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
    return 'EtcIpgoSecondDetailModel(header: $header, resultCode: $resultCode, resultMessage: $resultMessage, body: $body, hasError: $hasError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EtcIpgoSecondDetailModelImpl &&
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
  _$$EtcIpgoSecondDetailModelImplCopyWith<_$EtcIpgoSecondDetailModelImpl>
      get copyWith => __$$EtcIpgoSecondDetailModelImplCopyWithImpl<
          _$EtcIpgoSecondDetailModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EtcIpgoSecondDetailModelImplToJson(
      this,
    );
  }
}

abstract class _EtcIpgoSecondDetailModel implements EtcIpgoSecondDetailModel {
  const factory _EtcIpgoSecondDetailModel(
      {final Header? header,
      final String resultCode,
      final String resultMessage,
      final List<dynamic>? body,
      final bool hasError}) = _$EtcIpgoSecondDetailModelImpl;

  factory _EtcIpgoSecondDetailModel.fromJson(Map<String, dynamic> json) =
      _$EtcIpgoSecondDetailModelImpl.fromJson;

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
  _$$EtcIpgoSecondDetailModelImplCopyWith<_$EtcIpgoSecondDetailModelImpl>
      get copyWith => throw _privateConstructorUsedError;
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
  String get wht => throw _privateConstructorUsedError;
  int get tagId => throw _privateConstructorUsedError;
  String get WH_NM => throw _privateConstructorUsedError;
  String get pjtNm => throw _privateConstructorUsedError;
  String get grpKey => throw _privateConstructorUsedError;
  String get LOC_CD => throw _privateConstructorUsedError;
  String get expDt => throw _privateConstructorUsedError;
  String get remark => throw _privateConstructorUsedError;
  String get itemNm => throw _privateConstructorUsedError;
  String get lotNo => throw _privateConstructorUsedError;
  String get usrNm => throw _privateConstructorUsedError;
  String get tagType => throw _privateConstructorUsedError;
  String get ZONE_NM => throw _privateConstructorUsedError;
  String get vendNm => throw _privateConstructorUsedError;
  int get tagSeq => throw _privateConstructorUsedError;
  String get whCd => throw _privateConstructorUsedError;
  String get tagNo => throw _privateConstructorUsedError;
  String get itemCd => throw _privateConstructorUsedError;
  String get whtUnit => throw _privateConstructorUsedError;
  String get inbDt => throw _privateConstructorUsedError;
  String get setQty => throw _privateConstructorUsedError;
  String get plant => throw _privateConstructorUsedError;
  String get qrNo => throw _privateConstructorUsedError;
  String get qty => throw _privateConstructorUsedError;
  String get tagTypeNm => throw _privateConstructorUsedError;
  String get qtyUnit => throw _privateConstructorUsedError;
  String get prtDt => throw _privateConstructorUsedError;
  String get INB_NO => throw _privateConstructorUsedError;

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
      {String wht,
      int tagId,
      String WH_NM,
      String pjtNm,
      String grpKey,
      String LOC_CD,
      String expDt,
      String remark,
      String itemNm,
      String lotNo,
      String usrNm,
      String tagType,
      String ZONE_NM,
      String vendNm,
      int tagSeq,
      String whCd,
      String tagNo,
      String itemCd,
      String whtUnit,
      String inbDt,
      String setQty,
      String plant,
      String qrNo,
      String qty,
      String tagTypeNm,
      String qtyUnit,
      String prtDt,
      String INB_NO});
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
    Object? wht = null,
    Object? tagId = null,
    Object? WH_NM = null,
    Object? pjtNm = null,
    Object? grpKey = null,
    Object? LOC_CD = null,
    Object? expDt = null,
    Object? remark = null,
    Object? itemNm = null,
    Object? lotNo = null,
    Object? usrNm = null,
    Object? tagType = null,
    Object? ZONE_NM = null,
    Object? vendNm = null,
    Object? tagSeq = null,
    Object? whCd = null,
    Object? tagNo = null,
    Object? itemCd = null,
    Object? whtUnit = null,
    Object? inbDt = null,
    Object? setQty = null,
    Object? plant = null,
    Object? qrNo = null,
    Object? qty = null,
    Object? tagTypeNm = null,
    Object? qtyUnit = null,
    Object? prtDt = null,
    Object? INB_NO = null,
  }) {
    return _then(_value.copyWith(
      wht: null == wht
          ? _value.wht
          : wht // ignore: cast_nullable_to_non_nullable
              as String,
      tagId: null == tagId
          ? _value.tagId
          : tagId // ignore: cast_nullable_to_non_nullable
              as int,
      WH_NM: null == WH_NM
          ? _value.WH_NM
          : WH_NM // ignore: cast_nullable_to_non_nullable
              as String,
      pjtNm: null == pjtNm
          ? _value.pjtNm
          : pjtNm // ignore: cast_nullable_to_non_nullable
              as String,
      grpKey: null == grpKey
          ? _value.grpKey
          : grpKey // ignore: cast_nullable_to_non_nullable
              as String,
      LOC_CD: null == LOC_CD
          ? _value.LOC_CD
          : LOC_CD // ignore: cast_nullable_to_non_nullable
              as String,
      expDt: null == expDt
          ? _value.expDt
          : expDt // ignore: cast_nullable_to_non_nullable
              as String,
      remark: null == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
      itemNm: null == itemNm
          ? _value.itemNm
          : itemNm // ignore: cast_nullable_to_non_nullable
              as String,
      lotNo: null == lotNo
          ? _value.lotNo
          : lotNo // ignore: cast_nullable_to_non_nullable
              as String,
      usrNm: null == usrNm
          ? _value.usrNm
          : usrNm // ignore: cast_nullable_to_non_nullable
              as String,
      tagType: null == tagType
          ? _value.tagType
          : tagType // ignore: cast_nullable_to_non_nullable
              as String,
      ZONE_NM: null == ZONE_NM
          ? _value.ZONE_NM
          : ZONE_NM // ignore: cast_nullable_to_non_nullable
              as String,
      vendNm: null == vendNm
          ? _value.vendNm
          : vendNm // ignore: cast_nullable_to_non_nullable
              as String,
      tagSeq: null == tagSeq
          ? _value.tagSeq
          : tagSeq // ignore: cast_nullable_to_non_nullable
              as int,
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
      whtUnit: null == whtUnit
          ? _value.whtUnit
          : whtUnit // ignore: cast_nullable_to_non_nullable
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
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as String,
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
      INB_NO: null == INB_NO
          ? _value.INB_NO
          : INB_NO // ignore: cast_nullable_to_non_nullable
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
      {String wht,
      int tagId,
      String WH_NM,
      String pjtNm,
      String grpKey,
      String LOC_CD,
      String expDt,
      String remark,
      String itemNm,
      String lotNo,
      String usrNm,
      String tagType,
      String ZONE_NM,
      String vendNm,
      int tagSeq,
      String whCd,
      String tagNo,
      String itemCd,
      String whtUnit,
      String inbDt,
      String setQty,
      String plant,
      String qrNo,
      String qty,
      String tagTypeNm,
      String qtyUnit,
      String prtDt,
      String INB_NO});
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
    Object? wht = null,
    Object? tagId = null,
    Object? WH_NM = null,
    Object? pjtNm = null,
    Object? grpKey = null,
    Object? LOC_CD = null,
    Object? expDt = null,
    Object? remark = null,
    Object? itemNm = null,
    Object? lotNo = null,
    Object? usrNm = null,
    Object? tagType = null,
    Object? ZONE_NM = null,
    Object? vendNm = null,
    Object? tagSeq = null,
    Object? whCd = null,
    Object? tagNo = null,
    Object? itemCd = null,
    Object? whtUnit = null,
    Object? inbDt = null,
    Object? setQty = null,
    Object? plant = null,
    Object? qrNo = null,
    Object? qty = null,
    Object? tagTypeNm = null,
    Object? qtyUnit = null,
    Object? prtDt = null,
    Object? INB_NO = null,
  }) {
    return _then(_$SubBodyItemImpl(
      wht: null == wht
          ? _value.wht
          : wht // ignore: cast_nullable_to_non_nullable
              as String,
      tagId: null == tagId
          ? _value.tagId
          : tagId // ignore: cast_nullable_to_non_nullable
              as int,
      WH_NM: null == WH_NM
          ? _value.WH_NM
          : WH_NM // ignore: cast_nullable_to_non_nullable
              as String,
      pjtNm: null == pjtNm
          ? _value.pjtNm
          : pjtNm // ignore: cast_nullable_to_non_nullable
              as String,
      grpKey: null == grpKey
          ? _value.grpKey
          : grpKey // ignore: cast_nullable_to_non_nullable
              as String,
      LOC_CD: null == LOC_CD
          ? _value.LOC_CD
          : LOC_CD // ignore: cast_nullable_to_non_nullable
              as String,
      expDt: null == expDt
          ? _value.expDt
          : expDt // ignore: cast_nullable_to_non_nullable
              as String,
      remark: null == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
      itemNm: null == itemNm
          ? _value.itemNm
          : itemNm // ignore: cast_nullable_to_non_nullable
              as String,
      lotNo: null == lotNo
          ? _value.lotNo
          : lotNo // ignore: cast_nullable_to_non_nullable
              as String,
      usrNm: null == usrNm
          ? _value.usrNm
          : usrNm // ignore: cast_nullable_to_non_nullable
              as String,
      tagType: null == tagType
          ? _value.tagType
          : tagType // ignore: cast_nullable_to_non_nullable
              as String,
      ZONE_NM: null == ZONE_NM
          ? _value.ZONE_NM
          : ZONE_NM // ignore: cast_nullable_to_non_nullable
              as String,
      vendNm: null == vendNm
          ? _value.vendNm
          : vendNm // ignore: cast_nullable_to_non_nullable
              as String,
      tagSeq: null == tagSeq
          ? _value.tagSeq
          : tagSeq // ignore: cast_nullable_to_non_nullable
              as int,
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
      whtUnit: null == whtUnit
          ? _value.whtUnit
          : whtUnit // ignore: cast_nullable_to_non_nullable
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
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as String,
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
      INB_NO: null == INB_NO
          ? _value.INB_NO
          : INB_NO // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubBodyItemImpl implements _SubBodyItem {
  const _$SubBodyItemImpl(
      {this.wht = '',
      this.tagId = 0,
      this.WH_NM = '',
      this.pjtNm = '',
      this.grpKey = '',
      this.LOC_CD = '',
      this.expDt = '',
      this.remark = '',
      this.itemNm = '',
      this.lotNo = '',
      this.usrNm = '',
      this.tagType = '',
      this.ZONE_NM = '',
      this.vendNm = '',
      this.tagSeq = 0,
      this.whCd = '',
      this.tagNo = '',
      this.itemCd = '',
      this.whtUnit = '',
      this.inbDt = '',
      this.setQty = '',
      this.plant = '',
      this.qrNo = '',
      this.qty = '',
      this.tagTypeNm = '',
      this.qtyUnit = '',
      this.prtDt = '',
      this.INB_NO = ''});

  factory _$SubBodyItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubBodyItemImplFromJson(json);

  @override
  @JsonKey()
  final String wht;
  @override
  @JsonKey()
  final int tagId;
  @override
  @JsonKey()
  final String WH_NM;
  @override
  @JsonKey()
  final String pjtNm;
  @override
  @JsonKey()
  final String grpKey;
  @override
  @JsonKey()
  final String LOC_CD;
  @override
  @JsonKey()
  final String expDt;
  @override
  @JsonKey()
  final String remark;
  @override
  @JsonKey()
  final String itemNm;
  @override
  @JsonKey()
  final String lotNo;
  @override
  @JsonKey()
  final String usrNm;
  @override
  @JsonKey()
  final String tagType;
  @override
  @JsonKey()
  final String ZONE_NM;
  @override
  @JsonKey()
  final String vendNm;
  @override
  @JsonKey()
  final int tagSeq;
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
  final String whtUnit;
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
  final String qty;
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
  @JsonKey()
  final String INB_NO;

  @override
  String toString() {
    return 'SubBodyItem(wht: $wht, tagId: $tagId, WH_NM: $WH_NM, pjtNm: $pjtNm, grpKey: $grpKey, LOC_CD: $LOC_CD, expDt: $expDt, remark: $remark, itemNm: $itemNm, lotNo: $lotNo, usrNm: $usrNm, tagType: $tagType, ZONE_NM: $ZONE_NM, vendNm: $vendNm, tagSeq: $tagSeq, whCd: $whCd, tagNo: $tagNo, itemCd: $itemCd, whtUnit: $whtUnit, inbDt: $inbDt, setQty: $setQty, plant: $plant, qrNo: $qrNo, qty: $qty, tagTypeNm: $tagTypeNm, qtyUnit: $qtyUnit, prtDt: $prtDt, INB_NO: $INB_NO)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubBodyItemImpl &&
            (identical(other.wht, wht) || other.wht == wht) &&
            (identical(other.tagId, tagId) || other.tagId == tagId) &&
            (identical(other.WH_NM, WH_NM) || other.WH_NM == WH_NM) &&
            (identical(other.pjtNm, pjtNm) || other.pjtNm == pjtNm) &&
            (identical(other.grpKey, grpKey) || other.grpKey == grpKey) &&
            (identical(other.LOC_CD, LOC_CD) || other.LOC_CD == LOC_CD) &&
            (identical(other.expDt, expDt) || other.expDt == expDt) &&
            (identical(other.remark, remark) || other.remark == remark) &&
            (identical(other.itemNm, itemNm) || other.itemNm == itemNm) &&
            (identical(other.lotNo, lotNo) || other.lotNo == lotNo) &&
            (identical(other.usrNm, usrNm) || other.usrNm == usrNm) &&
            (identical(other.tagType, tagType) || other.tagType == tagType) &&
            (identical(other.ZONE_NM, ZONE_NM) || other.ZONE_NM == ZONE_NM) &&
            (identical(other.vendNm, vendNm) || other.vendNm == vendNm) &&
            (identical(other.tagSeq, tagSeq) || other.tagSeq == tagSeq) &&
            (identical(other.whCd, whCd) || other.whCd == whCd) &&
            (identical(other.tagNo, tagNo) || other.tagNo == tagNo) &&
            (identical(other.itemCd, itemCd) || other.itemCd == itemCd) &&
            (identical(other.whtUnit, whtUnit) || other.whtUnit == whtUnit) &&
            (identical(other.inbDt, inbDt) || other.inbDt == inbDt) &&
            (identical(other.setQty, setQty) || other.setQty == setQty) &&
            (identical(other.plant, plant) || other.plant == plant) &&
            (identical(other.qrNo, qrNo) || other.qrNo == qrNo) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.tagTypeNm, tagTypeNm) ||
                other.tagTypeNm == tagTypeNm) &&
            (identical(other.qtyUnit, qtyUnit) || other.qtyUnit == qtyUnit) &&
            (identical(other.prtDt, prtDt) || other.prtDt == prtDt) &&
            (identical(other.INB_NO, INB_NO) || other.INB_NO == INB_NO));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        wht,
        tagId,
        WH_NM,
        pjtNm,
        grpKey,
        LOC_CD,
        expDt,
        remark,
        itemNm,
        lotNo,
        usrNm,
        tagType,
        ZONE_NM,
        vendNm,
        tagSeq,
        whCd,
        tagNo,
        itemCd,
        whtUnit,
        inbDt,
        setQty,
        plant,
        qrNo,
        qty,
        tagTypeNm,
        qtyUnit,
        prtDt,
        INB_NO
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
      {final String wht,
      final int tagId,
      final String WH_NM,
      final String pjtNm,
      final String grpKey,
      final String LOC_CD,
      final String expDt,
      final String remark,
      final String itemNm,
      final String lotNo,
      final String usrNm,
      final String tagType,
      final String ZONE_NM,
      final String vendNm,
      final int tagSeq,
      final String whCd,
      final String tagNo,
      final String itemCd,
      final String whtUnit,
      final String inbDt,
      final String setQty,
      final String plant,
      final String qrNo,
      final String qty,
      final String tagTypeNm,
      final String qtyUnit,
      final String prtDt,
      final String INB_NO}) = _$SubBodyItemImpl;

  factory _SubBodyItem.fromJson(Map<String, dynamic> json) =
      _$SubBodyItemImpl.fromJson;

  @override
  String get wht;
  @override
  int get tagId;
  @override
  String get WH_NM;
  @override
  String get pjtNm;
  @override
  String get grpKey;
  @override
  String get LOC_CD;
  @override
  String get expDt;
  @override
  String get remark;
  @override
  String get itemNm;
  @override
  String get lotNo;
  @override
  String get usrNm;
  @override
  String get tagType;
  @override
  String get ZONE_NM;
  @override
  String get vendNm;
  @override
  int get tagSeq;
  @override
  String get whCd;
  @override
  String get tagNo;
  @override
  String get itemCd;
  @override
  String get whtUnit;
  @override
  String get inbDt;
  @override
  String get setQty;
  @override
  String get plant;
  @override
  String get qrNo;
  @override
  String get qty;
  @override
  String get tagTypeNm;
  @override
  String get qtyUnit;
  @override
  String get prtDt;
  @override
  String get INB_NO;
  @override
  @JsonKey(ignore: true)
  _$$SubBodyItemImplCopyWith<_$SubBodyItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
