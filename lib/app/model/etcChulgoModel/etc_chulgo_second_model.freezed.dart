// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'etc_chulgo_second_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EtcChulgoSecondModel _$EtcChulgoSecondModelFromJson(Map<String, dynamic> json) {
  return _EtcChulgoSecondModel.fromJson(json);
}

/// @nodoc
mixin _$EtcChulgoSecondModel {
  Header? get header => throw _privateConstructorUsedError;
  String get resultCode => throw _privateConstructorUsedError;
  String get resultMessage => throw _privateConstructorUsedError;
  List<dynamic>? get body => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EtcChulgoSecondModelCopyWith<EtcChulgoSecondModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EtcChulgoSecondModelCopyWith<$Res> {
  factory $EtcChulgoSecondModelCopyWith(EtcChulgoSecondModel value,
          $Res Function(EtcChulgoSecondModel) then) =
      _$EtcChulgoSecondModelCopyWithImpl<$Res, EtcChulgoSecondModel>;
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
class _$EtcChulgoSecondModelCopyWithImpl<$Res,
        $Val extends EtcChulgoSecondModel>
    implements $EtcChulgoSecondModelCopyWith<$Res> {
  _$EtcChulgoSecondModelCopyWithImpl(this._value, this._then);

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
abstract class _$$EtcChulgoSecondModelImplCopyWith<$Res>
    implements $EtcChulgoSecondModelCopyWith<$Res> {
  factory _$$EtcChulgoSecondModelImplCopyWith(_$EtcChulgoSecondModelImpl value,
          $Res Function(_$EtcChulgoSecondModelImpl) then) =
      __$$EtcChulgoSecondModelImplCopyWithImpl<$Res>;
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
class __$$EtcChulgoSecondModelImplCopyWithImpl<$Res>
    extends _$EtcChulgoSecondModelCopyWithImpl<$Res, _$EtcChulgoSecondModelImpl>
    implements _$$EtcChulgoSecondModelImplCopyWith<$Res> {
  __$$EtcChulgoSecondModelImplCopyWithImpl(_$EtcChulgoSecondModelImpl _value,
      $Res Function(_$EtcChulgoSecondModelImpl) _then)
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
    return _then(_$EtcChulgoSecondModelImpl(
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
class _$EtcChulgoSecondModelImpl implements _EtcChulgoSecondModel {
  const _$EtcChulgoSecondModelImpl(
      {this.header,
      this.resultCode = '',
      this.resultMessage = '',
      final List<dynamic>? body,
      this.hasError = false})
      : _body = body;

  factory _$EtcChulgoSecondModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EtcChulgoSecondModelImplFromJson(json);

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
    return 'EtcChulgoSecondModel(header: $header, resultCode: $resultCode, resultMessage: $resultMessage, body: $body, hasError: $hasError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EtcChulgoSecondModelImpl &&
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
  _$$EtcChulgoSecondModelImplCopyWith<_$EtcChulgoSecondModelImpl>
      get copyWith =>
          __$$EtcChulgoSecondModelImplCopyWithImpl<_$EtcChulgoSecondModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EtcChulgoSecondModelImplToJson(
      this,
    );
  }
}

abstract class _EtcChulgoSecondModel implements EtcChulgoSecondModel {
  const factory _EtcChulgoSecondModel(
      {final Header? header,
      final String resultCode,
      final String resultMessage,
      final List<dynamic>? body,
      final bool hasError}) = _$EtcChulgoSecondModelImpl;

  factory _EtcChulgoSecondModel.fromJson(Map<String, dynamic> json) =
      _$EtcChulgoSecondModelImpl.fromJson;

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
  _$$EtcChulgoSecondModelImplCopyWith<_$EtcChulgoSecondModelImpl>
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

Detail _$DetailFromJson(Map<String, dynamic> json) {
  return _Detail.fromJson(json);
}

/// @nodoc
mixin _$Detail {
  int get checkBoxRowspan => throw _privateConstructorUsedError;
  int get tagTypeRowspan => throw _privateConstructorUsedError;
  String get grpKey => throw _privateConstructorUsedError;
  String get qtyUnitMaster => throw _privateConstructorUsedError;
  String get itemNm => throw _privateConstructorUsedError;
  int get selectedRowspan => throw _privateConstructorUsedError;
  int get prtDtRowspan => throw _privateConstructorUsedError;
  int get tagSeq => throw _privateConstructorUsedError;
  int get pjtNmRowspan => throw _privateConstructorUsedError;
  bool get selected => throw _privateConstructorUsedError;
  dynamic get qtyUse => throw _privateConstructorUsedError;
  int get remarkRowspan => throw _privateConstructorUsedError;
  int get qtyUseRowspan => throw _privateConstructorUsedError;
  String get whCd => throw _privateConstructorUsedError;
  int get qtyRemainRowspan => throw _privateConstructorUsedError;
  int get otbNoRowspan => throw _privateConstructorUsedError;
  int get otbDtRowspan => throw _privateConstructorUsedError;
  int get tagNoRowspan => throw _privateConstructorUsedError;
  String get plant => throw _privateConstructorUsedError;
  int get qty => throw _privateConstructorUsedError;
  int get setQtyRowspan => throw _privateConstructorUsedError;
  String get prtDt => throw _privateConstructorUsedError;
  int get qtyUnitMasterRowspan => throw _privateConstructorUsedError;
  int get no => throw _privateConstructorUsedError;
  int get zoneNmRowspan => throw _privateConstructorUsedError;
  int get wht => throw _privateConstructorUsedError;
  int get tagId => throw _privateConstructorUsedError;
  String get pjtNm => throw _privateConstructorUsedError;
  String get whNm => throw _privateConstructorUsedError;
  int get qtyRowspan => throw _privateConstructorUsedError;
  String get expDt => throw _privateConstructorUsedError;
  String get remark => throw _privateConstructorUsedError;
  int get tagTypeNmRowspan => throw _privateConstructorUsedError;
  String get lotNo => throw _privateConstructorUsedError;
  String get usrNm => throw _privateConstructorUsedError;
  int get vendNmRowspan => throw _privateConstructorUsedError;
  int get noRowspan => throw _privateConstructorUsedError;
  String get tagType => throw _privateConstructorUsedError;
  String get dtlKey => throw _privateConstructorUsedError;
  String get vendNm => throw _privateConstructorUsedError;
  int get whNmRowspan => throw _privateConstructorUsedError;
  String get otbDt => throw _privateConstructorUsedError;
  String get locCd => throw _privateConstructorUsedError;
  String get tagNo => throw _privateConstructorUsedError;
  String get itemCd => throw _privateConstructorUsedError;
  String get otbNo => throw _privateConstructorUsedError;
  int get locCdRowspan => throw _privateConstructorUsedError;
  String get whtUnit => throw _privateConstructorUsedError;
  String get zoneNm => throw _privateConstructorUsedError;
  int get setQty => throw _privateConstructorUsedError;
  String get qrNo => throw _privateConstructorUsedError;
  int get usrNmRowspan => throw _privateConstructorUsedError;
  String get tagTypeNm => throw _privateConstructorUsedError;
  String get mstKey => throw _privateConstructorUsedError;
  String get qtyRemain => throw _privateConstructorUsedError;
  String get qtyUnitDetail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailCopyWith<Detail> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailCopyWith<$Res> {
  factory $DetailCopyWith(Detail value, $Res Function(Detail) then) =
      _$DetailCopyWithImpl<$Res, Detail>;
  @useResult
  $Res call(
      {int checkBoxRowspan,
      int tagTypeRowspan,
      String grpKey,
      String qtyUnitMaster,
      String itemNm,
      int selectedRowspan,
      int prtDtRowspan,
      int tagSeq,
      int pjtNmRowspan,
      bool selected,
      dynamic qtyUse,
      int remarkRowspan,
      int qtyUseRowspan,
      String whCd,
      int qtyRemainRowspan,
      int otbNoRowspan,
      int otbDtRowspan,
      int tagNoRowspan,
      String plant,
      int qty,
      int setQtyRowspan,
      String prtDt,
      int qtyUnitMasterRowspan,
      int no,
      int zoneNmRowspan,
      int wht,
      int tagId,
      String pjtNm,
      String whNm,
      int qtyRowspan,
      String expDt,
      String remark,
      int tagTypeNmRowspan,
      String lotNo,
      String usrNm,
      int vendNmRowspan,
      int noRowspan,
      String tagType,
      String dtlKey,
      String vendNm,
      int whNmRowspan,
      String otbDt,
      String locCd,
      String tagNo,
      String itemCd,
      String otbNo,
      int locCdRowspan,
      String whtUnit,
      String zoneNm,
      int setQty,
      String qrNo,
      int usrNmRowspan,
      String tagTypeNm,
      String mstKey,
      String qtyRemain,
      String qtyUnitDetail});
}

/// @nodoc
class _$DetailCopyWithImpl<$Res, $Val extends Detail>
    implements $DetailCopyWith<$Res> {
  _$DetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checkBoxRowspan = null,
    Object? tagTypeRowspan = null,
    Object? grpKey = null,
    Object? qtyUnitMaster = null,
    Object? itemNm = null,
    Object? selectedRowspan = null,
    Object? prtDtRowspan = null,
    Object? tagSeq = null,
    Object? pjtNmRowspan = null,
    Object? selected = null,
    Object? qtyUse = freezed,
    Object? remarkRowspan = null,
    Object? qtyUseRowspan = null,
    Object? whCd = null,
    Object? qtyRemainRowspan = null,
    Object? otbNoRowspan = null,
    Object? otbDtRowspan = null,
    Object? tagNoRowspan = null,
    Object? plant = null,
    Object? qty = null,
    Object? setQtyRowspan = null,
    Object? prtDt = null,
    Object? qtyUnitMasterRowspan = null,
    Object? no = null,
    Object? zoneNmRowspan = null,
    Object? wht = null,
    Object? tagId = null,
    Object? pjtNm = null,
    Object? whNm = null,
    Object? qtyRowspan = null,
    Object? expDt = null,
    Object? remark = null,
    Object? tagTypeNmRowspan = null,
    Object? lotNo = null,
    Object? usrNm = null,
    Object? vendNmRowspan = null,
    Object? noRowspan = null,
    Object? tagType = null,
    Object? dtlKey = null,
    Object? vendNm = null,
    Object? whNmRowspan = null,
    Object? otbDt = null,
    Object? locCd = null,
    Object? tagNo = null,
    Object? itemCd = null,
    Object? otbNo = null,
    Object? locCdRowspan = null,
    Object? whtUnit = null,
    Object? zoneNm = null,
    Object? setQty = null,
    Object? qrNo = null,
    Object? usrNmRowspan = null,
    Object? tagTypeNm = null,
    Object? mstKey = null,
    Object? qtyRemain = null,
    Object? qtyUnitDetail = null,
  }) {
    return _then(_value.copyWith(
      checkBoxRowspan: null == checkBoxRowspan
          ? _value.checkBoxRowspan
          : checkBoxRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      tagTypeRowspan: null == tagTypeRowspan
          ? _value.tagTypeRowspan
          : tagTypeRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      grpKey: null == grpKey
          ? _value.grpKey
          : grpKey // ignore: cast_nullable_to_non_nullable
              as String,
      qtyUnitMaster: null == qtyUnitMaster
          ? _value.qtyUnitMaster
          : qtyUnitMaster // ignore: cast_nullable_to_non_nullable
              as String,
      itemNm: null == itemNm
          ? _value.itemNm
          : itemNm // ignore: cast_nullable_to_non_nullable
              as String,
      selectedRowspan: null == selectedRowspan
          ? _value.selectedRowspan
          : selectedRowspan // ignore: cast_nullable_to_non_nullable
              as int,
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
              as bool,
      qtyUse: freezed == qtyUse
          ? _value.qtyUse
          : qtyUse // ignore: cast_nullable_to_non_nullable
              as dynamic,
      remarkRowspan: null == remarkRowspan
          ? _value.remarkRowspan
          : remarkRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      qtyUseRowspan: null == qtyUseRowspan
          ? _value.qtyUseRowspan
          : qtyUseRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      whCd: null == whCd
          ? _value.whCd
          : whCd // ignore: cast_nullable_to_non_nullable
              as String,
      qtyRemainRowspan: null == qtyRemainRowspan
          ? _value.qtyRemainRowspan
          : qtyRemainRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      otbNoRowspan: null == otbNoRowspan
          ? _value.otbNoRowspan
          : otbNoRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      otbDtRowspan: null == otbDtRowspan
          ? _value.otbDtRowspan
          : otbDtRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      tagNoRowspan: null == tagNoRowspan
          ? _value.tagNoRowspan
          : tagNoRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      plant: null == plant
          ? _value.plant
          : plant // ignore: cast_nullable_to_non_nullable
              as String,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      setQtyRowspan: null == setQtyRowspan
          ? _value.setQtyRowspan
          : setQtyRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      prtDt: null == prtDt
          ? _value.prtDt
          : prtDt // ignore: cast_nullable_to_non_nullable
              as String,
      qtyUnitMasterRowspan: null == qtyUnitMasterRowspan
          ? _value.qtyUnitMasterRowspan
          : qtyUnitMasterRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      no: null == no
          ? _value.no
          : no // ignore: cast_nullable_to_non_nullable
              as int,
      zoneNmRowspan: null == zoneNmRowspan
          ? _value.zoneNmRowspan
          : zoneNmRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      wht: null == wht
          ? _value.wht
          : wht // ignore: cast_nullable_to_non_nullable
              as int,
      tagId: null == tagId
          ? _value.tagId
          : tagId // ignore: cast_nullable_to_non_nullable
              as int,
      pjtNm: null == pjtNm
          ? _value.pjtNm
          : pjtNm // ignore: cast_nullable_to_non_nullable
              as String,
      whNm: null == whNm
          ? _value.whNm
          : whNm // ignore: cast_nullable_to_non_nullable
              as String,
      qtyRowspan: null == qtyRowspan
          ? _value.qtyRowspan
          : qtyRowspan // ignore: cast_nullable_to_non_nullable
              as int,
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
      noRowspan: null == noRowspan
          ? _value.noRowspan
          : noRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      tagType: null == tagType
          ? _value.tagType
          : tagType // ignore: cast_nullable_to_non_nullable
              as String,
      dtlKey: null == dtlKey
          ? _value.dtlKey
          : dtlKey // ignore: cast_nullable_to_non_nullable
              as String,
      vendNm: null == vendNm
          ? _value.vendNm
          : vendNm // ignore: cast_nullable_to_non_nullable
              as String,
      whNmRowspan: null == whNmRowspan
          ? _value.whNmRowspan
          : whNmRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      otbDt: null == otbDt
          ? _value.otbDt
          : otbDt // ignore: cast_nullable_to_non_nullable
              as String,
      locCd: null == locCd
          ? _value.locCd
          : locCd // ignore: cast_nullable_to_non_nullable
              as String,
      tagNo: null == tagNo
          ? _value.tagNo
          : tagNo // ignore: cast_nullable_to_non_nullable
              as String,
      itemCd: null == itemCd
          ? _value.itemCd
          : itemCd // ignore: cast_nullable_to_non_nullable
              as String,
      otbNo: null == otbNo
          ? _value.otbNo
          : otbNo // ignore: cast_nullable_to_non_nullable
              as String,
      locCdRowspan: null == locCdRowspan
          ? _value.locCdRowspan
          : locCdRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      whtUnit: null == whtUnit
          ? _value.whtUnit
          : whtUnit // ignore: cast_nullable_to_non_nullable
              as String,
      zoneNm: null == zoneNm
          ? _value.zoneNm
          : zoneNm // ignore: cast_nullable_to_non_nullable
              as String,
      setQty: null == setQty
          ? _value.setQty
          : setQty // ignore: cast_nullable_to_non_nullable
              as int,
      qrNo: null == qrNo
          ? _value.qrNo
          : qrNo // ignore: cast_nullable_to_non_nullable
              as String,
      usrNmRowspan: null == usrNmRowspan
          ? _value.usrNmRowspan
          : usrNmRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      tagTypeNm: null == tagTypeNm
          ? _value.tagTypeNm
          : tagTypeNm // ignore: cast_nullable_to_non_nullable
              as String,
      mstKey: null == mstKey
          ? _value.mstKey
          : mstKey // ignore: cast_nullable_to_non_nullable
              as String,
      qtyRemain: null == qtyRemain
          ? _value.qtyRemain
          : qtyRemain // ignore: cast_nullable_to_non_nullable
              as String,
      qtyUnitDetail: null == qtyUnitDetail
          ? _value.qtyUnitDetail
          : qtyUnitDetail // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailImplCopyWith<$Res> implements $DetailCopyWith<$Res> {
  factory _$$DetailImplCopyWith(
          _$DetailImpl value, $Res Function(_$DetailImpl) then) =
      __$$DetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int checkBoxRowspan,
      int tagTypeRowspan,
      String grpKey,
      String qtyUnitMaster,
      String itemNm,
      int selectedRowspan,
      int prtDtRowspan,
      int tagSeq,
      int pjtNmRowspan,
      bool selected,
      dynamic qtyUse,
      int remarkRowspan,
      int qtyUseRowspan,
      String whCd,
      int qtyRemainRowspan,
      int otbNoRowspan,
      int otbDtRowspan,
      int tagNoRowspan,
      String plant,
      int qty,
      int setQtyRowspan,
      String prtDt,
      int qtyUnitMasterRowspan,
      int no,
      int zoneNmRowspan,
      int wht,
      int tagId,
      String pjtNm,
      String whNm,
      int qtyRowspan,
      String expDt,
      String remark,
      int tagTypeNmRowspan,
      String lotNo,
      String usrNm,
      int vendNmRowspan,
      int noRowspan,
      String tagType,
      String dtlKey,
      String vendNm,
      int whNmRowspan,
      String otbDt,
      String locCd,
      String tagNo,
      String itemCd,
      String otbNo,
      int locCdRowspan,
      String whtUnit,
      String zoneNm,
      int setQty,
      String qrNo,
      int usrNmRowspan,
      String tagTypeNm,
      String mstKey,
      String qtyRemain,
      String qtyUnitDetail});
}

/// @nodoc
class __$$DetailImplCopyWithImpl<$Res>
    extends _$DetailCopyWithImpl<$Res, _$DetailImpl>
    implements _$$DetailImplCopyWith<$Res> {
  __$$DetailImplCopyWithImpl(
      _$DetailImpl _value, $Res Function(_$DetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checkBoxRowspan = null,
    Object? tagTypeRowspan = null,
    Object? grpKey = null,
    Object? qtyUnitMaster = null,
    Object? itemNm = null,
    Object? selectedRowspan = null,
    Object? prtDtRowspan = null,
    Object? tagSeq = null,
    Object? pjtNmRowspan = null,
    Object? selected = null,
    Object? qtyUse = freezed,
    Object? remarkRowspan = null,
    Object? qtyUseRowspan = null,
    Object? whCd = null,
    Object? qtyRemainRowspan = null,
    Object? otbNoRowspan = null,
    Object? otbDtRowspan = null,
    Object? tagNoRowspan = null,
    Object? plant = null,
    Object? qty = null,
    Object? setQtyRowspan = null,
    Object? prtDt = null,
    Object? qtyUnitMasterRowspan = null,
    Object? no = null,
    Object? zoneNmRowspan = null,
    Object? wht = null,
    Object? tagId = null,
    Object? pjtNm = null,
    Object? whNm = null,
    Object? qtyRowspan = null,
    Object? expDt = null,
    Object? remark = null,
    Object? tagTypeNmRowspan = null,
    Object? lotNo = null,
    Object? usrNm = null,
    Object? vendNmRowspan = null,
    Object? noRowspan = null,
    Object? tagType = null,
    Object? dtlKey = null,
    Object? vendNm = null,
    Object? whNmRowspan = null,
    Object? otbDt = null,
    Object? locCd = null,
    Object? tagNo = null,
    Object? itemCd = null,
    Object? otbNo = null,
    Object? locCdRowspan = null,
    Object? whtUnit = null,
    Object? zoneNm = null,
    Object? setQty = null,
    Object? qrNo = null,
    Object? usrNmRowspan = null,
    Object? tagTypeNm = null,
    Object? mstKey = null,
    Object? qtyRemain = null,
    Object? qtyUnitDetail = null,
  }) {
    return _then(_$DetailImpl(
      checkBoxRowspan: null == checkBoxRowspan
          ? _value.checkBoxRowspan
          : checkBoxRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      tagTypeRowspan: null == tagTypeRowspan
          ? _value.tagTypeRowspan
          : tagTypeRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      grpKey: null == grpKey
          ? _value.grpKey
          : grpKey // ignore: cast_nullable_to_non_nullable
              as String,
      qtyUnitMaster: null == qtyUnitMaster
          ? _value.qtyUnitMaster
          : qtyUnitMaster // ignore: cast_nullable_to_non_nullable
              as String,
      itemNm: null == itemNm
          ? _value.itemNm
          : itemNm // ignore: cast_nullable_to_non_nullable
              as String,
      selectedRowspan: null == selectedRowspan
          ? _value.selectedRowspan
          : selectedRowspan // ignore: cast_nullable_to_non_nullable
              as int,
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
              as bool,
      qtyUse: freezed == qtyUse ? _value.qtyUse! : qtyUse,
      remarkRowspan: null == remarkRowspan
          ? _value.remarkRowspan
          : remarkRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      qtyUseRowspan: null == qtyUseRowspan
          ? _value.qtyUseRowspan
          : qtyUseRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      whCd: null == whCd
          ? _value.whCd
          : whCd // ignore: cast_nullable_to_non_nullable
              as String,
      qtyRemainRowspan: null == qtyRemainRowspan
          ? _value.qtyRemainRowspan
          : qtyRemainRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      otbNoRowspan: null == otbNoRowspan
          ? _value.otbNoRowspan
          : otbNoRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      otbDtRowspan: null == otbDtRowspan
          ? _value.otbDtRowspan
          : otbDtRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      tagNoRowspan: null == tagNoRowspan
          ? _value.tagNoRowspan
          : tagNoRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      plant: null == plant
          ? _value.plant
          : plant // ignore: cast_nullable_to_non_nullable
              as String,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      setQtyRowspan: null == setQtyRowspan
          ? _value.setQtyRowspan
          : setQtyRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      prtDt: null == prtDt
          ? _value.prtDt
          : prtDt // ignore: cast_nullable_to_non_nullable
              as String,
      qtyUnitMasterRowspan: null == qtyUnitMasterRowspan
          ? _value.qtyUnitMasterRowspan
          : qtyUnitMasterRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      no: null == no
          ? _value.no
          : no // ignore: cast_nullable_to_non_nullable
              as int,
      zoneNmRowspan: null == zoneNmRowspan
          ? _value.zoneNmRowspan
          : zoneNmRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      wht: null == wht
          ? _value.wht
          : wht // ignore: cast_nullable_to_non_nullable
              as int,
      tagId: null == tagId
          ? _value.tagId
          : tagId // ignore: cast_nullable_to_non_nullable
              as int,
      pjtNm: null == pjtNm
          ? _value.pjtNm
          : pjtNm // ignore: cast_nullable_to_non_nullable
              as String,
      whNm: null == whNm
          ? _value.whNm
          : whNm // ignore: cast_nullable_to_non_nullable
              as String,
      qtyRowspan: null == qtyRowspan
          ? _value.qtyRowspan
          : qtyRowspan // ignore: cast_nullable_to_non_nullable
              as int,
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
      noRowspan: null == noRowspan
          ? _value.noRowspan
          : noRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      tagType: null == tagType
          ? _value.tagType
          : tagType // ignore: cast_nullable_to_non_nullable
              as String,
      dtlKey: null == dtlKey
          ? _value.dtlKey
          : dtlKey // ignore: cast_nullable_to_non_nullable
              as String,
      vendNm: null == vendNm
          ? _value.vendNm
          : vendNm // ignore: cast_nullable_to_non_nullable
              as String,
      whNmRowspan: null == whNmRowspan
          ? _value.whNmRowspan
          : whNmRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      otbDt: null == otbDt
          ? _value.otbDt
          : otbDt // ignore: cast_nullable_to_non_nullable
              as String,
      locCd: null == locCd
          ? _value.locCd
          : locCd // ignore: cast_nullable_to_non_nullable
              as String,
      tagNo: null == tagNo
          ? _value.tagNo
          : tagNo // ignore: cast_nullable_to_non_nullable
              as String,
      itemCd: null == itemCd
          ? _value.itemCd
          : itemCd // ignore: cast_nullable_to_non_nullable
              as String,
      otbNo: null == otbNo
          ? _value.otbNo
          : otbNo // ignore: cast_nullable_to_non_nullable
              as String,
      locCdRowspan: null == locCdRowspan
          ? _value.locCdRowspan
          : locCdRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      whtUnit: null == whtUnit
          ? _value.whtUnit
          : whtUnit // ignore: cast_nullable_to_non_nullable
              as String,
      zoneNm: null == zoneNm
          ? _value.zoneNm
          : zoneNm // ignore: cast_nullable_to_non_nullable
              as String,
      setQty: null == setQty
          ? _value.setQty
          : setQty // ignore: cast_nullable_to_non_nullable
              as int,
      qrNo: null == qrNo
          ? _value.qrNo
          : qrNo // ignore: cast_nullable_to_non_nullable
              as String,
      usrNmRowspan: null == usrNmRowspan
          ? _value.usrNmRowspan
          : usrNmRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      tagTypeNm: null == tagTypeNm
          ? _value.tagTypeNm
          : tagTypeNm // ignore: cast_nullable_to_non_nullable
              as String,
      mstKey: null == mstKey
          ? _value.mstKey
          : mstKey // ignore: cast_nullable_to_non_nullable
              as String,
      qtyRemain: null == qtyRemain
          ? _value.qtyRemain
          : qtyRemain // ignore: cast_nullable_to_non_nullable
              as String,
      qtyUnitDetail: null == qtyUnitDetail
          ? _value.qtyUnitDetail
          : qtyUnitDetail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailImpl implements _Detail {
  const _$DetailImpl(
      {this.checkBoxRowspan = 0,
      this.tagTypeRowspan = 0,
      this.grpKey = '',
      this.qtyUnitMaster = '',
      this.itemNm = '',
      this.selectedRowspan = 0,
      this.prtDtRowspan = 0,
      this.tagSeq = 0,
      this.pjtNmRowspan = 0,
      this.selected = false,
      this.qtyUse = false,
      this.remarkRowspan = 0,
      this.qtyUseRowspan = 0,
      this.whCd = '',
      this.qtyRemainRowspan = 0,
      this.otbNoRowspan = 0,
      this.otbDtRowspan = 0,
      this.tagNoRowspan = 0,
      this.plant = '',
      this.qty = 0,
      this.setQtyRowspan = 0,
      this.prtDt = '',
      this.qtyUnitMasterRowspan = 0,
      this.no = 0,
      this.zoneNmRowspan = 0,
      this.wht = 0,
      this.tagId = 0,
      this.pjtNm = '',
      this.whNm = '',
      this.qtyRowspan = 0,
      this.expDt = '',
      this.remark = '',
      this.tagTypeNmRowspan = 0,
      this.lotNo = '',
      this.usrNm = '',
      this.vendNmRowspan = 0,
      this.noRowspan = 0,
      this.tagType = '',
      this.dtlKey = '',
      this.vendNm = '',
      this.whNmRowspan = 0,
      this.otbDt = '',
      this.locCd = '',
      this.tagNo = '',
      this.itemCd = '',
      this.otbNo = '',
      this.locCdRowspan = 0,
      this.whtUnit = '',
      this.zoneNm = '',
      this.setQty = 0,
      this.qrNo = '',
      this.usrNmRowspan = 0,
      this.tagTypeNm = '',
      this.mstKey = '',
      this.qtyRemain = '',
      this.qtyUnitDetail = ''});

  factory _$DetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailImplFromJson(json);

  @override
  @JsonKey()
  final int checkBoxRowspan;
  @override
  @JsonKey()
  final int tagTypeRowspan;
  @override
  @JsonKey()
  final String grpKey;
  @override
  @JsonKey()
  final String qtyUnitMaster;
  @override
  @JsonKey()
  final String itemNm;
  @override
  @JsonKey()
  final int selectedRowspan;
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
  final bool selected;
  @override
  @JsonKey()
  final dynamic qtyUse;
  @override
  @JsonKey()
  final int remarkRowspan;
  @override
  @JsonKey()
  final int qtyUseRowspan;
  @override
  @JsonKey()
  final String whCd;
  @override
  @JsonKey()
  final int qtyRemainRowspan;
  @override
  @JsonKey()
  final int otbNoRowspan;
  @override
  @JsonKey()
  final int otbDtRowspan;
  @override
  @JsonKey()
  final int tagNoRowspan;
  @override
  @JsonKey()
  final String plant;
  @override
  @JsonKey()
  final int qty;
  @override
  @JsonKey()
  final int setQtyRowspan;
  @override
  @JsonKey()
  final String prtDt;
  @override
  @JsonKey()
  final int qtyUnitMasterRowspan;
  @override
  @JsonKey()
  final int no;
  @override
  @JsonKey()
  final int zoneNmRowspan;
  @override
  @JsonKey()
  final int wht;
  @override
  @JsonKey()
  final int tagId;
  @override
  @JsonKey()
  final String pjtNm;
  @override
  @JsonKey()
  final String whNm;
  @override
  @JsonKey()
  final int qtyRowspan;
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
  final String lotNo;
  @override
  @JsonKey()
  final String usrNm;
  @override
  @JsonKey()
  final int vendNmRowspan;
  @override
  @JsonKey()
  final int noRowspan;
  @override
  @JsonKey()
  final String tagType;
  @override
  @JsonKey()
  final String dtlKey;
  @override
  @JsonKey()
  final String vendNm;
  @override
  @JsonKey()
  final int whNmRowspan;
  @override
  @JsonKey()
  final String otbDt;
  @override
  @JsonKey()
  final String locCd;
  @override
  @JsonKey()
  final String tagNo;
  @override
  @JsonKey()
  final String itemCd;
  @override
  @JsonKey()
  final String otbNo;
  @override
  @JsonKey()
  final int locCdRowspan;
  @override
  @JsonKey()
  final String whtUnit;
  @override
  @JsonKey()
  final String zoneNm;
  @override
  @JsonKey()
  final int setQty;
  @override
  @JsonKey()
  final String qrNo;
  @override
  @JsonKey()
  final int usrNmRowspan;
  @override
  @JsonKey()
  final String tagTypeNm;
  @override
  @JsonKey()
  final String mstKey;
  @override
  @JsonKey()
  final String qtyRemain;
  @override
  @JsonKey()
  final String qtyUnitDetail;

  @override
  String toString() {
    return 'Detail(checkBoxRowspan: $checkBoxRowspan, tagTypeRowspan: $tagTypeRowspan, grpKey: $grpKey, qtyUnitMaster: $qtyUnitMaster, itemNm: $itemNm, selectedRowspan: $selectedRowspan, prtDtRowspan: $prtDtRowspan, tagSeq: $tagSeq, pjtNmRowspan: $pjtNmRowspan, selected: $selected, qtyUse: $qtyUse, remarkRowspan: $remarkRowspan, qtyUseRowspan: $qtyUseRowspan, whCd: $whCd, qtyRemainRowspan: $qtyRemainRowspan, otbNoRowspan: $otbNoRowspan, otbDtRowspan: $otbDtRowspan, tagNoRowspan: $tagNoRowspan, plant: $plant, qty: $qty, setQtyRowspan: $setQtyRowspan, prtDt: $prtDt, qtyUnitMasterRowspan: $qtyUnitMasterRowspan, no: $no, zoneNmRowspan: $zoneNmRowspan, wht: $wht, tagId: $tagId, pjtNm: $pjtNm, whNm: $whNm, qtyRowspan: $qtyRowspan, expDt: $expDt, remark: $remark, tagTypeNmRowspan: $tagTypeNmRowspan, lotNo: $lotNo, usrNm: $usrNm, vendNmRowspan: $vendNmRowspan, noRowspan: $noRowspan, tagType: $tagType, dtlKey: $dtlKey, vendNm: $vendNm, whNmRowspan: $whNmRowspan, otbDt: $otbDt, locCd: $locCd, tagNo: $tagNo, itemCd: $itemCd, otbNo: $otbNo, locCdRowspan: $locCdRowspan, whtUnit: $whtUnit, zoneNm: $zoneNm, setQty: $setQty, qrNo: $qrNo, usrNmRowspan: $usrNmRowspan, tagTypeNm: $tagTypeNm, mstKey: $mstKey, qtyRemain: $qtyRemain, qtyUnitDetail: $qtyUnitDetail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailImpl &&
            (identical(other.checkBoxRowspan, checkBoxRowspan) ||
                other.checkBoxRowspan == checkBoxRowspan) &&
            (identical(other.tagTypeRowspan, tagTypeRowspan) ||
                other.tagTypeRowspan == tagTypeRowspan) &&
            (identical(other.grpKey, grpKey) || other.grpKey == grpKey) &&
            (identical(other.qtyUnitMaster, qtyUnitMaster) ||
                other.qtyUnitMaster == qtyUnitMaster) &&
            (identical(other.itemNm, itemNm) || other.itemNm == itemNm) &&
            (identical(other.selectedRowspan, selectedRowspan) ||
                other.selectedRowspan == selectedRowspan) &&
            (identical(other.prtDtRowspan, prtDtRowspan) ||
                other.prtDtRowspan == prtDtRowspan) &&
            (identical(other.tagSeq, tagSeq) || other.tagSeq == tagSeq) &&
            (identical(other.pjtNmRowspan, pjtNmRowspan) ||
                other.pjtNmRowspan == pjtNmRowspan) &&
            (identical(other.selected, selected) ||
                other.selected == selected) &&
            const DeepCollectionEquality().equals(other.qtyUse, qtyUse) &&
            (identical(other.remarkRowspan, remarkRowspan) ||
                other.remarkRowspan == remarkRowspan) &&
            (identical(other.qtyUseRowspan, qtyUseRowspan) ||
                other.qtyUseRowspan == qtyUseRowspan) &&
            (identical(other.whCd, whCd) || other.whCd == whCd) &&
            (identical(other.qtyRemainRowspan, qtyRemainRowspan) ||
                other.qtyRemainRowspan == qtyRemainRowspan) &&
            (identical(other.otbNoRowspan, otbNoRowspan) ||
                other.otbNoRowspan == otbNoRowspan) &&
            (identical(other.otbDtRowspan, otbDtRowspan) ||
                other.otbDtRowspan == otbDtRowspan) &&
            (identical(other.tagNoRowspan, tagNoRowspan) ||
                other.tagNoRowspan == tagNoRowspan) &&
            (identical(other.plant, plant) || other.plant == plant) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.setQtyRowspan, setQtyRowspan) ||
                other.setQtyRowspan == setQtyRowspan) &&
            (identical(other.prtDt, prtDt) || other.prtDt == prtDt) &&
            (identical(other.qtyUnitMasterRowspan, qtyUnitMasterRowspan) ||
                other.qtyUnitMasterRowspan == qtyUnitMasterRowspan) &&
            (identical(other.no, no) || other.no == no) &&
            (identical(other.zoneNmRowspan, zoneNmRowspan) ||
                other.zoneNmRowspan == zoneNmRowspan) &&
            (identical(other.wht, wht) || other.wht == wht) &&
            (identical(other.tagId, tagId) || other.tagId == tagId) &&
            (identical(other.pjtNm, pjtNm) || other.pjtNm == pjtNm) &&
            (identical(other.whNm, whNm) || other.whNm == whNm) &&
            (identical(other.qtyRowspan, qtyRowspan) ||
                other.qtyRowspan == qtyRowspan) &&
            (identical(other.expDt, expDt) || other.expDt == expDt) &&
            (identical(other.remark, remark) || other.remark == remark) &&
            (identical(other.tagTypeNmRowspan, tagTypeNmRowspan) ||
                other.tagTypeNmRowspan == tagTypeNmRowspan) &&
            (identical(other.lotNo, lotNo) || other.lotNo == lotNo) &&
            (identical(other.usrNm, usrNm) || other.usrNm == usrNm) &&
            (identical(other.vendNmRowspan, vendNmRowspan) ||
                other.vendNmRowspan == vendNmRowspan) &&
            (identical(other.noRowspan, noRowspan) ||
                other.noRowspan == noRowspan) &&
            (identical(other.tagType, tagType) || other.tagType == tagType) &&
            (identical(other.dtlKey, dtlKey) || other.dtlKey == dtlKey) &&
            (identical(other.vendNm, vendNm) || other.vendNm == vendNm) &&
            (identical(other.whNmRowspan, whNmRowspan) ||
                other.whNmRowspan == whNmRowspan) &&
            (identical(other.otbDt, otbDt) || other.otbDt == otbDt) &&
            (identical(other.locCd, locCd) || other.locCd == locCd) &&
            (identical(other.tagNo, tagNo) || other.tagNo == tagNo) &&
            (identical(other.itemCd, itemCd) || other.itemCd == itemCd) &&
            (identical(other.otbNo, otbNo) || other.otbNo == otbNo) &&
            (identical(other.locCdRowspan, locCdRowspan) ||
                other.locCdRowspan == locCdRowspan) &&
            (identical(other.whtUnit, whtUnit) || other.whtUnit == whtUnit) &&
            (identical(other.zoneNm, zoneNm) || other.zoneNm == zoneNm) &&
            (identical(other.setQty, setQty) || other.setQty == setQty) &&
            (identical(other.qrNo, qrNo) || other.qrNo == qrNo) &&
            (identical(other.usrNmRowspan, usrNmRowspan) ||
                other.usrNmRowspan == usrNmRowspan) &&
            (identical(other.tagTypeNm, tagTypeNm) ||
                other.tagTypeNm == tagTypeNm) &&
            (identical(other.mstKey, mstKey) || other.mstKey == mstKey) &&
            (identical(other.qtyRemain, qtyRemain) ||
                other.qtyRemain == qtyRemain) &&
            (identical(other.qtyUnitDetail, qtyUnitDetail) ||
                other.qtyUnitDetail == qtyUnitDetail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        checkBoxRowspan,
        tagTypeRowspan,
        grpKey,
        qtyUnitMaster,
        itemNm,
        selectedRowspan,
        prtDtRowspan,
        tagSeq,
        pjtNmRowspan,
        selected,
        const DeepCollectionEquality().hash(qtyUse),
        remarkRowspan,
        qtyUseRowspan,
        whCd,
        qtyRemainRowspan,
        otbNoRowspan,
        otbDtRowspan,
        tagNoRowspan,
        plant,
        qty,
        setQtyRowspan,
        prtDt,
        qtyUnitMasterRowspan,
        no,
        zoneNmRowspan,
        wht,
        tagId,
        pjtNm,
        whNm,
        qtyRowspan,
        expDt,
        remark,
        tagTypeNmRowspan,
        lotNo,
        usrNm,
        vendNmRowspan,
        noRowspan,
        tagType,
        dtlKey,
        vendNm,
        whNmRowspan,
        otbDt,
        locCd,
        tagNo,
        itemCd,
        otbNo,
        locCdRowspan,
        whtUnit,
        zoneNm,
        setQty,
        qrNo,
        usrNmRowspan,
        tagTypeNm,
        mstKey,
        qtyRemain,
        qtyUnitDetail
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailImplCopyWith<_$DetailImpl> get copyWith =>
      __$$DetailImplCopyWithImpl<_$DetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailImplToJson(
      this,
    );
  }
}

abstract class _Detail implements Detail {
  const factory _Detail(
      {final int checkBoxRowspan,
      final int tagTypeRowspan,
      final String grpKey,
      final String qtyUnitMaster,
      final String itemNm,
      final int selectedRowspan,
      final int prtDtRowspan,
      final int tagSeq,
      final int pjtNmRowspan,
      final bool selected,
      final dynamic qtyUse,
      final int remarkRowspan,
      final int qtyUseRowspan,
      final String whCd,
      final int qtyRemainRowspan,
      final int otbNoRowspan,
      final int otbDtRowspan,
      final int tagNoRowspan,
      final String plant,
      final int qty,
      final int setQtyRowspan,
      final String prtDt,
      final int qtyUnitMasterRowspan,
      final int no,
      final int zoneNmRowspan,
      final int wht,
      final int tagId,
      final String pjtNm,
      final String whNm,
      final int qtyRowspan,
      final String expDt,
      final String remark,
      final int tagTypeNmRowspan,
      final String lotNo,
      final String usrNm,
      final int vendNmRowspan,
      final int noRowspan,
      final String tagType,
      final String dtlKey,
      final String vendNm,
      final int whNmRowspan,
      final String otbDt,
      final String locCd,
      final String tagNo,
      final String itemCd,
      final String otbNo,
      final int locCdRowspan,
      final String whtUnit,
      final String zoneNm,
      final int setQty,
      final String qrNo,
      final int usrNmRowspan,
      final String tagTypeNm,
      final String mstKey,
      final String qtyRemain,
      final String qtyUnitDetail}) = _$DetailImpl;

  factory _Detail.fromJson(Map<String, dynamic> json) = _$DetailImpl.fromJson;

  @override
  int get checkBoxRowspan;
  @override
  int get tagTypeRowspan;
  @override
  String get grpKey;
  @override
  String get qtyUnitMaster;
  @override
  String get itemNm;
  @override
  int get selectedRowspan;
  @override
  int get prtDtRowspan;
  @override
  int get tagSeq;
  @override
  int get pjtNmRowspan;
  @override
  bool get selected;
  @override
  dynamic get qtyUse;
  @override
  int get remarkRowspan;
  @override
  int get qtyUseRowspan;
  @override
  String get whCd;
  @override
  int get qtyRemainRowspan;
  @override
  int get otbNoRowspan;
  @override
  int get otbDtRowspan;
  @override
  int get tagNoRowspan;
  @override
  String get plant;
  @override
  int get qty;
  @override
  int get setQtyRowspan;
  @override
  String get prtDt;
  @override
  int get qtyUnitMasterRowspan;
  @override
  int get no;
  @override
  int get zoneNmRowspan;
  @override
  int get wht;
  @override
  int get tagId;
  @override
  String get pjtNm;
  @override
  String get whNm;
  @override
  int get qtyRowspan;
  @override
  String get expDt;
  @override
  String get remark;
  @override
  int get tagTypeNmRowspan;
  @override
  String get lotNo;
  @override
  String get usrNm;
  @override
  int get vendNmRowspan;
  @override
  int get noRowspan;
  @override
  String get tagType;
  @override
  String get dtlKey;
  @override
  String get vendNm;
  @override
  int get whNmRowspan;
  @override
  String get otbDt;
  @override
  String get locCd;
  @override
  String get tagNo;
  @override
  String get itemCd;
  @override
  String get otbNo;
  @override
  int get locCdRowspan;
  @override
  String get whtUnit;
  @override
  String get zoneNm;
  @override
  int get setQty;
  @override
  String get qrNo;
  @override
  int get usrNmRowspan;
  @override
  String get tagTypeNm;
  @override
  String get mstKey;
  @override
  String get qtyRemain;
  @override
  String get qtyUnitDetail;
  @override
  @JsonKey(ignore: true)
  _$$DetailImplCopyWith<_$DetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}