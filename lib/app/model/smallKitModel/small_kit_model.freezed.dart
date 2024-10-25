// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'small_kit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SmallKitModel _$SmallKitModelFromJson(Map<String, dynamic> json) {
  return _SmallKitModel.fromJson(json);
}

/// @nodoc
mixin _$SmallKitModel {
  Header? get header => throw _privateConstructorUsedError;
  String get resultCode => throw _privateConstructorUsedError;
  String get resultMessage => throw _privateConstructorUsedError;
  List<dynamic>? get body => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SmallKitModelCopyWith<SmallKitModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SmallKitModelCopyWith<$Res> {
  factory $SmallKitModelCopyWith(
          SmallKitModel value, $Res Function(SmallKitModel) then) =
      _$SmallKitModelCopyWithImpl<$Res, SmallKitModel>;
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
class _$SmallKitModelCopyWithImpl<$Res, $Val extends SmallKitModel>
    implements $SmallKitModelCopyWith<$Res> {
  _$SmallKitModelCopyWithImpl(this._value, this._then);

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
abstract class _$$SmallKitModelImplCopyWith<$Res>
    implements $SmallKitModelCopyWith<$Res> {
  factory _$$SmallKitModelImplCopyWith(
          _$SmallKitModelImpl value, $Res Function(_$SmallKitModelImpl) then) =
      __$$SmallKitModelImplCopyWithImpl<$Res>;
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
class __$$SmallKitModelImplCopyWithImpl<$Res>
    extends _$SmallKitModelCopyWithImpl<$Res, _$SmallKitModelImpl>
    implements _$$SmallKitModelImplCopyWith<$Res> {
  __$$SmallKitModelImplCopyWithImpl(
      _$SmallKitModelImpl _value, $Res Function(_$SmallKitModelImpl) _then)
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
    return _then(_$SmallKitModelImpl(
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
class _$SmallKitModelImpl implements _SmallKitModel {
  _$SmallKitModelImpl(
      {this.header,
      this.resultCode = '',
      this.resultMessage = '',
      final List<dynamic>? body,
      this.hasError = false})
      : _body = body;

  factory _$SmallKitModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SmallKitModelImplFromJson(json);

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
    return 'SmallKitModel(header: $header, resultCode: $resultCode, resultMessage: $resultMessage, body: $body, hasError: $hasError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SmallKitModelImpl &&
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
  _$$SmallKitModelImplCopyWith<_$SmallKitModelImpl> get copyWith =>
      __$$SmallKitModelImplCopyWithImpl<_$SmallKitModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SmallKitModelImplToJson(
      this,
    );
  }
}

abstract class _SmallKitModel implements SmallKitModel {
  factory _SmallKitModel(
      {final Header? header,
      final String resultCode,
      final String resultMessage,
      final List<dynamic>? body,
      final bool hasError}) = _$SmallKitModelImpl;

  factory _SmallKitModel.fromJson(Map<String, dynamic> json) =
      _$SmallKitModelImpl.fromJson;

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
  _$$SmallKitModelImplCopyWith<_$SmallKitModelImpl> get copyWith =>
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
  String get scanNo => throw _privateConstructorUsedError;
  String get scanSeq => throw _privateConstructorUsedError;
  String get syncYn => throw _privateConstructorUsedError;
  String get remark => throw _privateConstructorUsedError;
  String get pitmNm => throw _privateConstructorUsedError;
  String get cbxMaNo => throw _privateConstructorUsedError;
  String get itemNm => throw _privateConstructorUsedError;
  int get splitSeq => throw _privateConstructorUsedError;
  String get wrkRemark => throw _privateConstructorUsedError;
  String get pjtNm2 => throw _privateConstructorUsedError;
  String get wrkNo => throw _privateConstructorUsedError;
  int get splitNo => throw _privateConstructorUsedError;
  String get cbxSuNo => throw _privateConstructorUsedError;
  String get vendNm => throw _privateConstructorUsedError;
  String get cbxSuNm => throw _privateConstructorUsedError;
  int get cbxSuSeq => throw _privateConstructorUsedError;
  String get sboxSpec => throw _privateConstructorUsedError;
  String get wrkdTagNo => throw _privateConstructorUsedError;
  String get wrkCfmYn => throw _privateConstructorUsedError;
  double get setCbxQty => throw _privateConstructorUsedError;
  String get wrkCfmDttm => throw _privateConstructorUsedError;
  String get tagNo => throw _privateConstructorUsedError;
  String get itemCd => throw _privateConstructorUsedError;
  String get scanYn => throw _privateConstructorUsedError;
  String get pitmCd => throw _privateConstructorUsedError;
  String get wrkQty => throw _privateConstructorUsedError;
  int get cbxQty => throw _privateConstructorUsedError;
  int get setQty => throw _privateConstructorUsedError;
  String get wrkQtySync => throw _privateConstructorUsedError;
  String get vendCd => throw _privateConstructorUsedError;
  String get qtyUnit => throw _privateConstructorUsedError;
  String get wrkTagNo => throw _privateConstructorUsedError;
  String get wksNo => throw _privateConstructorUsedError;
  String get ncbxRmk => throw _privateConstructorUsedError;

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
      {String scanNo,
      String scanSeq,
      String syncYn,
      String remark,
      String pitmNm,
      String cbxMaNo,
      String itemNm,
      int splitSeq,
      String wrkRemark,
      String pjtNm2,
      String wrkNo,
      int splitNo,
      String cbxSuNo,
      String vendNm,
      String cbxSuNm,
      int cbxSuSeq,
      String sboxSpec,
      String wrkdTagNo,
      String wrkCfmYn,
      double setCbxQty,
      String wrkCfmDttm,
      String tagNo,
      String itemCd,
      String scanYn,
      String pitmCd,
      String wrkQty,
      int cbxQty,
      int setQty,
      String wrkQtySync,
      String vendCd,
      String qtyUnit,
      String wrkTagNo,
      String wksNo,
      String ncbxRmk});
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
    Object? scanNo = null,
    Object? scanSeq = null,
    Object? syncYn = null,
    Object? remark = null,
    Object? pitmNm = null,
    Object? cbxMaNo = null,
    Object? itemNm = null,
    Object? splitSeq = null,
    Object? wrkRemark = null,
    Object? pjtNm2 = null,
    Object? wrkNo = null,
    Object? splitNo = null,
    Object? cbxSuNo = null,
    Object? vendNm = null,
    Object? cbxSuNm = null,
    Object? cbxSuSeq = null,
    Object? sboxSpec = null,
    Object? wrkdTagNo = null,
    Object? wrkCfmYn = null,
    Object? setCbxQty = null,
    Object? wrkCfmDttm = null,
    Object? tagNo = null,
    Object? itemCd = null,
    Object? scanYn = null,
    Object? pitmCd = null,
    Object? wrkQty = null,
    Object? cbxQty = null,
    Object? setQty = null,
    Object? wrkQtySync = null,
    Object? vendCd = null,
    Object? qtyUnit = null,
    Object? wrkTagNo = null,
    Object? wksNo = null,
    Object? ncbxRmk = null,
  }) {
    return _then(_value.copyWith(
      scanNo: null == scanNo
          ? _value.scanNo
          : scanNo // ignore: cast_nullable_to_non_nullable
              as String,
      scanSeq: null == scanSeq
          ? _value.scanSeq
          : scanSeq // ignore: cast_nullable_to_non_nullable
              as String,
      syncYn: null == syncYn
          ? _value.syncYn
          : syncYn // ignore: cast_nullable_to_non_nullable
              as String,
      remark: null == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
      pitmNm: null == pitmNm
          ? _value.pitmNm
          : pitmNm // ignore: cast_nullable_to_non_nullable
              as String,
      cbxMaNo: null == cbxMaNo
          ? _value.cbxMaNo
          : cbxMaNo // ignore: cast_nullable_to_non_nullable
              as String,
      itemNm: null == itemNm
          ? _value.itemNm
          : itemNm // ignore: cast_nullable_to_non_nullable
              as String,
      splitSeq: null == splitSeq
          ? _value.splitSeq
          : splitSeq // ignore: cast_nullable_to_non_nullable
              as int,
      wrkRemark: null == wrkRemark
          ? _value.wrkRemark
          : wrkRemark // ignore: cast_nullable_to_non_nullable
              as String,
      pjtNm2: null == pjtNm2
          ? _value.pjtNm2
          : pjtNm2 // ignore: cast_nullable_to_non_nullable
              as String,
      wrkNo: null == wrkNo
          ? _value.wrkNo
          : wrkNo // ignore: cast_nullable_to_non_nullable
              as String,
      splitNo: null == splitNo
          ? _value.splitNo
          : splitNo // ignore: cast_nullable_to_non_nullable
              as int,
      cbxSuNo: null == cbxSuNo
          ? _value.cbxSuNo
          : cbxSuNo // ignore: cast_nullable_to_non_nullable
              as String,
      vendNm: null == vendNm
          ? _value.vendNm
          : vendNm // ignore: cast_nullable_to_non_nullable
              as String,
      cbxSuNm: null == cbxSuNm
          ? _value.cbxSuNm
          : cbxSuNm // ignore: cast_nullable_to_non_nullable
              as String,
      cbxSuSeq: null == cbxSuSeq
          ? _value.cbxSuSeq
          : cbxSuSeq // ignore: cast_nullable_to_non_nullable
              as int,
      sboxSpec: null == sboxSpec
          ? _value.sboxSpec
          : sboxSpec // ignore: cast_nullable_to_non_nullable
              as String,
      wrkdTagNo: null == wrkdTagNo
          ? _value.wrkdTagNo
          : wrkdTagNo // ignore: cast_nullable_to_non_nullable
              as String,
      wrkCfmYn: null == wrkCfmYn
          ? _value.wrkCfmYn
          : wrkCfmYn // ignore: cast_nullable_to_non_nullable
              as String,
      setCbxQty: null == setCbxQty
          ? _value.setCbxQty
          : setCbxQty // ignore: cast_nullable_to_non_nullable
              as double,
      wrkCfmDttm: null == wrkCfmDttm
          ? _value.wrkCfmDttm
          : wrkCfmDttm // ignore: cast_nullable_to_non_nullable
              as String,
      tagNo: null == tagNo
          ? _value.tagNo
          : tagNo // ignore: cast_nullable_to_non_nullable
              as String,
      itemCd: null == itemCd
          ? _value.itemCd
          : itemCd // ignore: cast_nullable_to_non_nullable
              as String,
      scanYn: null == scanYn
          ? _value.scanYn
          : scanYn // ignore: cast_nullable_to_non_nullable
              as String,
      pitmCd: null == pitmCd
          ? _value.pitmCd
          : pitmCd // ignore: cast_nullable_to_non_nullable
              as String,
      wrkQty: null == wrkQty
          ? _value.wrkQty
          : wrkQty // ignore: cast_nullable_to_non_nullable
              as String,
      cbxQty: null == cbxQty
          ? _value.cbxQty
          : cbxQty // ignore: cast_nullable_to_non_nullable
              as int,
      setQty: null == setQty
          ? _value.setQty
          : setQty // ignore: cast_nullable_to_non_nullable
              as int,
      wrkQtySync: null == wrkQtySync
          ? _value.wrkQtySync
          : wrkQtySync // ignore: cast_nullable_to_non_nullable
              as String,
      vendCd: null == vendCd
          ? _value.vendCd
          : vendCd // ignore: cast_nullable_to_non_nullable
              as String,
      qtyUnit: null == qtyUnit
          ? _value.qtyUnit
          : qtyUnit // ignore: cast_nullable_to_non_nullable
              as String,
      wrkTagNo: null == wrkTagNo
          ? _value.wrkTagNo
          : wrkTagNo // ignore: cast_nullable_to_non_nullable
              as String,
      wksNo: null == wksNo
          ? _value.wksNo
          : wksNo // ignore: cast_nullable_to_non_nullable
              as String,
      ncbxRmk: null == ncbxRmk
          ? _value.ncbxRmk
          : ncbxRmk // ignore: cast_nullable_to_non_nullable
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
      {String scanNo,
      String scanSeq,
      String syncYn,
      String remark,
      String pitmNm,
      String cbxMaNo,
      String itemNm,
      int splitSeq,
      String wrkRemark,
      String pjtNm2,
      String wrkNo,
      int splitNo,
      String cbxSuNo,
      String vendNm,
      String cbxSuNm,
      int cbxSuSeq,
      String sboxSpec,
      String wrkdTagNo,
      String wrkCfmYn,
      double setCbxQty,
      String wrkCfmDttm,
      String tagNo,
      String itemCd,
      String scanYn,
      String pitmCd,
      String wrkQty,
      int cbxQty,
      int setQty,
      String wrkQtySync,
      String vendCd,
      String qtyUnit,
      String wrkTagNo,
      String wksNo,
      String ncbxRmk});
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
    Object? scanNo = null,
    Object? scanSeq = null,
    Object? syncYn = null,
    Object? remark = null,
    Object? pitmNm = null,
    Object? cbxMaNo = null,
    Object? itemNm = null,
    Object? splitSeq = null,
    Object? wrkRemark = null,
    Object? pjtNm2 = null,
    Object? wrkNo = null,
    Object? splitNo = null,
    Object? cbxSuNo = null,
    Object? vendNm = null,
    Object? cbxSuNm = null,
    Object? cbxSuSeq = null,
    Object? sboxSpec = null,
    Object? wrkdTagNo = null,
    Object? wrkCfmYn = null,
    Object? setCbxQty = null,
    Object? wrkCfmDttm = null,
    Object? tagNo = null,
    Object? itemCd = null,
    Object? scanYn = null,
    Object? pitmCd = null,
    Object? wrkQty = null,
    Object? cbxQty = null,
    Object? setQty = null,
    Object? wrkQtySync = null,
    Object? vendCd = null,
    Object? qtyUnit = null,
    Object? wrkTagNo = null,
    Object? wksNo = null,
    Object? ncbxRmk = null,
  }) {
    return _then(_$InnerBodyItemImpl(
      scanNo: null == scanNo
          ? _value.scanNo
          : scanNo // ignore: cast_nullable_to_non_nullable
              as String,
      scanSeq: null == scanSeq
          ? _value.scanSeq
          : scanSeq // ignore: cast_nullable_to_non_nullable
              as String,
      syncYn: null == syncYn
          ? _value.syncYn
          : syncYn // ignore: cast_nullable_to_non_nullable
              as String,
      remark: null == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
      pitmNm: null == pitmNm
          ? _value.pitmNm
          : pitmNm // ignore: cast_nullable_to_non_nullable
              as String,
      cbxMaNo: null == cbxMaNo
          ? _value.cbxMaNo
          : cbxMaNo // ignore: cast_nullable_to_non_nullable
              as String,
      itemNm: null == itemNm
          ? _value.itemNm
          : itemNm // ignore: cast_nullable_to_non_nullable
              as String,
      splitSeq: null == splitSeq
          ? _value.splitSeq
          : splitSeq // ignore: cast_nullable_to_non_nullable
              as int,
      wrkRemark: null == wrkRemark
          ? _value.wrkRemark
          : wrkRemark // ignore: cast_nullable_to_non_nullable
              as String,
      pjtNm2: null == pjtNm2
          ? _value.pjtNm2
          : pjtNm2 // ignore: cast_nullable_to_non_nullable
              as String,
      wrkNo: null == wrkNo
          ? _value.wrkNo
          : wrkNo // ignore: cast_nullable_to_non_nullable
              as String,
      splitNo: null == splitNo
          ? _value.splitNo
          : splitNo // ignore: cast_nullable_to_non_nullable
              as int,
      cbxSuNo: null == cbxSuNo
          ? _value.cbxSuNo
          : cbxSuNo // ignore: cast_nullable_to_non_nullable
              as String,
      vendNm: null == vendNm
          ? _value.vendNm
          : vendNm // ignore: cast_nullable_to_non_nullable
              as String,
      cbxSuNm: null == cbxSuNm
          ? _value.cbxSuNm
          : cbxSuNm // ignore: cast_nullable_to_non_nullable
              as String,
      cbxSuSeq: null == cbxSuSeq
          ? _value.cbxSuSeq
          : cbxSuSeq // ignore: cast_nullable_to_non_nullable
              as int,
      sboxSpec: null == sboxSpec
          ? _value.sboxSpec
          : sboxSpec // ignore: cast_nullable_to_non_nullable
              as String,
      wrkdTagNo: null == wrkdTagNo
          ? _value.wrkdTagNo
          : wrkdTagNo // ignore: cast_nullable_to_non_nullable
              as String,
      wrkCfmYn: null == wrkCfmYn
          ? _value.wrkCfmYn
          : wrkCfmYn // ignore: cast_nullable_to_non_nullable
              as String,
      setCbxQty: null == setCbxQty
          ? _value.setCbxQty
          : setCbxQty // ignore: cast_nullable_to_non_nullable
              as double,
      wrkCfmDttm: null == wrkCfmDttm
          ? _value.wrkCfmDttm
          : wrkCfmDttm // ignore: cast_nullable_to_non_nullable
              as String,
      tagNo: null == tagNo
          ? _value.tagNo
          : tagNo // ignore: cast_nullable_to_non_nullable
              as String,
      itemCd: null == itemCd
          ? _value.itemCd
          : itemCd // ignore: cast_nullable_to_non_nullable
              as String,
      scanYn: null == scanYn
          ? _value.scanYn
          : scanYn // ignore: cast_nullable_to_non_nullable
              as String,
      pitmCd: null == pitmCd
          ? _value.pitmCd
          : pitmCd // ignore: cast_nullable_to_non_nullable
              as String,
      wrkQty: null == wrkQty
          ? _value.wrkQty
          : wrkQty // ignore: cast_nullable_to_non_nullable
              as String,
      cbxQty: null == cbxQty
          ? _value.cbxQty
          : cbxQty // ignore: cast_nullable_to_non_nullable
              as int,
      setQty: null == setQty
          ? _value.setQty
          : setQty // ignore: cast_nullable_to_non_nullable
              as int,
      wrkQtySync: null == wrkQtySync
          ? _value.wrkQtySync
          : wrkQtySync // ignore: cast_nullable_to_non_nullable
              as String,
      vendCd: null == vendCd
          ? _value.vendCd
          : vendCd // ignore: cast_nullable_to_non_nullable
              as String,
      qtyUnit: null == qtyUnit
          ? _value.qtyUnit
          : qtyUnit // ignore: cast_nullable_to_non_nullable
              as String,
      wrkTagNo: null == wrkTagNo
          ? _value.wrkTagNo
          : wrkTagNo // ignore: cast_nullable_to_non_nullable
              as String,
      wksNo: null == wksNo
          ? _value.wksNo
          : wksNo // ignore: cast_nullable_to_non_nullable
              as String,
      ncbxRmk: null == ncbxRmk
          ? _value.ncbxRmk
          : ncbxRmk // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InnerBodyItemImpl implements _InnerBodyItem {
  _$InnerBodyItemImpl(
      {this.scanNo = '',
      this.scanSeq = '',
      this.syncYn = '',
      this.remark = '',
      this.pitmNm = '',
      this.cbxMaNo = '',
      this.itemNm = '',
      this.splitSeq = 0,
      this.wrkRemark = '',
      this.pjtNm2 = '',
      this.wrkNo = '',
      this.splitNo = 0,
      this.cbxSuNo = '',
      this.vendNm = '',
      this.cbxSuNm = '',
      this.cbxSuSeq = 0,
      this.sboxSpec = '',
      this.wrkdTagNo = '',
      this.wrkCfmYn = '',
      this.setCbxQty = 0.0,
      this.wrkCfmDttm = '',
      this.tagNo = '',
      this.itemCd = '',
      this.scanYn = '',
      this.pitmCd = '',
      this.wrkQty = '',
      this.cbxQty = 0,
      this.setQty = 0,
      this.wrkQtySync = '',
      this.vendCd = '',
      this.qtyUnit = '',
      this.wrkTagNo = '',
      this.wksNo = '',
      this.ncbxRmk = ''});

  factory _$InnerBodyItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$InnerBodyItemImplFromJson(json);

  @override
  @JsonKey()
  final String scanNo;
  @override
  @JsonKey()
  final String scanSeq;
  @override
  @JsonKey()
  final String syncYn;
  @override
  @JsonKey()
  final String remark;
  @override
  @JsonKey()
  final String pitmNm;
  @override
  @JsonKey()
  final String cbxMaNo;
  @override
  @JsonKey()
  final String itemNm;
  @override
  @JsonKey()
  final int splitSeq;
  @override
  @JsonKey()
  final String wrkRemark;
  @override
  @JsonKey()
  final String pjtNm2;
  @override
  @JsonKey()
  final String wrkNo;
  @override
  @JsonKey()
  final int splitNo;
  @override
  @JsonKey()
  final String cbxSuNo;
  @override
  @JsonKey()
  final String vendNm;
  @override
  @JsonKey()
  final String cbxSuNm;
  @override
  @JsonKey()
  final int cbxSuSeq;
  @override
  @JsonKey()
  final String sboxSpec;
  @override
  @JsonKey()
  final String wrkdTagNo;
  @override
  @JsonKey()
  final String wrkCfmYn;
  @override
  @JsonKey()
  final double setCbxQty;
  @override
  @JsonKey()
  final String wrkCfmDttm;
  @override
  @JsonKey()
  final String tagNo;
  @override
  @JsonKey()
  final String itemCd;
  @override
  @JsonKey()
  final String scanYn;
  @override
  @JsonKey()
  final String pitmCd;
  @override
  @JsonKey()
  final String wrkQty;
  @override
  @JsonKey()
  final int cbxQty;
  @override
  @JsonKey()
  final int setQty;
  @override
  @JsonKey()
  final String wrkQtySync;
  @override
  @JsonKey()
  final String vendCd;
  @override
  @JsonKey()
  final String qtyUnit;
  @override
  @JsonKey()
  final String wrkTagNo;
  @override
  @JsonKey()
  final String wksNo;
  @override
  @JsonKey()
  final String ncbxRmk;

  @override
  String toString() {
    return 'InnerBodyItem(scanNo: $scanNo, scanSeq: $scanSeq, syncYn: $syncYn, remark: $remark, pitmNm: $pitmNm, cbxMaNo: $cbxMaNo, itemNm: $itemNm, splitSeq: $splitSeq, wrkRemark: $wrkRemark, pjtNm2: $pjtNm2, wrkNo: $wrkNo, splitNo: $splitNo, cbxSuNo: $cbxSuNo, vendNm: $vendNm, cbxSuNm: $cbxSuNm, cbxSuSeq: $cbxSuSeq, sboxSpec: $sboxSpec, wrkdTagNo: $wrkdTagNo, wrkCfmYn: $wrkCfmYn, setCbxQty: $setCbxQty, wrkCfmDttm: $wrkCfmDttm, tagNo: $tagNo, itemCd: $itemCd, scanYn: $scanYn, pitmCd: $pitmCd, wrkQty: $wrkQty, cbxQty: $cbxQty, setQty: $setQty, wrkQtySync: $wrkQtySync, vendCd: $vendCd, qtyUnit: $qtyUnit, wrkTagNo: $wrkTagNo, wksNo: $wksNo, ncbxRmk: $ncbxRmk)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InnerBodyItemImpl &&
            (identical(other.scanNo, scanNo) || other.scanNo == scanNo) &&
            (identical(other.scanSeq, scanSeq) || other.scanSeq == scanSeq) &&
            (identical(other.syncYn, syncYn) || other.syncYn == syncYn) &&
            (identical(other.remark, remark) || other.remark == remark) &&
            (identical(other.pitmNm, pitmNm) || other.pitmNm == pitmNm) &&
            (identical(other.cbxMaNo, cbxMaNo) || other.cbxMaNo == cbxMaNo) &&
            (identical(other.itemNm, itemNm) || other.itemNm == itemNm) &&
            (identical(other.splitSeq, splitSeq) ||
                other.splitSeq == splitSeq) &&
            (identical(other.wrkRemark, wrkRemark) ||
                other.wrkRemark == wrkRemark) &&
            (identical(other.pjtNm2, pjtNm2) || other.pjtNm2 == pjtNm2) &&
            (identical(other.wrkNo, wrkNo) || other.wrkNo == wrkNo) &&
            (identical(other.splitNo, splitNo) || other.splitNo == splitNo) &&
            (identical(other.cbxSuNo, cbxSuNo) || other.cbxSuNo == cbxSuNo) &&
            (identical(other.vendNm, vendNm) || other.vendNm == vendNm) &&
            (identical(other.cbxSuNm, cbxSuNm) || other.cbxSuNm == cbxSuNm) &&
            (identical(other.cbxSuSeq, cbxSuSeq) ||
                other.cbxSuSeq == cbxSuSeq) &&
            (identical(other.sboxSpec, sboxSpec) ||
                other.sboxSpec == sboxSpec) &&
            (identical(other.wrkdTagNo, wrkdTagNo) ||
                other.wrkdTagNo == wrkdTagNo) &&
            (identical(other.wrkCfmYn, wrkCfmYn) ||
                other.wrkCfmYn == wrkCfmYn) &&
            (identical(other.setCbxQty, setCbxQty) ||
                other.setCbxQty == setCbxQty) &&
            (identical(other.wrkCfmDttm, wrkCfmDttm) ||
                other.wrkCfmDttm == wrkCfmDttm) &&
            (identical(other.tagNo, tagNo) || other.tagNo == tagNo) &&
            (identical(other.itemCd, itemCd) || other.itemCd == itemCd) &&
            (identical(other.scanYn, scanYn) || other.scanYn == scanYn) &&
            (identical(other.pitmCd, pitmCd) || other.pitmCd == pitmCd) &&
            (identical(other.wrkQty, wrkQty) || other.wrkQty == wrkQty) &&
            (identical(other.cbxQty, cbxQty) || other.cbxQty == cbxQty) &&
            (identical(other.setQty, setQty) || other.setQty == setQty) &&
            (identical(other.wrkQtySync, wrkQtySync) ||
                other.wrkQtySync == wrkQtySync) &&
            (identical(other.vendCd, vendCd) || other.vendCd == vendCd) &&
            (identical(other.qtyUnit, qtyUnit) || other.qtyUnit == qtyUnit) &&
            (identical(other.wrkTagNo, wrkTagNo) ||
                other.wrkTagNo == wrkTagNo) &&
            (identical(other.wksNo, wksNo) || other.wksNo == wksNo) &&
            (identical(other.ncbxRmk, ncbxRmk) || other.ncbxRmk == ncbxRmk));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        scanNo,
        scanSeq,
        syncYn,
        remark,
        pitmNm,
        cbxMaNo,
        itemNm,
        splitSeq,
        wrkRemark,
        pjtNm2,
        wrkNo,
        splitNo,
        cbxSuNo,
        vendNm,
        cbxSuNm,
        cbxSuSeq,
        sboxSpec,
        wrkdTagNo,
        wrkCfmYn,
        setCbxQty,
        wrkCfmDttm,
        tagNo,
        itemCd,
        scanYn,
        pitmCd,
        wrkQty,
        cbxQty,
        setQty,
        wrkQtySync,
        vendCd,
        qtyUnit,
        wrkTagNo,
        wksNo,
        ncbxRmk
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
      {final String scanNo,
      final String scanSeq,
      final String syncYn,
      final String remark,
      final String pitmNm,
      final String cbxMaNo,
      final String itemNm,
      final int splitSeq,
      final String wrkRemark,
      final String pjtNm2,
      final String wrkNo,
      final int splitNo,
      final String cbxSuNo,
      final String vendNm,
      final String cbxSuNm,
      final int cbxSuSeq,
      final String sboxSpec,
      final String wrkdTagNo,
      final String wrkCfmYn,
      final double setCbxQty,
      final String wrkCfmDttm,
      final String tagNo,
      final String itemCd,
      final String scanYn,
      final String pitmCd,
      final String wrkQty,
      final int cbxQty,
      final int setQty,
      final String wrkQtySync,
      final String vendCd,
      final String qtyUnit,
      final String wrkTagNo,
      final String wksNo,
      final String ncbxRmk}) = _$InnerBodyItemImpl;

  factory _InnerBodyItem.fromJson(Map<String, dynamic> json) =
      _$InnerBodyItemImpl.fromJson;

  @override
  String get scanNo;
  @override
  String get scanSeq;
  @override
  String get syncYn;
  @override
  String get remark;
  @override
  String get pitmNm;
  @override
  String get cbxMaNo;
  @override
  String get itemNm;
  @override
  int get splitSeq;
  @override
  String get wrkRemark;
  @override
  String get pjtNm2;
  @override
  String get wrkNo;
  @override
  int get splitNo;
  @override
  String get cbxSuNo;
  @override
  String get vendNm;
  @override
  String get cbxSuNm;
  @override
  int get cbxSuSeq;
  @override
  String get sboxSpec;
  @override
  String get wrkdTagNo;
  @override
  String get wrkCfmYn;
  @override
  double get setCbxQty;
  @override
  String get wrkCfmDttm;
  @override
  String get tagNo;
  @override
  String get itemCd;
  @override
  String get scanYn;
  @override
  String get pitmCd;
  @override
  String get wrkQty;
  @override
  int get cbxQty;
  @override
  int get setQty;
  @override
  String get wrkQtySync;
  @override
  String get vendCd;
  @override
  String get qtyUnit;
  @override
  String get wrkTagNo;
  @override
  String get wksNo;
  @override
  String get ncbxRmk;
  @override
  @JsonKey(ignore: true)
  _$$InnerBodyItemImplCopyWith<_$InnerBodyItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
