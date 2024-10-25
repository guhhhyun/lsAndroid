// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ipgo_cancel_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IpgoCancelModel _$IpgoCancelModelFromJson(Map<String, dynamic> json) {
  return _IpgoCancelModel.fromJson(json);
}

/// @nodoc
mixin _$IpgoCancelModel {
  Header? get header => throw _privateConstructorUsedError;
  String get resultCode => throw _privateConstructorUsedError;
  String get resultMessage => throw _privateConstructorUsedError;
  List<dynamic>? get body =>
      throw _privateConstructorUsedError; // body는 다양한 타입의 요소들을 포함하므로 dynamic으로 설정
  bool get hasError => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IpgoCancelModelCopyWith<IpgoCancelModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IpgoCancelModelCopyWith<$Res> {
  factory $IpgoCancelModelCopyWith(
          IpgoCancelModel value, $Res Function(IpgoCancelModel) then) =
      _$IpgoCancelModelCopyWithImpl<$Res, IpgoCancelModel>;
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
class _$IpgoCancelModelCopyWithImpl<$Res, $Val extends IpgoCancelModel>
    implements $IpgoCancelModelCopyWith<$Res> {
  _$IpgoCancelModelCopyWithImpl(this._value, this._then);

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
abstract class _$$IpgoCancelModelImplCopyWith<$Res>
    implements $IpgoCancelModelCopyWith<$Res> {
  factory _$$IpgoCancelModelImplCopyWith(_$IpgoCancelModelImpl value,
          $Res Function(_$IpgoCancelModelImpl) then) =
      __$$IpgoCancelModelImplCopyWithImpl<$Res>;
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
class __$$IpgoCancelModelImplCopyWithImpl<$Res>
    extends _$IpgoCancelModelCopyWithImpl<$Res, _$IpgoCancelModelImpl>
    implements _$$IpgoCancelModelImplCopyWith<$Res> {
  __$$IpgoCancelModelImplCopyWithImpl(
      _$IpgoCancelModelImpl _value, $Res Function(_$IpgoCancelModelImpl) _then)
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
    return _then(_$IpgoCancelModelImpl(
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
class _$IpgoCancelModelImpl implements _IpgoCancelModel {
  _$IpgoCancelModelImpl(
      {this.header,
      this.resultCode = '',
      this.resultMessage = '',
      final List<dynamic>? body,
      this.hasError = false})
      : _body = body;

  factory _$IpgoCancelModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$IpgoCancelModelImplFromJson(json);

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

// body는 다양한 타입의 요소들을 포함하므로 dynamic으로 설정
  @override
  @JsonKey()
  final bool hasError;

  @override
  String toString() {
    return 'IpgoCancelModel(header: $header, resultCode: $resultCode, resultMessage: $resultMessage, body: $body, hasError: $hasError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IpgoCancelModelImpl &&
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
  _$$IpgoCancelModelImplCopyWith<_$IpgoCancelModelImpl> get copyWith =>
      __$$IpgoCancelModelImplCopyWithImpl<_$IpgoCancelModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IpgoCancelModelImplToJson(
      this,
    );
  }
}

abstract class _IpgoCancelModel implements IpgoCancelModel {
  factory _IpgoCancelModel(
      {final Header? header,
      final String resultCode,
      final String resultMessage,
      final List<dynamic>? body,
      final bool hasError}) = _$IpgoCancelModelImpl;

  factory _IpgoCancelModel.fromJson(Map<String, dynamic> json) =
      _$IpgoCancelModelImpl.fromJson;

  @override
  Header? get header;
  @override
  String get resultCode;
  @override
  String get resultMessage;
  @override
  List<dynamic>? get body;
  @override // body는 다양한 타입의 요소들을 포함하므로 dynamic으로 설정
  bool get hasError;
  @override
  @JsonKey(ignore: true)
  _$$IpgoCancelModelImplCopyWith<_$IpgoCancelModelImpl> get copyWith =>
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
  factory _Header(
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
  _$BodyItemImpl(
      {required this.resultValue,
      this.resultRowCount = 0,
      this.resultCode = '',
      this.resultMessage = '',
      this.errorState = '',
      this.errorProcedure = '',
      this.returnMessage = ''});

  factory _$BodyItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$BodyItemImplFromJson(json);

  @override
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
  factory _BodyItem(
      {required final bool resultValue,
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

InboundItem _$InboundItemFromJson(Map<String, dynamic> json) {
  return _InboundItem.fromJson(json);
}

/// @nodoc
mixin _$InboundItem {
  int get no => throw _privateConstructorUsedError;
  String get inbNo => throw _privateConstructorUsedError;
  String? get pjtNm => throw _privateConstructorUsedError;
  String get grpKey => throw _privateConstructorUsedError;
  String get inbType => throw _privateConstructorUsedError;
  dynamic get remark => throw _privateConstructorUsedError;
  String get itemNm => throw _privateConstructorUsedError;
  String get lotNo => throw _privateConstructorUsedError;
  String get InbDt => throw _privateConstructorUsedError;
  bool get checked => throw _privateConstructorUsedError;
  dynamic get vendNm => throw _privateConstructorUsedError;
  dynamic get docDt => throw _privateConstructorUsedError;
  bool get selected => throw _privateConstructorUsedError;
  String get inbUserNm => throw _privateConstructorUsedError;
  String get locCd => throw _privateConstructorUsedError;
  String get whCd => throw _privateConstructorUsedError;
  int get inbSeq => throw _privateConstructorUsedError;
  String get itemCd => throw _privateConstructorUsedError;
  dynamic get docNo => throw _privateConstructorUsedError;
  String get plant => throw _privateConstructorUsedError;
  dynamic get qty => throw _privateConstructorUsedError;
  String get inbUser => throw _privateConstructorUsedError;
  dynamic get vendCd => throw _privateConstructorUsedError;
  String get qtyUnit => throw _privateConstructorUsedError;
  String get mstKey => throw _privateConstructorUsedError;
  String get inbTypeNm => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InboundItemCopyWith<InboundItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InboundItemCopyWith<$Res> {
  factory $InboundItemCopyWith(
          InboundItem value, $Res Function(InboundItem) then) =
      _$InboundItemCopyWithImpl<$Res, InboundItem>;
  @useResult
  $Res call(
      {int no,
      String inbNo,
      String? pjtNm,
      String grpKey,
      String inbType,
      dynamic remark,
      String itemNm,
      String lotNo,
      String InbDt,
      bool checked,
      dynamic vendNm,
      dynamic docDt,
      bool selected,
      String inbUserNm,
      String locCd,
      String whCd,
      int inbSeq,
      String itemCd,
      dynamic docNo,
      String plant,
      dynamic qty,
      String inbUser,
      dynamic vendCd,
      String qtyUnit,
      String mstKey,
      String inbTypeNm});
}

/// @nodoc
class _$InboundItemCopyWithImpl<$Res, $Val extends InboundItem>
    implements $InboundItemCopyWith<$Res> {
  _$InboundItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? no = null,
    Object? inbNo = null,
    Object? pjtNm = freezed,
    Object? grpKey = null,
    Object? inbType = null,
    Object? remark = freezed,
    Object? itemNm = null,
    Object? lotNo = null,
    Object? InbDt = null,
    Object? checked = null,
    Object? vendNm = freezed,
    Object? docDt = freezed,
    Object? selected = null,
    Object? inbUserNm = null,
    Object? locCd = null,
    Object? whCd = null,
    Object? inbSeq = null,
    Object? itemCd = null,
    Object? docNo = freezed,
    Object? plant = null,
    Object? qty = freezed,
    Object? inbUser = null,
    Object? vendCd = freezed,
    Object? qtyUnit = null,
    Object? mstKey = null,
    Object? inbTypeNm = null,
  }) {
    return _then(_value.copyWith(
      no: null == no
          ? _value.no
          : no // ignore: cast_nullable_to_non_nullable
              as int,
      inbNo: null == inbNo
          ? _value.inbNo
          : inbNo // ignore: cast_nullable_to_non_nullable
              as String,
      pjtNm: freezed == pjtNm
          ? _value.pjtNm
          : pjtNm // ignore: cast_nullable_to_non_nullable
              as String?,
      grpKey: null == grpKey
          ? _value.grpKey
          : grpKey // ignore: cast_nullable_to_non_nullable
              as String,
      inbType: null == inbType
          ? _value.inbType
          : inbType // ignore: cast_nullable_to_non_nullable
              as String,
      remark: freezed == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as dynamic,
      itemNm: null == itemNm
          ? _value.itemNm
          : itemNm // ignore: cast_nullable_to_non_nullable
              as String,
      lotNo: null == lotNo
          ? _value.lotNo
          : lotNo // ignore: cast_nullable_to_non_nullable
              as String,
      InbDt: null == InbDt
          ? _value.InbDt
          : InbDt // ignore: cast_nullable_to_non_nullable
              as String,
      checked: null == checked
          ? _value.checked
          : checked // ignore: cast_nullable_to_non_nullable
              as bool,
      vendNm: freezed == vendNm
          ? _value.vendNm
          : vendNm // ignore: cast_nullable_to_non_nullable
              as dynamic,
      docDt: freezed == docDt
          ? _value.docDt
          : docDt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
      inbUserNm: null == inbUserNm
          ? _value.inbUserNm
          : inbUserNm // ignore: cast_nullable_to_non_nullable
              as String,
      locCd: null == locCd
          ? _value.locCd
          : locCd // ignore: cast_nullable_to_non_nullable
              as String,
      whCd: null == whCd
          ? _value.whCd
          : whCd // ignore: cast_nullable_to_non_nullable
              as String,
      inbSeq: null == inbSeq
          ? _value.inbSeq
          : inbSeq // ignore: cast_nullable_to_non_nullable
              as int,
      itemCd: null == itemCd
          ? _value.itemCd
          : itemCd // ignore: cast_nullable_to_non_nullable
              as String,
      docNo: freezed == docNo
          ? _value.docNo
          : docNo // ignore: cast_nullable_to_non_nullable
              as dynamic,
      plant: null == plant
          ? _value.plant
          : plant // ignore: cast_nullable_to_non_nullable
              as String,
      qty: freezed == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as dynamic,
      inbUser: null == inbUser
          ? _value.inbUser
          : inbUser // ignore: cast_nullable_to_non_nullable
              as String,
      vendCd: freezed == vendCd
          ? _value.vendCd
          : vendCd // ignore: cast_nullable_to_non_nullable
              as dynamic,
      qtyUnit: null == qtyUnit
          ? _value.qtyUnit
          : qtyUnit // ignore: cast_nullable_to_non_nullable
              as String,
      mstKey: null == mstKey
          ? _value.mstKey
          : mstKey // ignore: cast_nullable_to_non_nullable
              as String,
      inbTypeNm: null == inbTypeNm
          ? _value.inbTypeNm
          : inbTypeNm // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InboundItemImplCopyWith<$Res>
    implements $InboundItemCopyWith<$Res> {
  factory _$$InboundItemImplCopyWith(
          _$InboundItemImpl value, $Res Function(_$InboundItemImpl) then) =
      __$$InboundItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int no,
      String inbNo,
      String? pjtNm,
      String grpKey,
      String inbType,
      dynamic remark,
      String itemNm,
      String lotNo,
      String InbDt,
      bool checked,
      dynamic vendNm,
      dynamic docDt,
      bool selected,
      String inbUserNm,
      String locCd,
      String whCd,
      int inbSeq,
      String itemCd,
      dynamic docNo,
      String plant,
      dynamic qty,
      String inbUser,
      dynamic vendCd,
      String qtyUnit,
      String mstKey,
      String inbTypeNm});
}

/// @nodoc
class __$$InboundItemImplCopyWithImpl<$Res>
    extends _$InboundItemCopyWithImpl<$Res, _$InboundItemImpl>
    implements _$$InboundItemImplCopyWith<$Res> {
  __$$InboundItemImplCopyWithImpl(
      _$InboundItemImpl _value, $Res Function(_$InboundItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? no = null,
    Object? inbNo = null,
    Object? pjtNm = freezed,
    Object? grpKey = null,
    Object? inbType = null,
    Object? remark = freezed,
    Object? itemNm = null,
    Object? lotNo = null,
    Object? InbDt = null,
    Object? checked = null,
    Object? vendNm = freezed,
    Object? docDt = freezed,
    Object? selected = null,
    Object? inbUserNm = null,
    Object? locCd = null,
    Object? whCd = null,
    Object? inbSeq = null,
    Object? itemCd = null,
    Object? docNo = freezed,
    Object? plant = null,
    Object? qty = freezed,
    Object? inbUser = null,
    Object? vendCd = freezed,
    Object? qtyUnit = null,
    Object? mstKey = null,
    Object? inbTypeNm = null,
  }) {
    return _then(_$InboundItemImpl(
      no: null == no
          ? _value.no
          : no // ignore: cast_nullable_to_non_nullable
              as int,
      inbNo: null == inbNo
          ? _value.inbNo
          : inbNo // ignore: cast_nullable_to_non_nullable
              as String,
      pjtNm: freezed == pjtNm
          ? _value.pjtNm
          : pjtNm // ignore: cast_nullable_to_non_nullable
              as String?,
      grpKey: null == grpKey
          ? _value.grpKey
          : grpKey // ignore: cast_nullable_to_non_nullable
              as String,
      inbType: null == inbType
          ? _value.inbType
          : inbType // ignore: cast_nullable_to_non_nullable
              as String,
      remark: freezed == remark ? _value.remark! : remark,
      itemNm: null == itemNm
          ? _value.itemNm
          : itemNm // ignore: cast_nullable_to_non_nullable
              as String,
      lotNo: null == lotNo
          ? _value.lotNo
          : lotNo // ignore: cast_nullable_to_non_nullable
              as String,
      InbDt: null == InbDt
          ? _value.InbDt
          : InbDt // ignore: cast_nullable_to_non_nullable
              as String,
      checked: null == checked
          ? _value.checked
          : checked // ignore: cast_nullable_to_non_nullable
              as bool,
      vendNm: freezed == vendNm ? _value.vendNm! : vendNm,
      docDt: freezed == docDt ? _value.docDt! : docDt,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
      inbUserNm: null == inbUserNm
          ? _value.inbUserNm
          : inbUserNm // ignore: cast_nullable_to_non_nullable
              as String,
      locCd: null == locCd
          ? _value.locCd
          : locCd // ignore: cast_nullable_to_non_nullable
              as String,
      whCd: null == whCd
          ? _value.whCd
          : whCd // ignore: cast_nullable_to_non_nullable
              as String,
      inbSeq: null == inbSeq
          ? _value.inbSeq
          : inbSeq // ignore: cast_nullable_to_non_nullable
              as int,
      itemCd: null == itemCd
          ? _value.itemCd
          : itemCd // ignore: cast_nullable_to_non_nullable
              as String,
      docNo: freezed == docNo ? _value.docNo! : docNo,
      plant: null == plant
          ? _value.plant
          : plant // ignore: cast_nullable_to_non_nullable
              as String,
      qty: freezed == qty ? _value.qty! : qty,
      inbUser: null == inbUser
          ? _value.inbUser
          : inbUser // ignore: cast_nullable_to_non_nullable
              as String,
      vendCd: freezed == vendCd ? _value.vendCd! : vendCd,
      qtyUnit: null == qtyUnit
          ? _value.qtyUnit
          : qtyUnit // ignore: cast_nullable_to_non_nullable
              as String,
      mstKey: null == mstKey
          ? _value.mstKey
          : mstKey // ignore: cast_nullable_to_non_nullable
              as String,
      inbTypeNm: null == inbTypeNm
          ? _value.inbTypeNm
          : inbTypeNm // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InboundItemImpl implements _InboundItem {
  _$InboundItemImpl(
      {this.no = 0,
      this.inbNo = '',
      this.pjtNm,
      this.grpKey = '',
      this.inbType = '',
      this.remark = '',
      this.itemNm = '',
      this.lotNo = '',
      this.InbDt = '',
      this.checked = false,
      this.vendNm = '',
      this.docDt = '',
      this.selected = false,
      this.inbUserNm = '',
      this.locCd = '',
      this.whCd = '',
      this.inbSeq = 0,
      this.itemCd = '',
      this.docNo = '',
      this.plant = '',
      this.qty = 0.0,
      this.inbUser = '',
      this.vendCd = '',
      this.qtyUnit = '',
      this.mstKey = '',
      this.inbTypeNm = ''});

  factory _$InboundItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$InboundItemImplFromJson(json);

  @override
  @JsonKey()
  final int no;
  @override
  @JsonKey()
  final String inbNo;
  @override
  final String? pjtNm;
  @override
  @JsonKey()
  final String grpKey;
  @override
  @JsonKey()
  final String inbType;
  @override
  @JsonKey()
  final dynamic remark;
  @override
  @JsonKey()
  final String itemNm;
  @override
  @JsonKey()
  final String lotNo;
  @override
  @JsonKey()
  final String InbDt;
  @override
  @JsonKey()
  final bool checked;
  @override
  @JsonKey()
  final dynamic vendNm;
  @override
  @JsonKey()
  final dynamic docDt;
  @override
  @JsonKey()
  final bool selected;
  @override
  @JsonKey()
  final String inbUserNm;
  @override
  @JsonKey()
  final String locCd;
  @override
  @JsonKey()
  final String whCd;
  @override
  @JsonKey()
  final int inbSeq;
  @override
  @JsonKey()
  final String itemCd;
  @override
  @JsonKey()
  final dynamic docNo;
  @override
  @JsonKey()
  final String plant;
  @override
  @JsonKey()
  final dynamic qty;
  @override
  @JsonKey()
  final String inbUser;
  @override
  @JsonKey()
  final dynamic vendCd;
  @override
  @JsonKey()
  final String qtyUnit;
  @override
  @JsonKey()
  final String mstKey;
  @override
  @JsonKey()
  final String inbTypeNm;

  @override
  String toString() {
    return 'InboundItem(no: $no, inbNo: $inbNo, pjtNm: $pjtNm, grpKey: $grpKey, inbType: $inbType, remark: $remark, itemNm: $itemNm, lotNo: $lotNo, InbDt: $InbDt, checked: $checked, vendNm: $vendNm, docDt: $docDt, selected: $selected, inbUserNm: $inbUserNm, locCd: $locCd, whCd: $whCd, inbSeq: $inbSeq, itemCd: $itemCd, docNo: $docNo, plant: $plant, qty: $qty, inbUser: $inbUser, vendCd: $vendCd, qtyUnit: $qtyUnit, mstKey: $mstKey, inbTypeNm: $inbTypeNm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InboundItemImpl &&
            (identical(other.no, no) || other.no == no) &&
            (identical(other.inbNo, inbNo) || other.inbNo == inbNo) &&
            (identical(other.pjtNm, pjtNm) || other.pjtNm == pjtNm) &&
            (identical(other.grpKey, grpKey) || other.grpKey == grpKey) &&
            (identical(other.inbType, inbType) || other.inbType == inbType) &&
            const DeepCollectionEquality().equals(other.remark, remark) &&
            (identical(other.itemNm, itemNm) || other.itemNm == itemNm) &&
            (identical(other.lotNo, lotNo) || other.lotNo == lotNo) &&
            (identical(other.InbDt, InbDt) || other.InbDt == InbDt) &&
            (identical(other.checked, checked) || other.checked == checked) &&
            const DeepCollectionEquality().equals(other.vendNm, vendNm) &&
            const DeepCollectionEquality().equals(other.docDt, docDt) &&
            (identical(other.selected, selected) ||
                other.selected == selected) &&
            (identical(other.inbUserNm, inbUserNm) ||
                other.inbUserNm == inbUserNm) &&
            (identical(other.locCd, locCd) || other.locCd == locCd) &&
            (identical(other.whCd, whCd) || other.whCd == whCd) &&
            (identical(other.inbSeq, inbSeq) || other.inbSeq == inbSeq) &&
            (identical(other.itemCd, itemCd) || other.itemCd == itemCd) &&
            const DeepCollectionEquality().equals(other.docNo, docNo) &&
            (identical(other.plant, plant) || other.plant == plant) &&
            const DeepCollectionEquality().equals(other.qty, qty) &&
            (identical(other.inbUser, inbUser) || other.inbUser == inbUser) &&
            const DeepCollectionEquality().equals(other.vendCd, vendCd) &&
            (identical(other.qtyUnit, qtyUnit) || other.qtyUnit == qtyUnit) &&
            (identical(other.mstKey, mstKey) || other.mstKey == mstKey) &&
            (identical(other.inbTypeNm, inbTypeNm) ||
                other.inbTypeNm == inbTypeNm));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        no,
        inbNo,
        pjtNm,
        grpKey,
        inbType,
        const DeepCollectionEquality().hash(remark),
        itemNm,
        lotNo,
        InbDt,
        checked,
        const DeepCollectionEquality().hash(vendNm),
        const DeepCollectionEquality().hash(docDt),
        selected,
        inbUserNm,
        locCd,
        whCd,
        inbSeq,
        itemCd,
        const DeepCollectionEquality().hash(docNo),
        plant,
        const DeepCollectionEquality().hash(qty),
        inbUser,
        const DeepCollectionEquality().hash(vendCd),
        qtyUnit,
        mstKey,
        inbTypeNm
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InboundItemImplCopyWith<_$InboundItemImpl> get copyWith =>
      __$$InboundItemImplCopyWithImpl<_$InboundItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InboundItemImplToJson(
      this,
    );
  }
}

abstract class _InboundItem implements InboundItem {
  factory _InboundItem(
      {final int no,
      final String inbNo,
      final String? pjtNm,
      final String grpKey,
      final String inbType,
      final dynamic remark,
      final String itemNm,
      final String lotNo,
      final String InbDt,
      final bool checked,
      final dynamic vendNm,
      final dynamic docDt,
      final bool selected,
      final String inbUserNm,
      final String locCd,
      final String whCd,
      final int inbSeq,
      final String itemCd,
      final dynamic docNo,
      final String plant,
      final dynamic qty,
      final String inbUser,
      final dynamic vendCd,
      final String qtyUnit,
      final String mstKey,
      final String inbTypeNm}) = _$InboundItemImpl;

  factory _InboundItem.fromJson(Map<String, dynamic> json) =
      _$InboundItemImpl.fromJson;

  @override
  int get no;
  @override
  String get inbNo;
  @override
  String? get pjtNm;
  @override
  String get grpKey;
  @override
  String get inbType;
  @override
  dynamic get remark;
  @override
  String get itemNm;
  @override
  String get lotNo;
  @override
  String get InbDt;
  @override
  bool get checked;
  @override
  dynamic get vendNm;
  @override
  dynamic get docDt;
  @override
  bool get selected;
  @override
  String get inbUserNm;
  @override
  String get locCd;
  @override
  String get whCd;
  @override
  int get inbSeq;
  @override
  String get itemCd;
  @override
  dynamic get docNo;
  @override
  String get plant;
  @override
  dynamic get qty;
  @override
  String get inbUser;
  @override
  dynamic get vendCd;
  @override
  String get qtyUnit;
  @override
  String get mstKey;
  @override
  String get inbTypeNm;
  @override
  @JsonKey(ignore: true)
  _$$InboundItemImplCopyWith<_$InboundItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
