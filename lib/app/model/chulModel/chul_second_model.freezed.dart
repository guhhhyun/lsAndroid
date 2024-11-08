// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chul_second_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChulSecondModel _$ChulSecondModelFromJson(Map<String, dynamic> json) {
  return _ChulSecondModel.fromJson(json);
}

/// @nodoc
mixin _$ChulSecondModel {
  Header? get header => throw _privateConstructorUsedError;
  String get resultCode => throw _privateConstructorUsedError;
  String get resultMessage => throw _privateConstructorUsedError;
  List<dynamic>? get body => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChulSecondModelCopyWith<ChulSecondModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChulSecondModelCopyWith<$Res> {
  factory $ChulSecondModelCopyWith(
          ChulSecondModel value, $Res Function(ChulSecondModel) then) =
      _$ChulSecondModelCopyWithImpl<$Res, ChulSecondModel>;
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
class _$ChulSecondModelCopyWithImpl<$Res, $Val extends ChulSecondModel>
    implements $ChulSecondModelCopyWith<$Res> {
  _$ChulSecondModelCopyWithImpl(this._value, this._then);

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
abstract class _$$ChulSecondModelImplCopyWith<$Res>
    implements $ChulSecondModelCopyWith<$Res> {
  factory _$$ChulSecondModelImplCopyWith(_$ChulSecondModelImpl value,
          $Res Function(_$ChulSecondModelImpl) then) =
      __$$ChulSecondModelImplCopyWithImpl<$Res>;
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
class __$$ChulSecondModelImplCopyWithImpl<$Res>
    extends _$ChulSecondModelCopyWithImpl<$Res, _$ChulSecondModelImpl>
    implements _$$ChulSecondModelImplCopyWith<$Res> {
  __$$ChulSecondModelImplCopyWithImpl(
      _$ChulSecondModelImpl _value, $Res Function(_$ChulSecondModelImpl) _then)
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
    return _then(_$ChulSecondModelImpl(
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
class _$ChulSecondModelImpl implements _ChulSecondModel {
  const _$ChulSecondModelImpl(
      {this.header,
      this.resultCode = '',
      this.resultMessage = '',
      final List<dynamic>? body,
      this.hasError = false})
      : _body = body;

  factory _$ChulSecondModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChulSecondModelImplFromJson(json);

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
    return 'ChulSecondModel(header: $header, resultCode: $resultCode, resultMessage: $resultMessage, body: $body, hasError: $hasError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChulSecondModelImpl &&
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
  _$$ChulSecondModelImplCopyWith<_$ChulSecondModelImpl> get copyWith =>
      __$$ChulSecondModelImplCopyWithImpl<_$ChulSecondModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChulSecondModelImplToJson(
      this,
    );
  }
}

abstract class _ChulSecondModel implements ChulSecondModel {
  const factory _ChulSecondModel(
      {final Header? header,
      final String resultCode,
      final String resultMessage,
      final List<dynamic>? body,
      final bool hasError}) = _$ChulSecondModelImpl;

  factory _ChulSecondModel.fromJson(Map<String, dynamic> json) =
      _$ChulSecondModelImpl.fromJson;

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
  _$$ChulSecondModelImplCopyWith<_$ChulSecondModelImpl> get copyWith =>
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
  String get otbYn => throw _privateConstructorUsedError;
  int get no => throw _privateConstructorUsedError;
  String get grpKey => throw _privateConstructorUsedError;
  bool get scan => throw _privateConstructorUsedError;
  String get pitmNm => throw _privateConstructorUsedError;
  dynamic get itemNm => throw _privateConstructorUsedError;
  int get selectedRowspan => throw _privateConstructorUsedError;
  int get otbYnRowspan => throw _privateConstructorUsedError;
  int get pitmCdRowspan => throw _privateConstructorUsedError;
  String get delOrdNo => throw _privateConstructorUsedError;
  String get wrkNo => throw _privateConstructorUsedError;
  int get wrkNoRowspan => throw _privateConstructorUsedError;
  int get ordSortRowspan => throw _privateConstructorUsedError;
  int get noRowspan => throw _privateConstructorUsedError;
  bool get checked => throw _privateConstructorUsedError;
  int get scanRowspan => throw _privateConstructorUsedError;
  String get wrkCfmYnNm => throw _privateConstructorUsedError;
  int get ordSort => throw _privateConstructorUsedError;
  bool get selected => throw _privateConstructorUsedError;
  int get delOrdSeq => throw _privateConstructorUsedError;
  String? get locCd => throw _privateConstructorUsedError;
  String get wrkCfmYn => throw _privateConstructorUsedError;
  int get checkedRowspan => throw _privateConstructorUsedError;
  int get boxNoRowspan => throw _privateConstructorUsedError;
  int get boxNmRowspan => throw _privateConstructorUsedError;
  int get pitmNmRowspan => throw _privateConstructorUsedError;
  String get tagNo => throw _privateConstructorUsedError;
  String get itemCd => throw _privateConstructorUsedError;
  int get wrkCfmYnNmRowspan => throw _privateConstructorUsedError;
  String get pitmCd => throw _privateConstructorUsedError;
  int get locCdRowspan => throw _privateConstructorUsedError;
  int get cbxQty => throw _privateConstructorUsedError;
  int get tagNoRowspan => throw _privateConstructorUsedError;
  dynamic get boxNm => throw _privateConstructorUsedError;
  String get boxNo => throw _privateConstructorUsedError;
  String get plant => throw _privateConstructorUsedError;
  String get mstKey => throw _privateConstructorUsedError;

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
      {String otbYn,
      int no,
      String grpKey,
      bool scan,
      String pitmNm,
      dynamic itemNm,
      int selectedRowspan,
      int otbYnRowspan,
      int pitmCdRowspan,
      String delOrdNo,
      String wrkNo,
      int wrkNoRowspan,
      int ordSortRowspan,
      int noRowspan,
      bool checked,
      int scanRowspan,
      String wrkCfmYnNm,
      int ordSort,
      bool selected,
      int delOrdSeq,
      String? locCd,
      String wrkCfmYn,
      int checkedRowspan,
      int boxNoRowspan,
      int boxNmRowspan,
      int pitmNmRowspan,
      String tagNo,
      String itemCd,
      int wrkCfmYnNmRowspan,
      String pitmCd,
      int locCdRowspan,
      int cbxQty,
      int tagNoRowspan,
      dynamic boxNm,
      String boxNo,
      String plant,
      String mstKey});
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
    Object? otbYn = null,
    Object? no = null,
    Object? grpKey = null,
    Object? scan = null,
    Object? pitmNm = null,
    Object? itemNm = freezed,
    Object? selectedRowspan = null,
    Object? otbYnRowspan = null,
    Object? pitmCdRowspan = null,
    Object? delOrdNo = null,
    Object? wrkNo = null,
    Object? wrkNoRowspan = null,
    Object? ordSortRowspan = null,
    Object? noRowspan = null,
    Object? checked = null,
    Object? scanRowspan = null,
    Object? wrkCfmYnNm = null,
    Object? ordSort = null,
    Object? selected = null,
    Object? delOrdSeq = null,
    Object? locCd = freezed,
    Object? wrkCfmYn = null,
    Object? checkedRowspan = null,
    Object? boxNoRowspan = null,
    Object? boxNmRowspan = null,
    Object? pitmNmRowspan = null,
    Object? tagNo = null,
    Object? itemCd = null,
    Object? wrkCfmYnNmRowspan = null,
    Object? pitmCd = null,
    Object? locCdRowspan = null,
    Object? cbxQty = null,
    Object? tagNoRowspan = null,
    Object? boxNm = freezed,
    Object? boxNo = null,
    Object? plant = null,
    Object? mstKey = null,
  }) {
    return _then(_value.copyWith(
      otbYn: null == otbYn
          ? _value.otbYn
          : otbYn // ignore: cast_nullable_to_non_nullable
              as String,
      no: null == no
          ? _value.no
          : no // ignore: cast_nullable_to_non_nullable
              as int,
      grpKey: null == grpKey
          ? _value.grpKey
          : grpKey // ignore: cast_nullable_to_non_nullable
              as String,
      scan: null == scan
          ? _value.scan
          : scan // ignore: cast_nullable_to_non_nullable
              as bool,
      pitmNm: null == pitmNm
          ? _value.pitmNm
          : pitmNm // ignore: cast_nullable_to_non_nullable
              as String,
      itemNm: freezed == itemNm
          ? _value.itemNm
          : itemNm // ignore: cast_nullable_to_non_nullable
              as dynamic,
      selectedRowspan: null == selectedRowspan
          ? _value.selectedRowspan
          : selectedRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      otbYnRowspan: null == otbYnRowspan
          ? _value.otbYnRowspan
          : otbYnRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      pitmCdRowspan: null == pitmCdRowspan
          ? _value.pitmCdRowspan
          : pitmCdRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      delOrdNo: null == delOrdNo
          ? _value.delOrdNo
          : delOrdNo // ignore: cast_nullable_to_non_nullable
              as String,
      wrkNo: null == wrkNo
          ? _value.wrkNo
          : wrkNo // ignore: cast_nullable_to_non_nullable
              as String,
      wrkNoRowspan: null == wrkNoRowspan
          ? _value.wrkNoRowspan
          : wrkNoRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      ordSortRowspan: null == ordSortRowspan
          ? _value.ordSortRowspan
          : ordSortRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      noRowspan: null == noRowspan
          ? _value.noRowspan
          : noRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      checked: null == checked
          ? _value.checked
          : checked // ignore: cast_nullable_to_non_nullable
              as bool,
      scanRowspan: null == scanRowspan
          ? _value.scanRowspan
          : scanRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      wrkCfmYnNm: null == wrkCfmYnNm
          ? _value.wrkCfmYnNm
          : wrkCfmYnNm // ignore: cast_nullable_to_non_nullable
              as String,
      ordSort: null == ordSort
          ? _value.ordSort
          : ordSort // ignore: cast_nullable_to_non_nullable
              as int,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
      delOrdSeq: null == delOrdSeq
          ? _value.delOrdSeq
          : delOrdSeq // ignore: cast_nullable_to_non_nullable
              as int,
      locCd: freezed == locCd
          ? _value.locCd
          : locCd // ignore: cast_nullable_to_non_nullable
              as String?,
      wrkCfmYn: null == wrkCfmYn
          ? _value.wrkCfmYn
          : wrkCfmYn // ignore: cast_nullable_to_non_nullable
              as String,
      checkedRowspan: null == checkedRowspan
          ? _value.checkedRowspan
          : checkedRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      boxNoRowspan: null == boxNoRowspan
          ? _value.boxNoRowspan
          : boxNoRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      boxNmRowspan: null == boxNmRowspan
          ? _value.boxNmRowspan
          : boxNmRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      pitmNmRowspan: null == pitmNmRowspan
          ? _value.pitmNmRowspan
          : pitmNmRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      tagNo: null == tagNo
          ? _value.tagNo
          : tagNo // ignore: cast_nullable_to_non_nullable
              as String,
      itemCd: null == itemCd
          ? _value.itemCd
          : itemCd // ignore: cast_nullable_to_non_nullable
              as String,
      wrkCfmYnNmRowspan: null == wrkCfmYnNmRowspan
          ? _value.wrkCfmYnNmRowspan
          : wrkCfmYnNmRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      pitmCd: null == pitmCd
          ? _value.pitmCd
          : pitmCd // ignore: cast_nullable_to_non_nullable
              as String,
      locCdRowspan: null == locCdRowspan
          ? _value.locCdRowspan
          : locCdRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      cbxQty: null == cbxQty
          ? _value.cbxQty
          : cbxQty // ignore: cast_nullable_to_non_nullable
              as int,
      tagNoRowspan: null == tagNoRowspan
          ? _value.tagNoRowspan
          : tagNoRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      boxNm: freezed == boxNm
          ? _value.boxNm
          : boxNm // ignore: cast_nullable_to_non_nullable
              as dynamic,
      boxNo: null == boxNo
          ? _value.boxNo
          : boxNo // ignore: cast_nullable_to_non_nullable
              as String,
      plant: null == plant
          ? _value.plant
          : plant // ignore: cast_nullable_to_non_nullable
              as String,
      mstKey: null == mstKey
          ? _value.mstKey
          : mstKey // ignore: cast_nullable_to_non_nullable
              as String,
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
      {String otbYn,
      int no,
      String grpKey,
      bool scan,
      String pitmNm,
      dynamic itemNm,
      int selectedRowspan,
      int otbYnRowspan,
      int pitmCdRowspan,
      String delOrdNo,
      String wrkNo,
      int wrkNoRowspan,
      int ordSortRowspan,
      int noRowspan,
      bool checked,
      int scanRowspan,
      String wrkCfmYnNm,
      int ordSort,
      bool selected,
      int delOrdSeq,
      String? locCd,
      String wrkCfmYn,
      int checkedRowspan,
      int boxNoRowspan,
      int boxNmRowspan,
      int pitmNmRowspan,
      String tagNo,
      String itemCd,
      int wrkCfmYnNmRowspan,
      String pitmCd,
      int locCdRowspan,
      int cbxQty,
      int tagNoRowspan,
      dynamic boxNm,
      String boxNo,
      String plant,
      String mstKey});
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
    Object? otbYn = null,
    Object? no = null,
    Object? grpKey = null,
    Object? scan = null,
    Object? pitmNm = null,
    Object? itemNm = freezed,
    Object? selectedRowspan = null,
    Object? otbYnRowspan = null,
    Object? pitmCdRowspan = null,
    Object? delOrdNo = null,
    Object? wrkNo = null,
    Object? wrkNoRowspan = null,
    Object? ordSortRowspan = null,
    Object? noRowspan = null,
    Object? checked = null,
    Object? scanRowspan = null,
    Object? wrkCfmYnNm = null,
    Object? ordSort = null,
    Object? selected = null,
    Object? delOrdSeq = null,
    Object? locCd = freezed,
    Object? wrkCfmYn = null,
    Object? checkedRowspan = null,
    Object? boxNoRowspan = null,
    Object? boxNmRowspan = null,
    Object? pitmNmRowspan = null,
    Object? tagNo = null,
    Object? itemCd = null,
    Object? wrkCfmYnNmRowspan = null,
    Object? pitmCd = null,
    Object? locCdRowspan = null,
    Object? cbxQty = null,
    Object? tagNoRowspan = null,
    Object? boxNm = freezed,
    Object? boxNo = null,
    Object? plant = null,
    Object? mstKey = null,
  }) {
    return _then(_$DetailItemImpl(
      otbYn: null == otbYn
          ? _value.otbYn
          : otbYn // ignore: cast_nullable_to_non_nullable
              as String,
      no: null == no
          ? _value.no
          : no // ignore: cast_nullable_to_non_nullable
              as int,
      grpKey: null == grpKey
          ? _value.grpKey
          : grpKey // ignore: cast_nullable_to_non_nullable
              as String,
      scan: null == scan
          ? _value.scan
          : scan // ignore: cast_nullable_to_non_nullable
              as bool,
      pitmNm: null == pitmNm
          ? _value.pitmNm
          : pitmNm // ignore: cast_nullable_to_non_nullable
              as String,
      itemNm: freezed == itemNm ? _value.itemNm! : itemNm,
      selectedRowspan: null == selectedRowspan
          ? _value.selectedRowspan
          : selectedRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      otbYnRowspan: null == otbYnRowspan
          ? _value.otbYnRowspan
          : otbYnRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      pitmCdRowspan: null == pitmCdRowspan
          ? _value.pitmCdRowspan
          : pitmCdRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      delOrdNo: null == delOrdNo
          ? _value.delOrdNo
          : delOrdNo // ignore: cast_nullable_to_non_nullable
              as String,
      wrkNo: null == wrkNo
          ? _value.wrkNo
          : wrkNo // ignore: cast_nullable_to_non_nullable
              as String,
      wrkNoRowspan: null == wrkNoRowspan
          ? _value.wrkNoRowspan
          : wrkNoRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      ordSortRowspan: null == ordSortRowspan
          ? _value.ordSortRowspan
          : ordSortRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      noRowspan: null == noRowspan
          ? _value.noRowspan
          : noRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      checked: null == checked
          ? _value.checked
          : checked // ignore: cast_nullable_to_non_nullable
              as bool,
      scanRowspan: null == scanRowspan
          ? _value.scanRowspan
          : scanRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      wrkCfmYnNm: null == wrkCfmYnNm
          ? _value.wrkCfmYnNm
          : wrkCfmYnNm // ignore: cast_nullable_to_non_nullable
              as String,
      ordSort: null == ordSort
          ? _value.ordSort
          : ordSort // ignore: cast_nullable_to_non_nullable
              as int,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
      delOrdSeq: null == delOrdSeq
          ? _value.delOrdSeq
          : delOrdSeq // ignore: cast_nullable_to_non_nullable
              as int,
      locCd: freezed == locCd
          ? _value.locCd
          : locCd // ignore: cast_nullable_to_non_nullable
              as String?,
      wrkCfmYn: null == wrkCfmYn
          ? _value.wrkCfmYn
          : wrkCfmYn // ignore: cast_nullable_to_non_nullable
              as String,
      checkedRowspan: null == checkedRowspan
          ? _value.checkedRowspan
          : checkedRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      boxNoRowspan: null == boxNoRowspan
          ? _value.boxNoRowspan
          : boxNoRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      boxNmRowspan: null == boxNmRowspan
          ? _value.boxNmRowspan
          : boxNmRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      pitmNmRowspan: null == pitmNmRowspan
          ? _value.pitmNmRowspan
          : pitmNmRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      tagNo: null == tagNo
          ? _value.tagNo
          : tagNo // ignore: cast_nullable_to_non_nullable
              as String,
      itemCd: null == itemCd
          ? _value.itemCd
          : itemCd // ignore: cast_nullable_to_non_nullable
              as String,
      wrkCfmYnNmRowspan: null == wrkCfmYnNmRowspan
          ? _value.wrkCfmYnNmRowspan
          : wrkCfmYnNmRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      pitmCd: null == pitmCd
          ? _value.pitmCd
          : pitmCd // ignore: cast_nullable_to_non_nullable
              as String,
      locCdRowspan: null == locCdRowspan
          ? _value.locCdRowspan
          : locCdRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      cbxQty: null == cbxQty
          ? _value.cbxQty
          : cbxQty // ignore: cast_nullable_to_non_nullable
              as int,
      tagNoRowspan: null == tagNoRowspan
          ? _value.tagNoRowspan
          : tagNoRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      boxNm: freezed == boxNm ? _value.boxNm! : boxNm,
      boxNo: null == boxNo
          ? _value.boxNo
          : boxNo // ignore: cast_nullable_to_non_nullable
              as String,
      plant: null == plant
          ? _value.plant
          : plant // ignore: cast_nullable_to_non_nullable
              as String,
      mstKey: null == mstKey
          ? _value.mstKey
          : mstKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailItemImpl implements _DetailItem {
  const _$DetailItemImpl(
      {this.otbYn = '',
      this.no = 0,
      this.grpKey = '',
      this.scan = false,
      this.pitmNm = '',
      this.itemNm = '',
      this.selectedRowspan = 0,
      this.otbYnRowspan = 0,
      this.pitmCdRowspan = 0,
      this.delOrdNo = '',
      this.wrkNo = '',
      this.wrkNoRowspan = 0,
      this.ordSortRowspan = 0,
      this.noRowspan = 0,
      this.checked = false,
      this.scanRowspan = 0,
      this.wrkCfmYnNm = '',
      this.ordSort = 0,
      this.selected = false,
      this.delOrdSeq = 0,
      this.locCd,
      this.wrkCfmYn = '',
      this.checkedRowspan = 0,
      this.boxNoRowspan = 0,
      this.boxNmRowspan = 0,
      this.pitmNmRowspan = 0,
      this.tagNo = '',
      this.itemCd = '',
      this.wrkCfmYnNmRowspan = 0,
      this.pitmCd = '',
      this.locCdRowspan = 0,
      this.cbxQty = 0,
      this.tagNoRowspan = 0,
      this.boxNm = '',
      this.boxNo = '',
      this.plant = '',
      this.mstKey = ''});

  factory _$DetailItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailItemImplFromJson(json);

  @override
  @JsonKey()
  final String otbYn;
  @override
  @JsonKey()
  final int no;
  @override
  @JsonKey()
  final String grpKey;
  @override
  @JsonKey()
  final bool scan;
  @override
  @JsonKey()
  final String pitmNm;
  @override
  @JsonKey()
  final dynamic itemNm;
  @override
  @JsonKey()
  final int selectedRowspan;
  @override
  @JsonKey()
  final int otbYnRowspan;
  @override
  @JsonKey()
  final int pitmCdRowspan;
  @override
  @JsonKey()
  final String delOrdNo;
  @override
  @JsonKey()
  final String wrkNo;
  @override
  @JsonKey()
  final int wrkNoRowspan;
  @override
  @JsonKey()
  final int ordSortRowspan;
  @override
  @JsonKey()
  final int noRowspan;
  @override
  @JsonKey()
  final bool checked;
  @override
  @JsonKey()
  final int scanRowspan;
  @override
  @JsonKey()
  final String wrkCfmYnNm;
  @override
  @JsonKey()
  final int ordSort;
  @override
  @JsonKey()
  final bool selected;
  @override
  @JsonKey()
  final int delOrdSeq;
  @override
  final String? locCd;
  @override
  @JsonKey()
  final String wrkCfmYn;
  @override
  @JsonKey()
  final int checkedRowspan;
  @override
  @JsonKey()
  final int boxNoRowspan;
  @override
  @JsonKey()
  final int boxNmRowspan;
  @override
  @JsonKey()
  final int pitmNmRowspan;
  @override
  @JsonKey()
  final String tagNo;
  @override
  @JsonKey()
  final String itemCd;
  @override
  @JsonKey()
  final int wrkCfmYnNmRowspan;
  @override
  @JsonKey()
  final String pitmCd;
  @override
  @JsonKey()
  final int locCdRowspan;
  @override
  @JsonKey()
  final int cbxQty;
  @override
  @JsonKey()
  final int tagNoRowspan;
  @override
  @JsonKey()
  final dynamic boxNm;
  @override
  @JsonKey()
  final String boxNo;
  @override
  @JsonKey()
  final String plant;
  @override
  @JsonKey()
  final String mstKey;

  @override
  String toString() {
    return 'DetailItem(otbYn: $otbYn, no: $no, grpKey: $grpKey, scan: $scan, pitmNm: $pitmNm, itemNm: $itemNm, selectedRowspan: $selectedRowspan, otbYnRowspan: $otbYnRowspan, pitmCdRowspan: $pitmCdRowspan, delOrdNo: $delOrdNo, wrkNo: $wrkNo, wrkNoRowspan: $wrkNoRowspan, ordSortRowspan: $ordSortRowspan, noRowspan: $noRowspan, checked: $checked, scanRowspan: $scanRowspan, wrkCfmYnNm: $wrkCfmYnNm, ordSort: $ordSort, selected: $selected, delOrdSeq: $delOrdSeq, locCd: $locCd, wrkCfmYn: $wrkCfmYn, checkedRowspan: $checkedRowspan, boxNoRowspan: $boxNoRowspan, boxNmRowspan: $boxNmRowspan, pitmNmRowspan: $pitmNmRowspan, tagNo: $tagNo, itemCd: $itemCd, wrkCfmYnNmRowspan: $wrkCfmYnNmRowspan, pitmCd: $pitmCd, locCdRowspan: $locCdRowspan, cbxQty: $cbxQty, tagNoRowspan: $tagNoRowspan, boxNm: $boxNm, boxNo: $boxNo, plant: $plant, mstKey: $mstKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailItemImpl &&
            (identical(other.otbYn, otbYn) || other.otbYn == otbYn) &&
            (identical(other.no, no) || other.no == no) &&
            (identical(other.grpKey, grpKey) || other.grpKey == grpKey) &&
            (identical(other.scan, scan) || other.scan == scan) &&
            (identical(other.pitmNm, pitmNm) || other.pitmNm == pitmNm) &&
            const DeepCollectionEquality().equals(other.itemNm, itemNm) &&
            (identical(other.selectedRowspan, selectedRowspan) ||
                other.selectedRowspan == selectedRowspan) &&
            (identical(other.otbYnRowspan, otbYnRowspan) ||
                other.otbYnRowspan == otbYnRowspan) &&
            (identical(other.pitmCdRowspan, pitmCdRowspan) ||
                other.pitmCdRowspan == pitmCdRowspan) &&
            (identical(other.delOrdNo, delOrdNo) ||
                other.delOrdNo == delOrdNo) &&
            (identical(other.wrkNo, wrkNo) || other.wrkNo == wrkNo) &&
            (identical(other.wrkNoRowspan, wrkNoRowspan) ||
                other.wrkNoRowspan == wrkNoRowspan) &&
            (identical(other.ordSortRowspan, ordSortRowspan) ||
                other.ordSortRowspan == ordSortRowspan) &&
            (identical(other.noRowspan, noRowspan) ||
                other.noRowspan == noRowspan) &&
            (identical(other.checked, checked) || other.checked == checked) &&
            (identical(other.scanRowspan, scanRowspan) ||
                other.scanRowspan == scanRowspan) &&
            (identical(other.wrkCfmYnNm, wrkCfmYnNm) ||
                other.wrkCfmYnNm == wrkCfmYnNm) &&
            (identical(other.ordSort, ordSort) || other.ordSort == ordSort) &&
            (identical(other.selected, selected) ||
                other.selected == selected) &&
            (identical(other.delOrdSeq, delOrdSeq) ||
                other.delOrdSeq == delOrdSeq) &&
            (identical(other.locCd, locCd) || other.locCd == locCd) &&
            (identical(other.wrkCfmYn, wrkCfmYn) ||
                other.wrkCfmYn == wrkCfmYn) &&
            (identical(other.checkedRowspan, checkedRowspan) ||
                other.checkedRowspan == checkedRowspan) &&
            (identical(other.boxNoRowspan, boxNoRowspan) ||
                other.boxNoRowspan == boxNoRowspan) &&
            (identical(other.boxNmRowspan, boxNmRowspan) ||
                other.boxNmRowspan == boxNmRowspan) &&
            (identical(other.pitmNmRowspan, pitmNmRowspan) ||
                other.pitmNmRowspan == pitmNmRowspan) &&
            (identical(other.tagNo, tagNo) || other.tagNo == tagNo) &&
            (identical(other.itemCd, itemCd) || other.itemCd == itemCd) &&
            (identical(other.wrkCfmYnNmRowspan, wrkCfmYnNmRowspan) ||
                other.wrkCfmYnNmRowspan == wrkCfmYnNmRowspan) &&
            (identical(other.pitmCd, pitmCd) || other.pitmCd == pitmCd) &&
            (identical(other.locCdRowspan, locCdRowspan) ||
                other.locCdRowspan == locCdRowspan) &&
            (identical(other.cbxQty, cbxQty) || other.cbxQty == cbxQty) &&
            (identical(other.tagNoRowspan, tagNoRowspan) ||
                other.tagNoRowspan == tagNoRowspan) &&
            const DeepCollectionEquality().equals(other.boxNm, boxNm) &&
            (identical(other.boxNo, boxNo) || other.boxNo == boxNo) &&
            (identical(other.plant, plant) || other.plant == plant) &&
            (identical(other.mstKey, mstKey) || other.mstKey == mstKey));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        otbYn,
        no,
        grpKey,
        scan,
        pitmNm,
        const DeepCollectionEquality().hash(itemNm),
        selectedRowspan,
        otbYnRowspan,
        pitmCdRowspan,
        delOrdNo,
        wrkNo,
        wrkNoRowspan,
        ordSortRowspan,
        noRowspan,
        checked,
        scanRowspan,
        wrkCfmYnNm,
        ordSort,
        selected,
        delOrdSeq,
        locCd,
        wrkCfmYn,
        checkedRowspan,
        boxNoRowspan,
        boxNmRowspan,
        pitmNmRowspan,
        tagNo,
        itemCd,
        wrkCfmYnNmRowspan,
        pitmCd,
        locCdRowspan,
        cbxQty,
        tagNoRowspan,
        const DeepCollectionEquality().hash(boxNm),
        boxNo,
        plant,
        mstKey
      ]);

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
      {final String otbYn,
      final int no,
      final String grpKey,
      final bool scan,
      final String pitmNm,
      final dynamic itemNm,
      final int selectedRowspan,
      final int otbYnRowspan,
      final int pitmCdRowspan,
      final String delOrdNo,
      final String wrkNo,
      final int wrkNoRowspan,
      final int ordSortRowspan,
      final int noRowspan,
      final bool checked,
      final int scanRowspan,
      final String wrkCfmYnNm,
      final int ordSort,
      final bool selected,
      final int delOrdSeq,
      final String? locCd,
      final String wrkCfmYn,
      final int checkedRowspan,
      final int boxNoRowspan,
      final int boxNmRowspan,
      final int pitmNmRowspan,
      final String tagNo,
      final String itemCd,
      final int wrkCfmYnNmRowspan,
      final String pitmCd,
      final int locCdRowspan,
      final int cbxQty,
      final int tagNoRowspan,
      final dynamic boxNm,
      final String boxNo,
      final String plant,
      final String mstKey}) = _$DetailItemImpl;

  factory _DetailItem.fromJson(Map<String, dynamic> json) =
      _$DetailItemImpl.fromJson;

  @override
  String get otbYn;
  @override
  int get no;
  @override
  String get grpKey;
  @override
  bool get scan;
  @override
  String get pitmNm;
  @override
  dynamic get itemNm;
  @override
  int get selectedRowspan;
  @override
  int get otbYnRowspan;
  @override
  int get pitmCdRowspan;
  @override
  String get delOrdNo;
  @override
  String get wrkNo;
  @override
  int get wrkNoRowspan;
  @override
  int get ordSortRowspan;
  @override
  int get noRowspan;
  @override
  bool get checked;
  @override
  int get scanRowspan;
  @override
  String get wrkCfmYnNm;
  @override
  int get ordSort;
  @override
  bool get selected;
  @override
  int get delOrdSeq;
  @override
  String? get locCd;
  @override
  String get wrkCfmYn;
  @override
  int get checkedRowspan;
  @override
  int get boxNoRowspan;
  @override
  int get boxNmRowspan;
  @override
  int get pitmNmRowspan;
  @override
  String get tagNo;
  @override
  String get itemCd;
  @override
  int get wrkCfmYnNmRowspan;
  @override
  String get pitmCd;
  @override
  int get locCdRowspan;
  @override
  int get cbxQty;
  @override
  int get tagNoRowspan;
  @override
  dynamic get boxNm;
  @override
  String get boxNo;
  @override
  String get plant;
  @override
  String get mstKey;
  @override
  @JsonKey(ignore: true)
  _$$DetailItemImplCopyWith<_$DetailItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
