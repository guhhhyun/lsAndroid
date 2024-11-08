// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_kit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MainKitModel _$MainKitModelFromJson(Map<String, dynamic> json) {
  return _MainKitModel.fromJson(json);
}

/// @nodoc
mixin _$MainKitModel {
  Header? get header => throw _privateConstructorUsedError;
  String get resultCode => throw _privateConstructorUsedError;
  String get resultMessage => throw _privateConstructorUsedError;
  List<dynamic>? get body => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MainKitModelCopyWith<MainKitModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainKitModelCopyWith<$Res> {
  factory $MainKitModelCopyWith(
          MainKitModel value, $Res Function(MainKitModel) then) =
      _$MainKitModelCopyWithImpl<$Res, MainKitModel>;
  @useResult
  $Res call(
      {Header? header,
      String resultCode,
      String resultMessage,
      List<dynamic>? body});

  $HeaderCopyWith<$Res>? get header;
}

/// @nodoc
class _$MainKitModelCopyWithImpl<$Res, $Val extends MainKitModel>
    implements $MainKitModelCopyWith<$Res> {
  _$MainKitModelCopyWithImpl(this._value, this._then);

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
abstract class _$$MainKitModelImplCopyWith<$Res>
    implements $MainKitModelCopyWith<$Res> {
  factory _$$MainKitModelImplCopyWith(
          _$MainKitModelImpl value, $Res Function(_$MainKitModelImpl) then) =
      __$$MainKitModelImplCopyWithImpl<$Res>;
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
class __$$MainKitModelImplCopyWithImpl<$Res>
    extends _$MainKitModelCopyWithImpl<$Res, _$MainKitModelImpl>
    implements _$$MainKitModelImplCopyWith<$Res> {
  __$$MainKitModelImplCopyWithImpl(
      _$MainKitModelImpl _value, $Res Function(_$MainKitModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? header = freezed,
    Object? resultCode = null,
    Object? resultMessage = null,
    Object? body = freezed,
  }) {
    return _then(_$MainKitModelImpl(
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
class _$MainKitModelImpl implements _MainKitModel {
  const _$MainKitModelImpl(
      {this.header,
      this.resultCode = '',
      this.resultMessage = '',
      final List<dynamic>? body})
      : _body = body;

  factory _$MainKitModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MainKitModelImplFromJson(json);

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
    return 'MainKitModel(header: $header, resultCode: $resultCode, resultMessage: $resultMessage, body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainKitModelImpl &&
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
  _$$MainKitModelImplCopyWith<_$MainKitModelImpl> get copyWith =>
      __$$MainKitModelImplCopyWithImpl<_$MainKitModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MainKitModelImplToJson(
      this,
    );
  }
}

abstract class _MainKitModel implements MainKitModel {
  const factory _MainKitModel(
      {final Header? header,
      final String resultCode,
      final String resultMessage,
      final List<dynamic>? body}) = _$MainKitModelImpl;

  factory _MainKitModel.fromJson(Map<String, dynamic> json) =
      _$MainKitModelImpl.fromJson;

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
  _$$MainKitModelImplCopyWith<_$MainKitModelImpl> get copyWith =>
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
  dynamic get scanNo => throw _privateConstructorUsedError;
  dynamic get scanSeq => throw _privateConstructorUsedError;
  dynamic get dTagNo => throw _privateConstructorUsedError;
  dynamic get syncYn => throw _privateConstructorUsedError;
  dynamic get remark => throw _privateConstructorUsedError;
  DateTime? get chkDtm => throw _privateConstructorUsedError;
  dynamic get pitmNm => throw _privateConstructorUsedError;
  dynamic get cbxMaNo => throw _privateConstructorUsedError;
  dynamic get itemNm => throw _privateConstructorUsedError;
  dynamic get wrkRemark => throw _privateConstructorUsedError;
  dynamic get dScanNo => throw _privateConstructorUsedError;
  dynamic get pjtNm2 => throw _privateConstructorUsedError;
  dynamic get wrkNo => throw _privateConstructorUsedError;
  dynamic get cbxMaSeq => throw _privateConstructorUsedError;
  dynamic get cbxSuNo => throw _privateConstructorUsedError;
  dynamic get cbxSuNm => throw _privateConstructorUsedError;
  dynamic get cbxSuSeq => throw _privateConstructorUsedError;
  dynamic get sboxSpec => throw _privateConstructorUsedError;
  dynamic get wrkCfmYn => throw _privateConstructorUsedError;
  dynamic get setCbxQty => throw _privateConstructorUsedError;
  DateTime? get wrkCfmDttm => throw _privateConstructorUsedError;
  dynamic get itemCd => throw _privateConstructorUsedError;
  dynamic get tagNo => throw _privateConstructorUsedError;
  dynamic get scanYn => throw _privateConstructorUsedError;
  dynamic get pitmCd => throw _privateConstructorUsedError;
  dynamic get wrkQty => throw _privateConstructorUsedError;
  dynamic get cbxQty => throw _privateConstructorUsedError;
  dynamic get setQty => throw _privateConstructorUsedError;
  dynamic get wrkQtySync => throw _privateConstructorUsedError;
  dynamic get dWrkQty => throw _privateConstructorUsedError;
  dynamic get pdtNo => throw _privateConstructorUsedError;
  dynamic get qtyUnit => throw _privateConstructorUsedError;
  dynamic get mboxExcluded => throw _privateConstructorUsedError;
  dynamic get itemNmNonKit => throw _privateConstructorUsedError;
  dynamic get wksNo => throw _privateConstructorUsedError;
  dynamic get ncbxRmk => throw _privateConstructorUsedError;

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
      {dynamic scanNo,
      dynamic scanSeq,
      dynamic dTagNo,
      dynamic syncYn,
      dynamic remark,
      DateTime? chkDtm,
      dynamic pitmNm,
      dynamic cbxMaNo,
      dynamic itemNm,
      dynamic wrkRemark,
      dynamic dScanNo,
      dynamic pjtNm2,
      dynamic wrkNo,
      dynamic cbxMaSeq,
      dynamic cbxSuNo,
      dynamic cbxSuNm,
      dynamic cbxSuSeq,
      dynamic sboxSpec,
      dynamic wrkCfmYn,
      dynamic setCbxQty,
      DateTime? wrkCfmDttm,
      dynamic itemCd,
      dynamic tagNo,
      dynamic scanYn,
      dynamic pitmCd,
      dynamic wrkQty,
      dynamic cbxQty,
      dynamic setQty,
      dynamic wrkQtySync,
      dynamic dWrkQty,
      dynamic pdtNo,
      dynamic qtyUnit,
      dynamic mboxExcluded,
      dynamic itemNmNonKit,
      dynamic wksNo,
      dynamic ncbxRmk});
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
    Object? scanNo = freezed,
    Object? scanSeq = freezed,
    Object? dTagNo = freezed,
    Object? syncYn = freezed,
    Object? remark = freezed,
    Object? chkDtm = freezed,
    Object? pitmNm = freezed,
    Object? cbxMaNo = freezed,
    Object? itemNm = freezed,
    Object? wrkRemark = freezed,
    Object? dScanNo = freezed,
    Object? pjtNm2 = freezed,
    Object? wrkNo = freezed,
    Object? cbxMaSeq = freezed,
    Object? cbxSuNo = freezed,
    Object? cbxSuNm = freezed,
    Object? cbxSuSeq = freezed,
    Object? sboxSpec = freezed,
    Object? wrkCfmYn = freezed,
    Object? setCbxQty = freezed,
    Object? wrkCfmDttm = freezed,
    Object? itemCd = freezed,
    Object? tagNo = freezed,
    Object? scanYn = freezed,
    Object? pitmCd = freezed,
    Object? wrkQty = freezed,
    Object? cbxQty = freezed,
    Object? setQty = freezed,
    Object? wrkQtySync = freezed,
    Object? dWrkQty = freezed,
    Object? pdtNo = freezed,
    Object? qtyUnit = freezed,
    Object? mboxExcluded = freezed,
    Object? itemNmNonKit = freezed,
    Object? wksNo = freezed,
    Object? ncbxRmk = freezed,
  }) {
    return _then(_value.copyWith(
      scanNo: freezed == scanNo
          ? _value.scanNo
          : scanNo // ignore: cast_nullable_to_non_nullable
              as dynamic,
      scanSeq: freezed == scanSeq
          ? _value.scanSeq
          : scanSeq // ignore: cast_nullable_to_non_nullable
              as dynamic,
      dTagNo: freezed == dTagNo
          ? _value.dTagNo
          : dTagNo // ignore: cast_nullable_to_non_nullable
              as dynamic,
      syncYn: freezed == syncYn
          ? _value.syncYn
          : syncYn // ignore: cast_nullable_to_non_nullable
              as dynamic,
      remark: freezed == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as dynamic,
      chkDtm: freezed == chkDtm
          ? _value.chkDtm
          : chkDtm // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      pitmNm: freezed == pitmNm
          ? _value.pitmNm
          : pitmNm // ignore: cast_nullable_to_non_nullable
              as dynamic,
      cbxMaNo: freezed == cbxMaNo
          ? _value.cbxMaNo
          : cbxMaNo // ignore: cast_nullable_to_non_nullable
              as dynamic,
      itemNm: freezed == itemNm
          ? _value.itemNm
          : itemNm // ignore: cast_nullable_to_non_nullable
              as dynamic,
      wrkRemark: freezed == wrkRemark
          ? _value.wrkRemark
          : wrkRemark // ignore: cast_nullable_to_non_nullable
              as dynamic,
      dScanNo: freezed == dScanNo
          ? _value.dScanNo
          : dScanNo // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pjtNm2: freezed == pjtNm2
          ? _value.pjtNm2
          : pjtNm2 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      wrkNo: freezed == wrkNo
          ? _value.wrkNo
          : wrkNo // ignore: cast_nullable_to_non_nullable
              as dynamic,
      cbxMaSeq: freezed == cbxMaSeq
          ? _value.cbxMaSeq
          : cbxMaSeq // ignore: cast_nullable_to_non_nullable
              as dynamic,
      cbxSuNo: freezed == cbxSuNo
          ? _value.cbxSuNo
          : cbxSuNo // ignore: cast_nullable_to_non_nullable
              as dynamic,
      cbxSuNm: freezed == cbxSuNm
          ? _value.cbxSuNm
          : cbxSuNm // ignore: cast_nullable_to_non_nullable
              as dynamic,
      cbxSuSeq: freezed == cbxSuSeq
          ? _value.cbxSuSeq
          : cbxSuSeq // ignore: cast_nullable_to_non_nullable
              as dynamic,
      sboxSpec: freezed == sboxSpec
          ? _value.sboxSpec
          : sboxSpec // ignore: cast_nullable_to_non_nullable
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
              as DateTime?,
      itemCd: freezed == itemCd
          ? _value.itemCd
          : itemCd // ignore: cast_nullable_to_non_nullable
              as dynamic,
      tagNo: freezed == tagNo
          ? _value.tagNo
          : tagNo // ignore: cast_nullable_to_non_nullable
              as dynamic,
      scanYn: freezed == scanYn
          ? _value.scanYn
          : scanYn // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pitmCd: freezed == pitmCd
          ? _value.pitmCd
          : pitmCd // ignore: cast_nullable_to_non_nullable
              as dynamic,
      wrkQty: freezed == wrkQty
          ? _value.wrkQty
          : wrkQty // ignore: cast_nullable_to_non_nullable
              as dynamic,
      cbxQty: freezed == cbxQty
          ? _value.cbxQty
          : cbxQty // ignore: cast_nullable_to_non_nullable
              as dynamic,
      setQty: freezed == setQty
          ? _value.setQty
          : setQty // ignore: cast_nullable_to_non_nullable
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
      mboxExcluded: freezed == mboxExcluded
          ? _value.mboxExcluded
          : mboxExcluded // ignore: cast_nullable_to_non_nullable
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
abstract class _$$SubBodyItemImplCopyWith<$Res>
    implements $SubBodyItemCopyWith<$Res> {
  factory _$$SubBodyItemImplCopyWith(
          _$SubBodyItemImpl value, $Res Function(_$SubBodyItemImpl) then) =
      __$$SubBodyItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic scanNo,
      dynamic scanSeq,
      dynamic dTagNo,
      dynamic syncYn,
      dynamic remark,
      DateTime? chkDtm,
      dynamic pitmNm,
      dynamic cbxMaNo,
      dynamic itemNm,
      dynamic wrkRemark,
      dynamic dScanNo,
      dynamic pjtNm2,
      dynamic wrkNo,
      dynamic cbxMaSeq,
      dynamic cbxSuNo,
      dynamic cbxSuNm,
      dynamic cbxSuSeq,
      dynamic sboxSpec,
      dynamic wrkCfmYn,
      dynamic setCbxQty,
      DateTime? wrkCfmDttm,
      dynamic itemCd,
      dynamic tagNo,
      dynamic scanYn,
      dynamic pitmCd,
      dynamic wrkQty,
      dynamic cbxQty,
      dynamic setQty,
      dynamic wrkQtySync,
      dynamic dWrkQty,
      dynamic pdtNo,
      dynamic qtyUnit,
      dynamic mboxExcluded,
      dynamic itemNmNonKit,
      dynamic wksNo,
      dynamic ncbxRmk});
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
    Object? scanNo = freezed,
    Object? scanSeq = freezed,
    Object? dTagNo = freezed,
    Object? syncYn = freezed,
    Object? remark = freezed,
    Object? chkDtm = freezed,
    Object? pitmNm = freezed,
    Object? cbxMaNo = freezed,
    Object? itemNm = freezed,
    Object? wrkRemark = freezed,
    Object? dScanNo = freezed,
    Object? pjtNm2 = freezed,
    Object? wrkNo = freezed,
    Object? cbxMaSeq = freezed,
    Object? cbxSuNo = freezed,
    Object? cbxSuNm = freezed,
    Object? cbxSuSeq = freezed,
    Object? sboxSpec = freezed,
    Object? wrkCfmYn = freezed,
    Object? setCbxQty = freezed,
    Object? wrkCfmDttm = freezed,
    Object? itemCd = freezed,
    Object? tagNo = freezed,
    Object? scanYn = freezed,
    Object? pitmCd = freezed,
    Object? wrkQty = freezed,
    Object? cbxQty = freezed,
    Object? setQty = freezed,
    Object? wrkQtySync = freezed,
    Object? dWrkQty = freezed,
    Object? pdtNo = freezed,
    Object? qtyUnit = freezed,
    Object? mboxExcluded = freezed,
    Object? itemNmNonKit = freezed,
    Object? wksNo = freezed,
    Object? ncbxRmk = freezed,
  }) {
    return _then(_$SubBodyItemImpl(
      scanNo: freezed == scanNo ? _value.scanNo! : scanNo,
      scanSeq: freezed == scanSeq ? _value.scanSeq! : scanSeq,
      dTagNo: freezed == dTagNo ? _value.dTagNo! : dTagNo,
      syncYn: freezed == syncYn ? _value.syncYn! : syncYn,
      remark: freezed == remark ? _value.remark! : remark,
      chkDtm: freezed == chkDtm
          ? _value.chkDtm
          : chkDtm // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      pitmNm: freezed == pitmNm ? _value.pitmNm! : pitmNm,
      cbxMaNo: freezed == cbxMaNo ? _value.cbxMaNo! : cbxMaNo,
      itemNm: freezed == itemNm ? _value.itemNm! : itemNm,
      wrkRemark: freezed == wrkRemark ? _value.wrkRemark! : wrkRemark,
      dScanNo: freezed == dScanNo ? _value.dScanNo! : dScanNo,
      pjtNm2: freezed == pjtNm2 ? _value.pjtNm2! : pjtNm2,
      wrkNo: freezed == wrkNo ? _value.wrkNo! : wrkNo,
      cbxMaSeq: freezed == cbxMaSeq ? _value.cbxMaSeq! : cbxMaSeq,
      cbxSuNo: freezed == cbxSuNo ? _value.cbxSuNo! : cbxSuNo,
      cbxSuNm: freezed == cbxSuNm ? _value.cbxSuNm! : cbxSuNm,
      cbxSuSeq: freezed == cbxSuSeq ? _value.cbxSuSeq! : cbxSuSeq,
      sboxSpec: freezed == sboxSpec ? _value.sboxSpec! : sboxSpec,
      wrkCfmYn: freezed == wrkCfmYn ? _value.wrkCfmYn! : wrkCfmYn,
      setCbxQty: freezed == setCbxQty ? _value.setCbxQty! : setCbxQty,
      wrkCfmDttm: freezed == wrkCfmDttm
          ? _value.wrkCfmDttm
          : wrkCfmDttm // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      itemCd: freezed == itemCd ? _value.itemCd! : itemCd,
      tagNo: freezed == tagNo ? _value.tagNo! : tagNo,
      scanYn: freezed == scanYn ? _value.scanYn! : scanYn,
      pitmCd: freezed == pitmCd ? _value.pitmCd! : pitmCd,
      wrkQty: freezed == wrkQty ? _value.wrkQty! : wrkQty,
      cbxQty: freezed == cbxQty ? _value.cbxQty! : cbxQty,
      setQty: freezed == setQty ? _value.setQty! : setQty,
      wrkQtySync: freezed == wrkQtySync ? _value.wrkQtySync! : wrkQtySync,
      dWrkQty: freezed == dWrkQty ? _value.dWrkQty! : dWrkQty,
      pdtNo: freezed == pdtNo ? _value.pdtNo! : pdtNo,
      qtyUnit: freezed == qtyUnit ? _value.qtyUnit! : qtyUnit,
      mboxExcluded:
          freezed == mboxExcluded ? _value.mboxExcluded! : mboxExcluded,
      itemNmNonKit:
          freezed == itemNmNonKit ? _value.itemNmNonKit! : itemNmNonKit,
      wksNo: freezed == wksNo ? _value.wksNo! : wksNo,
      ncbxRmk: freezed == ncbxRmk ? _value.ncbxRmk! : ncbxRmk,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubBodyItemImpl implements _SubBodyItem {
  const _$SubBodyItemImpl(
      {this.scanNo = '',
      this.scanSeq = 0,
      this.dTagNo = '',
      this.syncYn = '',
      this.remark = '',
      this.chkDtm,
      this.pitmNm = '',
      this.cbxMaNo = '',
      this.itemNm = '',
      this.wrkRemark = '',
      this.dScanNo = '',
      this.pjtNm2 = '',
      this.wrkNo = '',
      this.cbxMaSeq = 0,
      this.cbxSuNo = '',
      this.cbxSuNm = '',
      this.cbxSuSeq = 0,
      this.sboxSpec = '',
      this.wrkCfmYn = '',
      this.setCbxQty = 0.0,
      this.wrkCfmDttm,
      this.itemCd = '',
      this.tagNo = '',
      this.scanYn = '',
      this.pitmCd = '',
      this.wrkQty = 0.0,
      this.cbxQty = 0,
      this.setQty = 0,
      this.wrkQtySync = 0.0,
      this.dWrkQty = 0.0,
      this.pdtNo = '',
      this.qtyUnit = '',
      this.mboxExcluded = '',
      this.itemNmNonKit = '',
      this.wksNo = '',
      this.ncbxRmk = ''});

  factory _$SubBodyItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubBodyItemImplFromJson(json);

  @override
  @JsonKey()
  final dynamic scanNo;
  @override
  @JsonKey()
  final dynamic scanSeq;
  @override
  @JsonKey()
  final dynamic dTagNo;
  @override
  @JsonKey()
  final dynamic syncYn;
  @override
  @JsonKey()
  final dynamic remark;
  @override
  final DateTime? chkDtm;
  @override
  @JsonKey()
  final dynamic pitmNm;
  @override
  @JsonKey()
  final dynamic cbxMaNo;
  @override
  @JsonKey()
  final dynamic itemNm;
  @override
  @JsonKey()
  final dynamic wrkRemark;
  @override
  @JsonKey()
  final dynamic dScanNo;
  @override
  @JsonKey()
  final dynamic pjtNm2;
  @override
  @JsonKey()
  final dynamic wrkNo;
  @override
  @JsonKey()
  final dynamic cbxMaSeq;
  @override
  @JsonKey()
  final dynamic cbxSuNo;
  @override
  @JsonKey()
  final dynamic cbxSuNm;
  @override
  @JsonKey()
  final dynamic cbxSuSeq;
  @override
  @JsonKey()
  final dynamic sboxSpec;
  @override
  @JsonKey()
  final dynamic wrkCfmYn;
  @override
  @JsonKey()
  final dynamic setCbxQty;
  @override
  final DateTime? wrkCfmDttm;
  @override
  @JsonKey()
  final dynamic itemCd;
  @override
  @JsonKey()
  final dynamic tagNo;
  @override
  @JsonKey()
  final dynamic scanYn;
  @override
  @JsonKey()
  final dynamic pitmCd;
  @override
  @JsonKey()
  final dynamic wrkQty;
  @override
  @JsonKey()
  final dynamic cbxQty;
  @override
  @JsonKey()
  final dynamic setQty;
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
  final dynamic mboxExcluded;
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
    return 'SubBodyItem(scanNo: $scanNo, scanSeq: $scanSeq, dTagNo: $dTagNo, syncYn: $syncYn, remark: $remark, chkDtm: $chkDtm, pitmNm: $pitmNm, cbxMaNo: $cbxMaNo, itemNm: $itemNm, wrkRemark: $wrkRemark, dScanNo: $dScanNo, pjtNm2: $pjtNm2, wrkNo: $wrkNo, cbxMaSeq: $cbxMaSeq, cbxSuNo: $cbxSuNo, cbxSuNm: $cbxSuNm, cbxSuSeq: $cbxSuSeq, sboxSpec: $sboxSpec, wrkCfmYn: $wrkCfmYn, setCbxQty: $setCbxQty, wrkCfmDttm: $wrkCfmDttm, itemCd: $itemCd, tagNo: $tagNo, scanYn: $scanYn, pitmCd: $pitmCd, wrkQty: $wrkQty, cbxQty: $cbxQty, setQty: $setQty, wrkQtySync: $wrkQtySync, dWrkQty: $dWrkQty, pdtNo: $pdtNo, qtyUnit: $qtyUnit, mboxExcluded: $mboxExcluded, itemNmNonKit: $itemNmNonKit, wksNo: $wksNo, ncbxRmk: $ncbxRmk)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubBodyItemImpl &&
            const DeepCollectionEquality().equals(other.scanNo, scanNo) &&
            const DeepCollectionEquality().equals(other.scanSeq, scanSeq) &&
            const DeepCollectionEquality().equals(other.dTagNo, dTagNo) &&
            const DeepCollectionEquality().equals(other.syncYn, syncYn) &&
            const DeepCollectionEquality().equals(other.remark, remark) &&
            (identical(other.chkDtm, chkDtm) || other.chkDtm == chkDtm) &&
            const DeepCollectionEquality().equals(other.pitmNm, pitmNm) &&
            const DeepCollectionEquality().equals(other.cbxMaNo, cbxMaNo) &&
            const DeepCollectionEquality().equals(other.itemNm, itemNm) &&
            const DeepCollectionEquality().equals(other.wrkRemark, wrkRemark) &&
            const DeepCollectionEquality().equals(other.dScanNo, dScanNo) &&
            const DeepCollectionEquality().equals(other.pjtNm2, pjtNm2) &&
            const DeepCollectionEquality().equals(other.wrkNo, wrkNo) &&
            const DeepCollectionEquality().equals(other.cbxMaSeq, cbxMaSeq) &&
            const DeepCollectionEquality().equals(other.cbxSuNo, cbxSuNo) &&
            const DeepCollectionEquality().equals(other.cbxSuNm, cbxSuNm) &&
            const DeepCollectionEquality().equals(other.cbxSuSeq, cbxSuSeq) &&
            const DeepCollectionEquality().equals(other.sboxSpec, sboxSpec) &&
            const DeepCollectionEquality().equals(other.wrkCfmYn, wrkCfmYn) &&
            const DeepCollectionEquality().equals(other.setCbxQty, setCbxQty) &&
            (identical(other.wrkCfmDttm, wrkCfmDttm) ||
                other.wrkCfmDttm == wrkCfmDttm) &&
            const DeepCollectionEquality().equals(other.itemCd, itemCd) &&
            const DeepCollectionEquality().equals(other.tagNo, tagNo) &&
            const DeepCollectionEquality().equals(other.scanYn, scanYn) &&
            const DeepCollectionEquality().equals(other.pitmCd, pitmCd) &&
            const DeepCollectionEquality().equals(other.wrkQty, wrkQty) &&
            const DeepCollectionEquality().equals(other.cbxQty, cbxQty) &&
            const DeepCollectionEquality().equals(other.setQty, setQty) &&
            const DeepCollectionEquality()
                .equals(other.wrkQtySync, wrkQtySync) &&
            const DeepCollectionEquality().equals(other.dWrkQty, dWrkQty) &&
            const DeepCollectionEquality().equals(other.pdtNo, pdtNo) &&
            const DeepCollectionEquality().equals(other.qtyUnit, qtyUnit) &&
            const DeepCollectionEquality()
                .equals(other.mboxExcluded, mboxExcluded) &&
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
        const DeepCollectionEquality().hash(scanSeq),
        const DeepCollectionEquality().hash(dTagNo),
        const DeepCollectionEquality().hash(syncYn),
        const DeepCollectionEquality().hash(remark),
        chkDtm,
        const DeepCollectionEquality().hash(pitmNm),
        const DeepCollectionEquality().hash(cbxMaNo),
        const DeepCollectionEquality().hash(itemNm),
        const DeepCollectionEquality().hash(wrkRemark),
        const DeepCollectionEquality().hash(dScanNo),
        const DeepCollectionEquality().hash(pjtNm2),
        const DeepCollectionEquality().hash(wrkNo),
        const DeepCollectionEquality().hash(cbxMaSeq),
        const DeepCollectionEquality().hash(cbxSuNo),
        const DeepCollectionEquality().hash(cbxSuNm),
        const DeepCollectionEquality().hash(cbxSuSeq),
        const DeepCollectionEquality().hash(sboxSpec),
        const DeepCollectionEquality().hash(wrkCfmYn),
        const DeepCollectionEquality().hash(setCbxQty),
        wrkCfmDttm,
        const DeepCollectionEquality().hash(itemCd),
        const DeepCollectionEquality().hash(tagNo),
        const DeepCollectionEquality().hash(scanYn),
        const DeepCollectionEquality().hash(pitmCd),
        const DeepCollectionEquality().hash(wrkQty),
        const DeepCollectionEquality().hash(cbxQty),
        const DeepCollectionEquality().hash(setQty),
        const DeepCollectionEquality().hash(wrkQtySync),
        const DeepCollectionEquality().hash(dWrkQty),
        const DeepCollectionEquality().hash(pdtNo),
        const DeepCollectionEquality().hash(qtyUnit),
        const DeepCollectionEquality().hash(mboxExcluded),
        const DeepCollectionEquality().hash(itemNmNonKit),
        const DeepCollectionEquality().hash(wksNo),
        const DeepCollectionEquality().hash(ncbxRmk)
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
      {final dynamic scanNo,
      final dynamic scanSeq,
      final dynamic dTagNo,
      final dynamic syncYn,
      final dynamic remark,
      final DateTime? chkDtm,
      final dynamic pitmNm,
      final dynamic cbxMaNo,
      final dynamic itemNm,
      final dynamic wrkRemark,
      final dynamic dScanNo,
      final dynamic pjtNm2,
      final dynamic wrkNo,
      final dynamic cbxMaSeq,
      final dynamic cbxSuNo,
      final dynamic cbxSuNm,
      final dynamic cbxSuSeq,
      final dynamic sboxSpec,
      final dynamic wrkCfmYn,
      final dynamic setCbxQty,
      final DateTime? wrkCfmDttm,
      final dynamic itemCd,
      final dynamic tagNo,
      final dynamic scanYn,
      final dynamic pitmCd,
      final dynamic wrkQty,
      final dynamic cbxQty,
      final dynamic setQty,
      final dynamic wrkQtySync,
      final dynamic dWrkQty,
      final dynamic pdtNo,
      final dynamic qtyUnit,
      final dynamic mboxExcluded,
      final dynamic itemNmNonKit,
      final dynamic wksNo,
      final dynamic ncbxRmk}) = _$SubBodyItemImpl;

  factory _SubBodyItem.fromJson(Map<String, dynamic> json) =
      _$SubBodyItemImpl.fromJson;

  @override
  dynamic get scanNo;
  @override
  dynamic get scanSeq;
  @override
  dynamic get dTagNo;
  @override
  dynamic get syncYn;
  @override
  dynamic get remark;
  @override
  DateTime? get chkDtm;
  @override
  dynamic get pitmNm;
  @override
  dynamic get cbxMaNo;
  @override
  dynamic get itemNm;
  @override
  dynamic get wrkRemark;
  @override
  dynamic get dScanNo;
  @override
  dynamic get pjtNm2;
  @override
  dynamic get wrkNo;
  @override
  dynamic get cbxMaSeq;
  @override
  dynamic get cbxSuNo;
  @override
  dynamic get cbxSuNm;
  @override
  dynamic get cbxSuSeq;
  @override
  dynamic get sboxSpec;
  @override
  dynamic get wrkCfmYn;
  @override
  dynamic get setCbxQty;
  @override
  DateTime? get wrkCfmDttm;
  @override
  dynamic get itemCd;
  @override
  dynamic get tagNo;
  @override
  dynamic get scanYn;
  @override
  dynamic get pitmCd;
  @override
  dynamic get wrkQty;
  @override
  dynamic get cbxQty;
  @override
  dynamic get setQty;
  @override
  dynamic get wrkQtySync;
  @override
  dynamic get dWrkQty;
  @override
  dynamic get pdtNo;
  @override
  dynamic get qtyUnit;
  @override
  dynamic get mboxExcluded;
  @override
  dynamic get itemNmNonKit;
  @override
  dynamic get wksNo;
  @override
  dynamic get ncbxRmk;
  @override
  @JsonKey(ignore: true)
  _$$SubBodyItemImplCopyWith<_$SubBodyItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
