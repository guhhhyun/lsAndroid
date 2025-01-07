// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_cnt_qr_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InventoryCntQrModel _$InventoryCntQrModelFromJson(Map<String, dynamic> json) {
  return _InventoryCntQrModel.fromJson(json);
}

/// @nodoc
mixin _$InventoryCntQrModel {
  Header? get header => throw _privateConstructorUsedError;
  String get resultCode => throw _privateConstructorUsedError;
  String get resultMessage => throw _privateConstructorUsedError;
  List<dynamic>? get body => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InventoryCntQrModelCopyWith<InventoryCntQrModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryCntQrModelCopyWith<$Res> {
  factory $InventoryCntQrModelCopyWith(
          InventoryCntQrModel value, $Res Function(InventoryCntQrModel) then) =
      _$InventoryCntQrModelCopyWithImpl<$Res, InventoryCntQrModel>;
  @useResult
  $Res call(
      {Header? header,
      String resultCode,
      String resultMessage,
      List<dynamic>? body});

  $HeaderCopyWith<$Res>? get header;
}

/// @nodoc
class _$InventoryCntQrModelCopyWithImpl<$Res, $Val extends InventoryCntQrModel>
    implements $InventoryCntQrModelCopyWith<$Res> {
  _$InventoryCntQrModelCopyWithImpl(this._value, this._then);

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
abstract class _$$InventoryCntQrModelImplCopyWith<$Res>
    implements $InventoryCntQrModelCopyWith<$Res> {
  factory _$$InventoryCntQrModelImplCopyWith(_$InventoryCntQrModelImpl value,
          $Res Function(_$InventoryCntQrModelImpl) then) =
      __$$InventoryCntQrModelImplCopyWithImpl<$Res>;
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
class __$$InventoryCntQrModelImplCopyWithImpl<$Res>
    extends _$InventoryCntQrModelCopyWithImpl<$Res, _$InventoryCntQrModelImpl>
    implements _$$InventoryCntQrModelImplCopyWith<$Res> {
  __$$InventoryCntQrModelImplCopyWithImpl(_$InventoryCntQrModelImpl _value,
      $Res Function(_$InventoryCntQrModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? header = freezed,
    Object? resultCode = null,
    Object? resultMessage = null,
    Object? body = freezed,
  }) {
    return _then(_$InventoryCntQrModelImpl(
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
class _$InventoryCntQrModelImpl implements _InventoryCntQrModel {
  const _$InventoryCntQrModelImpl(
      {this.header,
      this.resultCode = '',
      this.resultMessage = '',
      final List<dynamic>? body})
      : _body = body;

  factory _$InventoryCntQrModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InventoryCntQrModelImplFromJson(json);

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
    return 'InventoryCntQrModel(header: $header, resultCode: $resultCode, resultMessage: $resultMessage, body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryCntQrModelImpl &&
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
  _$$InventoryCntQrModelImplCopyWith<_$InventoryCntQrModelImpl> get copyWith =>
      __$$InventoryCntQrModelImplCopyWithImpl<_$InventoryCntQrModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InventoryCntQrModelImplToJson(
      this,
    );
  }
}

abstract class _InventoryCntQrModel implements InventoryCntQrModel {
  const factory _InventoryCntQrModel(
      {final Header? header,
      final String resultCode,
      final String resultMessage,
      final List<dynamic>? body}) = _$InventoryCntQrModelImpl;

  factory _InventoryCntQrModel.fromJson(Map<String, dynamic> json) =
      _$InventoryCntQrModelImpl.fromJson;

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
  _$$InventoryCntQrModelImplCopyWith<_$InventoryCntQrModelImpl> get copyWith =>
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
  String get QTY_UNIT => throw _privateConstructorUsedError;
  String get QR_NO => throw _privateConstructorUsedError;
  String get ITEM_NM => throw _privateConstructorUsedError;
  String get LOC_CD => throw _privateConstructorUsedError;
  String get LAST_LOC => throw _privateConstructorUsedError;
  dynamic get CUST_CD => throw _privateConstructorUsedError;
  double get QTY => throw _privateConstructorUsedError;
  dynamic get VEND_NM => throw _privateConstructorUsedError;
  String get ZONE_NM => throw _privateConstructorUsedError;
  dynamic get REMARK => throw _privateConstructorUsedError;
  dynamic get WHT_UNIT => throw _privateConstructorUsedError;
  dynamic get PRT_NO => throw _privateConstructorUsedError;
  dynamic get BOX_WHT => throw _privateConstructorUsedError;
  dynamic get WHT => throw _privateConstructorUsedError;
  String get ITEM_CD => throw _privateConstructorUsedError;
  String get LOC_DT => throw _privateConstructorUsedError;
  String get TAG_NO => throw _privateConstructorUsedError;
  String get INB_YN => throw _privateConstructorUsedError;
  dynamic get EXP_DT => throw _privateConstructorUsedError;
  dynamic get EXTR_VAL => throw _privateConstructorUsedError;
  int get D_QTY => throw _privateConstructorUsedError;
  dynamic get BOX_NM => throw _privateConstructorUsedError;
  dynamic get PRT_DT => throw _privateConstructorUsedError;
  dynamic get SET_QTY => throw _privateConstructorUsedError;
  dynamic get BOX_NO => throw _privateConstructorUsedError;
  dynamic get PJT_NO => throw _privateConstructorUsedError;
  dynamic get PJT_NM => throw _privateConstructorUsedError;
  dynamic get VEND_CD => throw _privateConstructorUsedError;
  dynamic get TOT_WHT => throw _privateConstructorUsedError;
  String get TAG_TYPE => throw _privateConstructorUsedError;
  String get LOT_NO => throw _privateConstructorUsedError;
  String get ZONE_CD => throw _privateConstructorUsedError;
  String get INB_NO => throw _privateConstructorUsedError;
  String get MATNR => throw _privateConstructorUsedError;
  String get MEINS => throw _privateConstructorUsedError;

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
      {String QTY_UNIT,
      String QR_NO,
      String ITEM_NM,
      String LOC_CD,
      String LAST_LOC,
      dynamic CUST_CD,
      double QTY,
      dynamic VEND_NM,
      String ZONE_NM,
      dynamic REMARK,
      dynamic WHT_UNIT,
      dynamic PRT_NO,
      dynamic BOX_WHT,
      dynamic WHT,
      String ITEM_CD,
      String LOC_DT,
      String TAG_NO,
      String INB_YN,
      dynamic EXP_DT,
      dynamic EXTR_VAL,
      int D_QTY,
      dynamic BOX_NM,
      dynamic PRT_DT,
      dynamic SET_QTY,
      dynamic BOX_NO,
      dynamic PJT_NO,
      dynamic PJT_NM,
      dynamic VEND_CD,
      dynamic TOT_WHT,
      String TAG_TYPE,
      String LOT_NO,
      String ZONE_CD,
      String INB_NO,
      String MATNR,
      String MEINS});
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
    Object? QTY_UNIT = null,
    Object? QR_NO = null,
    Object? ITEM_NM = null,
    Object? LOC_CD = null,
    Object? LAST_LOC = null,
    Object? CUST_CD = freezed,
    Object? QTY = null,
    Object? VEND_NM = freezed,
    Object? ZONE_NM = null,
    Object? REMARK = freezed,
    Object? WHT_UNIT = freezed,
    Object? PRT_NO = freezed,
    Object? BOX_WHT = freezed,
    Object? WHT = freezed,
    Object? ITEM_CD = null,
    Object? LOC_DT = null,
    Object? TAG_NO = null,
    Object? INB_YN = null,
    Object? EXP_DT = freezed,
    Object? EXTR_VAL = freezed,
    Object? D_QTY = null,
    Object? BOX_NM = freezed,
    Object? PRT_DT = freezed,
    Object? SET_QTY = freezed,
    Object? BOX_NO = freezed,
    Object? PJT_NO = freezed,
    Object? PJT_NM = freezed,
    Object? VEND_CD = freezed,
    Object? TOT_WHT = freezed,
    Object? TAG_TYPE = null,
    Object? LOT_NO = null,
    Object? ZONE_CD = null,
    Object? INB_NO = null,
    Object? MATNR = null,
    Object? MEINS = null,
  }) {
    return _then(_value.copyWith(
      QTY_UNIT: null == QTY_UNIT
          ? _value.QTY_UNIT
          : QTY_UNIT // ignore: cast_nullable_to_non_nullable
              as String,
      QR_NO: null == QR_NO
          ? _value.QR_NO
          : QR_NO // ignore: cast_nullable_to_non_nullable
              as String,
      ITEM_NM: null == ITEM_NM
          ? _value.ITEM_NM
          : ITEM_NM // ignore: cast_nullable_to_non_nullable
              as String,
      LOC_CD: null == LOC_CD
          ? _value.LOC_CD
          : LOC_CD // ignore: cast_nullable_to_non_nullable
              as String,
      LAST_LOC: null == LAST_LOC
          ? _value.LAST_LOC
          : LAST_LOC // ignore: cast_nullable_to_non_nullable
              as String,
      CUST_CD: freezed == CUST_CD
          ? _value.CUST_CD
          : CUST_CD // ignore: cast_nullable_to_non_nullable
              as dynamic,
      QTY: null == QTY
          ? _value.QTY
          : QTY // ignore: cast_nullable_to_non_nullable
              as double,
      VEND_NM: freezed == VEND_NM
          ? _value.VEND_NM
          : VEND_NM // ignore: cast_nullable_to_non_nullable
              as dynamic,
      ZONE_NM: null == ZONE_NM
          ? _value.ZONE_NM
          : ZONE_NM // ignore: cast_nullable_to_non_nullable
              as String,
      REMARK: freezed == REMARK
          ? _value.REMARK
          : REMARK // ignore: cast_nullable_to_non_nullable
              as dynamic,
      WHT_UNIT: freezed == WHT_UNIT
          ? _value.WHT_UNIT
          : WHT_UNIT // ignore: cast_nullable_to_non_nullable
              as dynamic,
      PRT_NO: freezed == PRT_NO
          ? _value.PRT_NO
          : PRT_NO // ignore: cast_nullable_to_non_nullable
              as dynamic,
      BOX_WHT: freezed == BOX_WHT
          ? _value.BOX_WHT
          : BOX_WHT // ignore: cast_nullable_to_non_nullable
              as dynamic,
      WHT: freezed == WHT
          ? _value.WHT
          : WHT // ignore: cast_nullable_to_non_nullable
              as dynamic,
      ITEM_CD: null == ITEM_CD
          ? _value.ITEM_CD
          : ITEM_CD // ignore: cast_nullable_to_non_nullable
              as String,
      LOC_DT: null == LOC_DT
          ? _value.LOC_DT
          : LOC_DT // ignore: cast_nullable_to_non_nullable
              as String,
      TAG_NO: null == TAG_NO
          ? _value.TAG_NO
          : TAG_NO // ignore: cast_nullable_to_non_nullable
              as String,
      INB_YN: null == INB_YN
          ? _value.INB_YN
          : INB_YN // ignore: cast_nullable_to_non_nullable
              as String,
      EXP_DT: freezed == EXP_DT
          ? _value.EXP_DT
          : EXP_DT // ignore: cast_nullable_to_non_nullable
              as dynamic,
      EXTR_VAL: freezed == EXTR_VAL
          ? _value.EXTR_VAL
          : EXTR_VAL // ignore: cast_nullable_to_non_nullable
              as dynamic,
      D_QTY: null == D_QTY
          ? _value.D_QTY
          : D_QTY // ignore: cast_nullable_to_non_nullable
              as int,
      BOX_NM: freezed == BOX_NM
          ? _value.BOX_NM
          : BOX_NM // ignore: cast_nullable_to_non_nullable
              as dynamic,
      PRT_DT: freezed == PRT_DT
          ? _value.PRT_DT
          : PRT_DT // ignore: cast_nullable_to_non_nullable
              as dynamic,
      SET_QTY: freezed == SET_QTY
          ? _value.SET_QTY
          : SET_QTY // ignore: cast_nullable_to_non_nullable
              as dynamic,
      BOX_NO: freezed == BOX_NO
          ? _value.BOX_NO
          : BOX_NO // ignore: cast_nullable_to_non_nullable
              as dynamic,
      PJT_NO: freezed == PJT_NO
          ? _value.PJT_NO
          : PJT_NO // ignore: cast_nullable_to_non_nullable
              as dynamic,
      PJT_NM: freezed == PJT_NM
          ? _value.PJT_NM
          : PJT_NM // ignore: cast_nullable_to_non_nullable
              as dynamic,
      VEND_CD: freezed == VEND_CD
          ? _value.VEND_CD
          : VEND_CD // ignore: cast_nullable_to_non_nullable
              as dynamic,
      TOT_WHT: freezed == TOT_WHT
          ? _value.TOT_WHT
          : TOT_WHT // ignore: cast_nullable_to_non_nullable
              as dynamic,
      TAG_TYPE: null == TAG_TYPE
          ? _value.TAG_TYPE
          : TAG_TYPE // ignore: cast_nullable_to_non_nullable
              as String,
      LOT_NO: null == LOT_NO
          ? _value.LOT_NO
          : LOT_NO // ignore: cast_nullable_to_non_nullable
              as String,
      ZONE_CD: null == ZONE_CD
          ? _value.ZONE_CD
          : ZONE_CD // ignore: cast_nullable_to_non_nullable
              as String,
      INB_NO: null == INB_NO
          ? _value.INB_NO
          : INB_NO // ignore: cast_nullable_to_non_nullable
              as String,
      MATNR: null == MATNR
          ? _value.MATNR
          : MATNR // ignore: cast_nullable_to_non_nullable
              as String,
      MEINS: null == MEINS
          ? _value.MEINS
          : MEINS // ignore: cast_nullable_to_non_nullable
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
      {String QTY_UNIT,
      String QR_NO,
      String ITEM_NM,
      String LOC_CD,
      String LAST_LOC,
      dynamic CUST_CD,
      double QTY,
      dynamic VEND_NM,
      String ZONE_NM,
      dynamic REMARK,
      dynamic WHT_UNIT,
      dynamic PRT_NO,
      dynamic BOX_WHT,
      dynamic WHT,
      String ITEM_CD,
      String LOC_DT,
      String TAG_NO,
      String INB_YN,
      dynamic EXP_DT,
      dynamic EXTR_VAL,
      int D_QTY,
      dynamic BOX_NM,
      dynamic PRT_DT,
      dynamic SET_QTY,
      dynamic BOX_NO,
      dynamic PJT_NO,
      dynamic PJT_NM,
      dynamic VEND_CD,
      dynamic TOT_WHT,
      String TAG_TYPE,
      String LOT_NO,
      String ZONE_CD,
      String INB_NO,
      String MATNR,
      String MEINS});
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
    Object? QTY_UNIT = null,
    Object? QR_NO = null,
    Object? ITEM_NM = null,
    Object? LOC_CD = null,
    Object? LAST_LOC = null,
    Object? CUST_CD = freezed,
    Object? QTY = null,
    Object? VEND_NM = freezed,
    Object? ZONE_NM = null,
    Object? REMARK = freezed,
    Object? WHT_UNIT = freezed,
    Object? PRT_NO = freezed,
    Object? BOX_WHT = freezed,
    Object? WHT = freezed,
    Object? ITEM_CD = null,
    Object? LOC_DT = null,
    Object? TAG_NO = null,
    Object? INB_YN = null,
    Object? EXP_DT = freezed,
    Object? EXTR_VAL = freezed,
    Object? D_QTY = null,
    Object? BOX_NM = freezed,
    Object? PRT_DT = freezed,
    Object? SET_QTY = freezed,
    Object? BOX_NO = freezed,
    Object? PJT_NO = freezed,
    Object? PJT_NM = freezed,
    Object? VEND_CD = freezed,
    Object? TOT_WHT = freezed,
    Object? TAG_TYPE = null,
    Object? LOT_NO = null,
    Object? ZONE_CD = null,
    Object? INB_NO = null,
    Object? MATNR = null,
    Object? MEINS = null,
  }) {
    return _then(_$SubBodyItemImpl(
      QTY_UNIT: null == QTY_UNIT
          ? _value.QTY_UNIT
          : QTY_UNIT // ignore: cast_nullable_to_non_nullable
              as String,
      QR_NO: null == QR_NO
          ? _value.QR_NO
          : QR_NO // ignore: cast_nullable_to_non_nullable
              as String,
      ITEM_NM: null == ITEM_NM
          ? _value.ITEM_NM
          : ITEM_NM // ignore: cast_nullable_to_non_nullable
              as String,
      LOC_CD: null == LOC_CD
          ? _value.LOC_CD
          : LOC_CD // ignore: cast_nullable_to_non_nullable
              as String,
      LAST_LOC: null == LAST_LOC
          ? _value.LAST_LOC
          : LAST_LOC // ignore: cast_nullable_to_non_nullable
              as String,
      CUST_CD: freezed == CUST_CD ? _value.CUST_CD! : CUST_CD,
      QTY: null == QTY
          ? _value.QTY
          : QTY // ignore: cast_nullable_to_non_nullable
              as double,
      VEND_NM: freezed == VEND_NM ? _value.VEND_NM! : VEND_NM,
      ZONE_NM: null == ZONE_NM
          ? _value.ZONE_NM
          : ZONE_NM // ignore: cast_nullable_to_non_nullable
              as String,
      REMARK: freezed == REMARK ? _value.REMARK! : REMARK,
      WHT_UNIT: freezed == WHT_UNIT ? _value.WHT_UNIT! : WHT_UNIT,
      PRT_NO: freezed == PRT_NO ? _value.PRT_NO! : PRT_NO,
      BOX_WHT: freezed == BOX_WHT ? _value.BOX_WHT! : BOX_WHT,
      WHT: freezed == WHT ? _value.WHT! : WHT,
      ITEM_CD: null == ITEM_CD
          ? _value.ITEM_CD
          : ITEM_CD // ignore: cast_nullable_to_non_nullable
              as String,
      LOC_DT: null == LOC_DT
          ? _value.LOC_DT
          : LOC_DT // ignore: cast_nullable_to_non_nullable
              as String,
      TAG_NO: null == TAG_NO
          ? _value.TAG_NO
          : TAG_NO // ignore: cast_nullable_to_non_nullable
              as String,
      INB_YN: null == INB_YN
          ? _value.INB_YN
          : INB_YN // ignore: cast_nullable_to_non_nullable
              as String,
      EXP_DT: freezed == EXP_DT ? _value.EXP_DT! : EXP_DT,
      EXTR_VAL: freezed == EXTR_VAL ? _value.EXTR_VAL! : EXTR_VAL,
      D_QTY: null == D_QTY
          ? _value.D_QTY
          : D_QTY // ignore: cast_nullable_to_non_nullable
              as int,
      BOX_NM: freezed == BOX_NM ? _value.BOX_NM! : BOX_NM,
      PRT_DT: freezed == PRT_DT ? _value.PRT_DT! : PRT_DT,
      SET_QTY: freezed == SET_QTY ? _value.SET_QTY! : SET_QTY,
      BOX_NO: freezed == BOX_NO ? _value.BOX_NO! : BOX_NO,
      PJT_NO: freezed == PJT_NO ? _value.PJT_NO! : PJT_NO,
      PJT_NM: freezed == PJT_NM ? _value.PJT_NM! : PJT_NM,
      VEND_CD: freezed == VEND_CD ? _value.VEND_CD! : VEND_CD,
      TOT_WHT: freezed == TOT_WHT ? _value.TOT_WHT! : TOT_WHT,
      TAG_TYPE: null == TAG_TYPE
          ? _value.TAG_TYPE
          : TAG_TYPE // ignore: cast_nullable_to_non_nullable
              as String,
      LOT_NO: null == LOT_NO
          ? _value.LOT_NO
          : LOT_NO // ignore: cast_nullable_to_non_nullable
              as String,
      ZONE_CD: null == ZONE_CD
          ? _value.ZONE_CD
          : ZONE_CD // ignore: cast_nullable_to_non_nullable
              as String,
      INB_NO: null == INB_NO
          ? _value.INB_NO
          : INB_NO // ignore: cast_nullable_to_non_nullable
              as String,
      MATNR: null == MATNR
          ? _value.MATNR
          : MATNR // ignore: cast_nullable_to_non_nullable
              as String,
      MEINS: null == MEINS
          ? _value.MEINS
          : MEINS // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubBodyItemImpl implements _SubBodyItem {
  const _$SubBodyItemImpl(
      {this.QTY_UNIT = '',
      this.QR_NO = '',
      this.ITEM_NM = '',
      this.LOC_CD = '',
      this.LAST_LOC = '',
      this.CUST_CD = '',
      this.QTY = 0.0,
      this.VEND_NM = '',
      this.ZONE_NM = '',
      this.REMARK = '',
      this.WHT_UNIT = '',
      this.PRT_NO = '',
      this.BOX_WHT = '',
      this.WHT = '',
      this.ITEM_CD = '',
      this.LOC_DT = '',
      this.TAG_NO = '',
      this.INB_YN = '',
      this.EXP_DT = '',
      this.EXTR_VAL = '',
      this.D_QTY = 0,
      this.BOX_NM = '',
      this.PRT_DT = '',
      this.SET_QTY = '',
      this.BOX_NO = '',
      this.PJT_NO = '',
      this.PJT_NM = '',
      this.VEND_CD = '',
      this.TOT_WHT = '',
      this.TAG_TYPE = '',
      this.LOT_NO = '',
      this.ZONE_CD = '',
      this.INB_NO = '',
      this.MATNR = '',
      this.MEINS = ''});

  factory _$SubBodyItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubBodyItemImplFromJson(json);

  @override
  @JsonKey()
  final String QTY_UNIT;
  @override
  @JsonKey()
  final String QR_NO;
  @override
  @JsonKey()
  final String ITEM_NM;
  @override
  @JsonKey()
  final String LOC_CD;
  @override
  @JsonKey()
  final String LAST_LOC;
  @override
  @JsonKey()
  final dynamic CUST_CD;
  @override
  @JsonKey()
  final double QTY;
  @override
  @JsonKey()
  final dynamic VEND_NM;
  @override
  @JsonKey()
  final String ZONE_NM;
  @override
  @JsonKey()
  final dynamic REMARK;
  @override
  @JsonKey()
  final dynamic WHT_UNIT;
  @override
  @JsonKey()
  final dynamic PRT_NO;
  @override
  @JsonKey()
  final dynamic BOX_WHT;
  @override
  @JsonKey()
  final dynamic WHT;
  @override
  @JsonKey()
  final String ITEM_CD;
  @override
  @JsonKey()
  final String LOC_DT;
  @override
  @JsonKey()
  final String TAG_NO;
  @override
  @JsonKey()
  final String INB_YN;
  @override
  @JsonKey()
  final dynamic EXP_DT;
  @override
  @JsonKey()
  final dynamic EXTR_VAL;
  @override
  @JsonKey()
  final int D_QTY;
  @override
  @JsonKey()
  final dynamic BOX_NM;
  @override
  @JsonKey()
  final dynamic PRT_DT;
  @override
  @JsonKey()
  final dynamic SET_QTY;
  @override
  @JsonKey()
  final dynamic BOX_NO;
  @override
  @JsonKey()
  final dynamic PJT_NO;
  @override
  @JsonKey()
  final dynamic PJT_NM;
  @override
  @JsonKey()
  final dynamic VEND_CD;
  @override
  @JsonKey()
  final dynamic TOT_WHT;
  @override
  @JsonKey()
  final String TAG_TYPE;
  @override
  @JsonKey()
  final String LOT_NO;
  @override
  @JsonKey()
  final String ZONE_CD;
  @override
  @JsonKey()
  final String INB_NO;
  @override
  @JsonKey()
  final String MATNR;
  @override
  @JsonKey()
  final String MEINS;

  @override
  String toString() {
    return 'SubBodyItem(QTY_UNIT: $QTY_UNIT, QR_NO: $QR_NO, ITEM_NM: $ITEM_NM, LOC_CD: $LOC_CD, LAST_LOC: $LAST_LOC, CUST_CD: $CUST_CD, QTY: $QTY, VEND_NM: $VEND_NM, ZONE_NM: $ZONE_NM, REMARK: $REMARK, WHT_UNIT: $WHT_UNIT, PRT_NO: $PRT_NO, BOX_WHT: $BOX_WHT, WHT: $WHT, ITEM_CD: $ITEM_CD, LOC_DT: $LOC_DT, TAG_NO: $TAG_NO, INB_YN: $INB_YN, EXP_DT: $EXP_DT, EXTR_VAL: $EXTR_VAL, D_QTY: $D_QTY, BOX_NM: $BOX_NM, PRT_DT: $PRT_DT, SET_QTY: $SET_QTY, BOX_NO: $BOX_NO, PJT_NO: $PJT_NO, PJT_NM: $PJT_NM, VEND_CD: $VEND_CD, TOT_WHT: $TOT_WHT, TAG_TYPE: $TAG_TYPE, LOT_NO: $LOT_NO, ZONE_CD: $ZONE_CD, INB_NO: $INB_NO, MATNR: $MATNR, MEINS: $MEINS)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubBodyItemImpl &&
            (identical(other.QTY_UNIT, QTY_UNIT) ||
                other.QTY_UNIT == QTY_UNIT) &&
            (identical(other.QR_NO, QR_NO) || other.QR_NO == QR_NO) &&
            (identical(other.ITEM_NM, ITEM_NM) || other.ITEM_NM == ITEM_NM) &&
            (identical(other.LOC_CD, LOC_CD) || other.LOC_CD == LOC_CD) &&
            (identical(other.LAST_LOC, LAST_LOC) ||
                other.LAST_LOC == LAST_LOC) &&
            const DeepCollectionEquality().equals(other.CUST_CD, CUST_CD) &&
            (identical(other.QTY, QTY) || other.QTY == QTY) &&
            const DeepCollectionEquality().equals(other.VEND_NM, VEND_NM) &&
            (identical(other.ZONE_NM, ZONE_NM) || other.ZONE_NM == ZONE_NM) &&
            const DeepCollectionEquality().equals(other.REMARK, REMARK) &&
            const DeepCollectionEquality().equals(other.WHT_UNIT, WHT_UNIT) &&
            const DeepCollectionEquality().equals(other.PRT_NO, PRT_NO) &&
            const DeepCollectionEquality().equals(other.BOX_WHT, BOX_WHT) &&
            const DeepCollectionEquality().equals(other.WHT, WHT) &&
            (identical(other.ITEM_CD, ITEM_CD) || other.ITEM_CD == ITEM_CD) &&
            (identical(other.LOC_DT, LOC_DT) || other.LOC_DT == LOC_DT) &&
            (identical(other.TAG_NO, TAG_NO) || other.TAG_NO == TAG_NO) &&
            (identical(other.INB_YN, INB_YN) || other.INB_YN == INB_YN) &&
            const DeepCollectionEquality().equals(other.EXP_DT, EXP_DT) &&
            const DeepCollectionEquality().equals(other.EXTR_VAL, EXTR_VAL) &&
            (identical(other.D_QTY, D_QTY) || other.D_QTY == D_QTY) &&
            const DeepCollectionEquality().equals(other.BOX_NM, BOX_NM) &&
            const DeepCollectionEquality().equals(other.PRT_DT, PRT_DT) &&
            const DeepCollectionEquality().equals(other.SET_QTY, SET_QTY) &&
            const DeepCollectionEquality().equals(other.BOX_NO, BOX_NO) &&
            const DeepCollectionEquality().equals(other.PJT_NO, PJT_NO) &&
            const DeepCollectionEquality().equals(other.PJT_NM, PJT_NM) &&
            const DeepCollectionEquality().equals(other.VEND_CD, VEND_CD) &&
            const DeepCollectionEquality().equals(other.TOT_WHT, TOT_WHT) &&
            (identical(other.TAG_TYPE, TAG_TYPE) ||
                other.TAG_TYPE == TAG_TYPE) &&
            (identical(other.LOT_NO, LOT_NO) || other.LOT_NO == LOT_NO) &&
            (identical(other.ZONE_CD, ZONE_CD) || other.ZONE_CD == ZONE_CD) &&
            (identical(other.INB_NO, INB_NO) || other.INB_NO == INB_NO) &&
            (identical(other.MATNR, MATNR) || other.MATNR == MATNR) &&
            (identical(other.MEINS, MEINS) || other.MEINS == MEINS));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        QTY_UNIT,
        QR_NO,
        ITEM_NM,
        LOC_CD,
        LAST_LOC,
        const DeepCollectionEquality().hash(CUST_CD),
        QTY,
        const DeepCollectionEquality().hash(VEND_NM),
        ZONE_NM,
        const DeepCollectionEquality().hash(REMARK),
        const DeepCollectionEquality().hash(WHT_UNIT),
        const DeepCollectionEquality().hash(PRT_NO),
        const DeepCollectionEquality().hash(BOX_WHT),
        const DeepCollectionEquality().hash(WHT),
        ITEM_CD,
        LOC_DT,
        TAG_NO,
        INB_YN,
        const DeepCollectionEquality().hash(EXP_DT),
        const DeepCollectionEquality().hash(EXTR_VAL),
        D_QTY,
        const DeepCollectionEquality().hash(BOX_NM),
        const DeepCollectionEquality().hash(PRT_DT),
        const DeepCollectionEquality().hash(SET_QTY),
        const DeepCollectionEquality().hash(BOX_NO),
        const DeepCollectionEquality().hash(PJT_NO),
        const DeepCollectionEquality().hash(PJT_NM),
        const DeepCollectionEquality().hash(VEND_CD),
        const DeepCollectionEquality().hash(TOT_WHT),
        TAG_TYPE,
        LOT_NO,
        ZONE_CD,
        INB_NO,
        MATNR,
        MEINS
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
      {final String QTY_UNIT,
      final String QR_NO,
      final String ITEM_NM,
      final String LOC_CD,
      final String LAST_LOC,
      final dynamic CUST_CD,
      final double QTY,
      final dynamic VEND_NM,
      final String ZONE_NM,
      final dynamic REMARK,
      final dynamic WHT_UNIT,
      final dynamic PRT_NO,
      final dynamic BOX_WHT,
      final dynamic WHT,
      final String ITEM_CD,
      final String LOC_DT,
      final String TAG_NO,
      final String INB_YN,
      final dynamic EXP_DT,
      final dynamic EXTR_VAL,
      final int D_QTY,
      final dynamic BOX_NM,
      final dynamic PRT_DT,
      final dynamic SET_QTY,
      final dynamic BOX_NO,
      final dynamic PJT_NO,
      final dynamic PJT_NM,
      final dynamic VEND_CD,
      final dynamic TOT_WHT,
      final String TAG_TYPE,
      final String LOT_NO,
      final String ZONE_CD,
      final String INB_NO,
      final String MATNR,
      final String MEINS}) = _$SubBodyItemImpl;

  factory _SubBodyItem.fromJson(Map<String, dynamic> json) =
      _$SubBodyItemImpl.fromJson;

  @override
  String get QTY_UNIT;
  @override
  String get QR_NO;
  @override
  String get ITEM_NM;
  @override
  String get LOC_CD;
  @override
  String get LAST_LOC;
  @override
  dynamic get CUST_CD;
  @override
  double get QTY;
  @override
  dynamic get VEND_NM;
  @override
  String get ZONE_NM;
  @override
  dynamic get REMARK;
  @override
  dynamic get WHT_UNIT;
  @override
  dynamic get PRT_NO;
  @override
  dynamic get BOX_WHT;
  @override
  dynamic get WHT;
  @override
  String get ITEM_CD;
  @override
  String get LOC_DT;
  @override
  String get TAG_NO;
  @override
  String get INB_YN;
  @override
  dynamic get EXP_DT;
  @override
  dynamic get EXTR_VAL;
  @override
  int get D_QTY;
  @override
  dynamic get BOX_NM;
  @override
  dynamic get PRT_DT;
  @override
  dynamic get SET_QTY;
  @override
  dynamic get BOX_NO;
  @override
  dynamic get PJT_NO;
  @override
  dynamic get PJT_NM;
  @override
  dynamic get VEND_CD;
  @override
  dynamic get TOT_WHT;
  @override
  String get TAG_TYPE;
  @override
  String get LOT_NO;
  @override
  String get ZONE_CD;
  @override
  String get INB_NO;
  @override
  String get MATNR;
  @override
  String get MEINS;
  @override
  @JsonKey(ignore: true)
  _$$SubBodyItemImplCopyWith<_$SubBodyItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
