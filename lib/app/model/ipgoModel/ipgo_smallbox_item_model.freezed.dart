// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ipgo_smallbox_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IpgoSmallboxItemModel _$IpgoSmallboxItemModelFromJson(
    Map<String, dynamic> json) {
  return _IpgoSmallboxItemModel.fromJson(json);
}

/// @nodoc
mixin _$IpgoSmallboxItemModel {
  Header? get header => throw _privateConstructorUsedError;
  String get resultCode => throw _privateConstructorUsedError;
  String get resultMessage => throw _privateConstructorUsedError;
  List<dynamic>? get body => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IpgoSmallboxItemModelCopyWith<IpgoSmallboxItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IpgoSmallboxItemModelCopyWith<$Res> {
  factory $IpgoSmallboxItemModelCopyWith(IpgoSmallboxItemModel value,
          $Res Function(IpgoSmallboxItemModel) then) =
      _$IpgoSmallboxItemModelCopyWithImpl<$Res, IpgoSmallboxItemModel>;
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
class _$IpgoSmallboxItemModelCopyWithImpl<$Res,
        $Val extends IpgoSmallboxItemModel>
    implements $IpgoSmallboxItemModelCopyWith<$Res> {
  _$IpgoSmallboxItemModelCopyWithImpl(this._value, this._then);

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
abstract class _$$IpgoSmallboxItemModelImplCopyWith<$Res>
    implements $IpgoSmallboxItemModelCopyWith<$Res> {
  factory _$$IpgoSmallboxItemModelImplCopyWith(
          _$IpgoSmallboxItemModelImpl value,
          $Res Function(_$IpgoSmallboxItemModelImpl) then) =
      __$$IpgoSmallboxItemModelImplCopyWithImpl<$Res>;
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
class __$$IpgoSmallboxItemModelImplCopyWithImpl<$Res>
    extends _$IpgoSmallboxItemModelCopyWithImpl<$Res,
        _$IpgoSmallboxItemModelImpl>
    implements _$$IpgoSmallboxItemModelImplCopyWith<$Res> {
  __$$IpgoSmallboxItemModelImplCopyWithImpl(_$IpgoSmallboxItemModelImpl _value,
      $Res Function(_$IpgoSmallboxItemModelImpl) _then)
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
    return _then(_$IpgoSmallboxItemModelImpl(
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
class _$IpgoSmallboxItemModelImpl implements _IpgoSmallboxItemModel {
  const _$IpgoSmallboxItemModelImpl(
      {this.header,
      this.resultCode = '',
      this.resultMessage = '',
      final List<dynamic>? body,
      this.hasError = false})
      : _body = body;

  factory _$IpgoSmallboxItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$IpgoSmallboxItemModelImplFromJson(json);

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
    return 'IpgoSmallboxItemModel(header: $header, resultCode: $resultCode, resultMessage: $resultMessage, body: $body, hasError: $hasError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IpgoSmallboxItemModelImpl &&
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
  _$$IpgoSmallboxItemModelImplCopyWith<_$IpgoSmallboxItemModelImpl>
      get copyWith => __$$IpgoSmallboxItemModelImplCopyWithImpl<
          _$IpgoSmallboxItemModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IpgoSmallboxItemModelImplToJson(
      this,
    );
  }
}

abstract class _IpgoSmallboxItemModel implements IpgoSmallboxItemModel {
  const factory _IpgoSmallboxItemModel(
      {final Header? header,
      final String resultCode,
      final String resultMessage,
      final List<dynamic>? body,
      final bool hasError}) = _$IpgoSmallboxItemModelImpl;

  factory _IpgoSmallboxItemModel.fromJson(Map<String, dynamic> json) =
      _$IpgoSmallboxItemModelImpl.fromJson;

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
  _$$IpgoSmallboxItemModelImplCopyWith<_$IpgoSmallboxItemModelImpl>
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

SubItem _$SubItemFromJson(Map<String, dynamic> json) {
  return _SubItem.fromJson(json);
}

/// @nodoc
mixin _$SubItem {
  int get no => throw _privateConstructorUsedError;
  String get wht => throw _privateConstructorUsedError;
  String get custCd => throw _privateConstructorUsedError;
  int get tagId => throw _privateConstructorUsedError;
  String get pjtNm => throw _privateConstructorUsedError;
  String get grpKey => throw _privateConstructorUsedError;
  String get pjtNo => throw _privateConstructorUsedError;
  String get expDt => throw _privateConstructorUsedError;
  String get remark => throw _privateConstructorUsedError;
  String get prtNo => throw _privateConstructorUsedError;
  String get itemNm => throw _privateConstructorUsedError;
  String get lotNo => throw _privateConstructorUsedError;
  String get tagType => throw _privateConstructorUsedError;
  String get vendNm => throw _privateConstructorUsedError;
  String get dQty => throw _privateConstructorUsedError;
  double get wmsQty => throw _privateConstructorUsedError;
  String get itemCd => throw _privateConstructorUsedError;
  String get tagNo => throw _privateConstructorUsedError;
  String get totWht => throw _privateConstructorUsedError;
  String get whtUnit => throw _privateConstructorUsedError;
  String get setQty => throw _privateConstructorUsedError;
  String get boxWht => throw _privateConstructorUsedError;
  String get qrNo => throw _privateConstructorUsedError;
  double get qty => throw _privateConstructorUsedError;
  String get wmsQtyUnit => throw _privateConstructorUsedError;
  String get vendCd => throw _privateConstructorUsedError;
  String get qtyUnit => throw _privateConstructorUsedError;
  String get tagTypeNm => throw _privateConstructorUsedError;
  String get mstKey => throw _privateConstructorUsedError;
  String get prtDt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubItemCopyWith<SubItem> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubItemCopyWith<$Res> {
  factory $SubItemCopyWith(SubItem value, $Res Function(SubItem) then) =
      _$SubItemCopyWithImpl<$Res, SubItem>;
  @useResult
  $Res call(
      {int no,
      String wht,
      String custCd,
      int tagId,
      String pjtNm,
      String grpKey,
      String pjtNo,
      String expDt,
      String remark,
      String prtNo,
      String itemNm,
      String lotNo,
      String tagType,
      String vendNm,
      String dQty,
      double wmsQty,
      String itemCd,
      String tagNo,
      String totWht,
      String whtUnit,
      String setQty,
      String boxWht,
      String qrNo,
      double qty,
      String wmsQtyUnit,
      String vendCd,
      String qtyUnit,
      String tagTypeNm,
      String mstKey,
      String prtDt});
}

/// @nodoc
class _$SubItemCopyWithImpl<$Res, $Val extends SubItem>
    implements $SubItemCopyWith<$Res> {
  _$SubItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? no = null,
    Object? wht = null,
    Object? custCd = null,
    Object? tagId = null,
    Object? pjtNm = null,
    Object? grpKey = null,
    Object? pjtNo = null,
    Object? expDt = null,
    Object? remark = null,
    Object? prtNo = null,
    Object? itemNm = null,
    Object? lotNo = null,
    Object? tagType = null,
    Object? vendNm = null,
    Object? dQty = null,
    Object? wmsQty = null,
    Object? itemCd = null,
    Object? tagNo = null,
    Object? totWht = null,
    Object? whtUnit = null,
    Object? setQty = null,
    Object? boxWht = null,
    Object? qrNo = null,
    Object? qty = null,
    Object? wmsQtyUnit = null,
    Object? vendCd = null,
    Object? qtyUnit = null,
    Object? tagTypeNm = null,
    Object? mstKey = null,
    Object? prtDt = null,
  }) {
    return _then(_value.copyWith(
      no: null == no
          ? _value.no
          : no // ignore: cast_nullable_to_non_nullable
              as int,
      wht: null == wht
          ? _value.wht
          : wht // ignore: cast_nullable_to_non_nullable
              as String,
      custCd: null == custCd
          ? _value.custCd
          : custCd // ignore: cast_nullable_to_non_nullable
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
      wmsQty: null == wmsQty
          ? _value.wmsQty
          : wmsQty // ignore: cast_nullable_to_non_nullable
              as double,
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
      wmsQtyUnit: null == wmsQtyUnit
          ? _value.wmsQtyUnit
          : wmsQtyUnit // ignore: cast_nullable_to_non_nullable
              as String,
      vendCd: null == vendCd
          ? _value.vendCd
          : vendCd // ignore: cast_nullable_to_non_nullable
              as String,
      qtyUnit: null == qtyUnit
          ? _value.qtyUnit
          : qtyUnit // ignore: cast_nullable_to_non_nullable
              as String,
      tagTypeNm: null == tagTypeNm
          ? _value.tagTypeNm
          : tagTypeNm // ignore: cast_nullable_to_non_nullable
              as String,
      mstKey: null == mstKey
          ? _value.mstKey
          : mstKey // ignore: cast_nullable_to_non_nullable
              as String,
      prtDt: null == prtDt
          ? _value.prtDt
          : prtDt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubItemImplCopyWith<$Res> implements $SubItemCopyWith<$Res> {
  factory _$$SubItemImplCopyWith(
          _$SubItemImpl value, $Res Function(_$SubItemImpl) then) =
      __$$SubItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int no,
      String wht,
      String custCd,
      int tagId,
      String pjtNm,
      String grpKey,
      String pjtNo,
      String expDt,
      String remark,
      String prtNo,
      String itemNm,
      String lotNo,
      String tagType,
      String vendNm,
      String dQty,
      double wmsQty,
      String itemCd,
      String tagNo,
      String totWht,
      String whtUnit,
      String setQty,
      String boxWht,
      String qrNo,
      double qty,
      String wmsQtyUnit,
      String vendCd,
      String qtyUnit,
      String tagTypeNm,
      String mstKey,
      String prtDt});
}

/// @nodoc
class __$$SubItemImplCopyWithImpl<$Res>
    extends _$SubItemCopyWithImpl<$Res, _$SubItemImpl>
    implements _$$SubItemImplCopyWith<$Res> {
  __$$SubItemImplCopyWithImpl(
      _$SubItemImpl _value, $Res Function(_$SubItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? no = null,
    Object? wht = null,
    Object? custCd = null,
    Object? tagId = null,
    Object? pjtNm = null,
    Object? grpKey = null,
    Object? pjtNo = null,
    Object? expDt = null,
    Object? remark = null,
    Object? prtNo = null,
    Object? itemNm = null,
    Object? lotNo = null,
    Object? tagType = null,
    Object? vendNm = null,
    Object? dQty = null,
    Object? wmsQty = null,
    Object? itemCd = null,
    Object? tagNo = null,
    Object? totWht = null,
    Object? whtUnit = null,
    Object? setQty = null,
    Object? boxWht = null,
    Object? qrNo = null,
    Object? qty = null,
    Object? wmsQtyUnit = null,
    Object? vendCd = null,
    Object? qtyUnit = null,
    Object? tagTypeNm = null,
    Object? mstKey = null,
    Object? prtDt = null,
  }) {
    return _then(_$SubItemImpl(
      no: null == no
          ? _value.no
          : no // ignore: cast_nullable_to_non_nullable
              as int,
      wht: null == wht
          ? _value.wht
          : wht // ignore: cast_nullable_to_non_nullable
              as String,
      custCd: null == custCd
          ? _value.custCd
          : custCd // ignore: cast_nullable_to_non_nullable
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
      wmsQty: null == wmsQty
          ? _value.wmsQty
          : wmsQty // ignore: cast_nullable_to_non_nullable
              as double,
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
      wmsQtyUnit: null == wmsQtyUnit
          ? _value.wmsQtyUnit
          : wmsQtyUnit // ignore: cast_nullable_to_non_nullable
              as String,
      vendCd: null == vendCd
          ? _value.vendCd
          : vendCd // ignore: cast_nullable_to_non_nullable
              as String,
      qtyUnit: null == qtyUnit
          ? _value.qtyUnit
          : qtyUnit // ignore: cast_nullable_to_non_nullable
              as String,
      tagTypeNm: null == tagTypeNm
          ? _value.tagTypeNm
          : tagTypeNm // ignore: cast_nullable_to_non_nullable
              as String,
      mstKey: null == mstKey
          ? _value.mstKey
          : mstKey // ignore: cast_nullable_to_non_nullable
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
class _$SubItemImpl implements _SubItem {
  const _$SubItemImpl(
      {this.no = 0,
      this.wht = '',
      this.custCd = '',
      this.tagId = 0,
      this.pjtNm = '',
      this.grpKey = '',
      this.pjtNo = '',
      this.expDt = '',
      this.remark = '',
      this.prtNo = '',
      this.itemNm = '',
      this.lotNo = '',
      this.tagType = '',
      this.vendNm = '',
      this.dQty = '',
      this.wmsQty = 0.0,
      this.itemCd = '',
      this.tagNo = '',
      this.totWht = '',
      this.whtUnit = '',
      this.setQty = '',
      this.boxWht = '',
      this.qrNo = '',
      this.qty = 0.0,
      this.wmsQtyUnit = '',
      this.vendCd = '',
      this.qtyUnit = '',
      this.tagTypeNm = '',
      this.mstKey = '',
      this.prtDt = ''});

  factory _$SubItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubItemImplFromJson(json);

  @override
  @JsonKey()
  final int no;
  @override
  @JsonKey()
  final String wht;
  @override
  @JsonKey()
  final String custCd;
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
  final String tagType;
  @override
  @JsonKey()
  final String vendNm;
  @override
  @JsonKey()
  final String dQty;
  @override
  @JsonKey()
  final double wmsQty;
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
  final String wmsQtyUnit;
  @override
  @JsonKey()
  final String vendCd;
  @override
  @JsonKey()
  final String qtyUnit;
  @override
  @JsonKey()
  final String tagTypeNm;
  @override
  @JsonKey()
  final String mstKey;
  @override
  @JsonKey()
  final String prtDt;

  @override
  String toString() {
    return 'SubItem(no: $no, wht: $wht, custCd: $custCd, tagId: $tagId, pjtNm: $pjtNm, grpKey: $grpKey, pjtNo: $pjtNo, expDt: $expDt, remark: $remark, prtNo: $prtNo, itemNm: $itemNm, lotNo: $lotNo, tagType: $tagType, vendNm: $vendNm, dQty: $dQty, wmsQty: $wmsQty, itemCd: $itemCd, tagNo: $tagNo, totWht: $totWht, whtUnit: $whtUnit, setQty: $setQty, boxWht: $boxWht, qrNo: $qrNo, qty: $qty, wmsQtyUnit: $wmsQtyUnit, vendCd: $vendCd, qtyUnit: $qtyUnit, tagTypeNm: $tagTypeNm, mstKey: $mstKey, prtDt: $prtDt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubItemImpl &&
            (identical(other.no, no) || other.no == no) &&
            (identical(other.wht, wht) || other.wht == wht) &&
            (identical(other.custCd, custCd) || other.custCd == custCd) &&
            (identical(other.tagId, tagId) || other.tagId == tagId) &&
            (identical(other.pjtNm, pjtNm) || other.pjtNm == pjtNm) &&
            (identical(other.grpKey, grpKey) || other.grpKey == grpKey) &&
            (identical(other.pjtNo, pjtNo) || other.pjtNo == pjtNo) &&
            (identical(other.expDt, expDt) || other.expDt == expDt) &&
            (identical(other.remark, remark) || other.remark == remark) &&
            (identical(other.prtNo, prtNo) || other.prtNo == prtNo) &&
            (identical(other.itemNm, itemNm) || other.itemNm == itemNm) &&
            (identical(other.lotNo, lotNo) || other.lotNo == lotNo) &&
            (identical(other.tagType, tagType) || other.tagType == tagType) &&
            (identical(other.vendNm, vendNm) || other.vendNm == vendNm) &&
            (identical(other.dQty, dQty) || other.dQty == dQty) &&
            (identical(other.wmsQty, wmsQty) || other.wmsQty == wmsQty) &&
            (identical(other.itemCd, itemCd) || other.itemCd == itemCd) &&
            (identical(other.tagNo, tagNo) || other.tagNo == tagNo) &&
            (identical(other.totWht, totWht) || other.totWht == totWht) &&
            (identical(other.whtUnit, whtUnit) || other.whtUnit == whtUnit) &&
            (identical(other.setQty, setQty) || other.setQty == setQty) &&
            (identical(other.boxWht, boxWht) || other.boxWht == boxWht) &&
            (identical(other.qrNo, qrNo) || other.qrNo == qrNo) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.wmsQtyUnit, wmsQtyUnit) ||
                other.wmsQtyUnit == wmsQtyUnit) &&
            (identical(other.vendCd, vendCd) || other.vendCd == vendCd) &&
            (identical(other.qtyUnit, qtyUnit) || other.qtyUnit == qtyUnit) &&
            (identical(other.tagTypeNm, tagTypeNm) ||
                other.tagTypeNm == tagTypeNm) &&
            (identical(other.mstKey, mstKey) || other.mstKey == mstKey) &&
            (identical(other.prtDt, prtDt) || other.prtDt == prtDt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        no,
        wht,
        custCd,
        tagId,
        pjtNm,
        grpKey,
        pjtNo,
        expDt,
        remark,
        prtNo,
        itemNm,
        lotNo,
        tagType,
        vendNm,
        dQty,
        wmsQty,
        itemCd,
        tagNo,
        totWht,
        whtUnit,
        setQty,
        boxWht,
        qrNo,
        qty,
        wmsQtyUnit,
        vendCd,
        qtyUnit,
        tagTypeNm,
        mstKey,
        prtDt
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubItemImplCopyWith<_$SubItemImpl> get copyWith =>
      __$$SubItemImplCopyWithImpl<_$SubItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubItemImplToJson(
      this,
    );
  }
}

abstract class _SubItem implements SubItem {
  const factory _SubItem(
      {final int no,
      final String wht,
      final String custCd,
      final int tagId,
      final String pjtNm,
      final String grpKey,
      final String pjtNo,
      final String expDt,
      final String remark,
      final String prtNo,
      final String itemNm,
      final String lotNo,
      final String tagType,
      final String vendNm,
      final String dQty,
      final double wmsQty,
      final String itemCd,
      final String tagNo,
      final String totWht,
      final String whtUnit,
      final String setQty,
      final String boxWht,
      final String qrNo,
      final double qty,
      final String wmsQtyUnit,
      final String vendCd,
      final String qtyUnit,
      final String tagTypeNm,
      final String mstKey,
      final String prtDt}) = _$SubItemImpl;

  factory _SubItem.fromJson(Map<String, dynamic> json) = _$SubItemImpl.fromJson;

  @override
  int get no;
  @override
  String get wht;
  @override
  String get custCd;
  @override
  int get tagId;
  @override
  String get pjtNm;
  @override
  String get grpKey;
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
  String get tagType;
  @override
  String get vendNm;
  @override
  String get dQty;
  @override
  double get wmsQty;
  @override
  String get itemCd;
  @override
  String get tagNo;
  @override
  String get totWht;
  @override
  String get whtUnit;
  @override
  String get setQty;
  @override
  String get boxWht;
  @override
  String get qrNo;
  @override
  double get qty;
  @override
  String get wmsQtyUnit;
  @override
  String get vendCd;
  @override
  String get qtyUnit;
  @override
  String get tagTypeNm;
  @override
  String get mstKey;
  @override
  String get prtDt;
  @override
  @JsonKey(ignore: true)
  _$$SubItemImplCopyWith<_$SubItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
