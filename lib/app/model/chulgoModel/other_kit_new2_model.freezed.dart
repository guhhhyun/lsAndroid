// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'other_kit_new2_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OtherKitNew2Model _$OtherKitNew2ModelFromJson(Map<String, dynamic> json) {
  return _OtherKitNew2Model.fromJson(json);
}

/// @nodoc
mixin _$OtherKitNew2Model {
  Header? get header => throw _privateConstructorUsedError;
  String get resultCode => throw _privateConstructorUsedError;
  String get resultMessage => throw _privateConstructorUsedError;
  List<dynamic>? get body => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OtherKitNew2ModelCopyWith<OtherKitNew2Model> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtherKitNew2ModelCopyWith<$Res> {
  factory $OtherKitNew2ModelCopyWith(
          OtherKitNew2Model value, $Res Function(OtherKitNew2Model) then) =
      _$OtherKitNew2ModelCopyWithImpl<$Res, OtherKitNew2Model>;
  @useResult
  $Res call(
      {Header? header,
      String resultCode,
      String resultMessage,
      List<dynamic>? body});

  $HeaderCopyWith<$Res>? get header;
}

/// @nodoc
class _$OtherKitNew2ModelCopyWithImpl<$Res, $Val extends OtherKitNew2Model>
    implements $OtherKitNew2ModelCopyWith<$Res> {
  _$OtherKitNew2ModelCopyWithImpl(this._value, this._then);

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
abstract class _$$OtherKitNew2ModelImplCopyWith<$Res>
    implements $OtherKitNew2ModelCopyWith<$Res> {
  factory _$$OtherKitNew2ModelImplCopyWith(_$OtherKitNew2ModelImpl value,
          $Res Function(_$OtherKitNew2ModelImpl) then) =
      __$$OtherKitNew2ModelImplCopyWithImpl<$Res>;
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
class __$$OtherKitNew2ModelImplCopyWithImpl<$Res>
    extends _$OtherKitNew2ModelCopyWithImpl<$Res, _$OtherKitNew2ModelImpl>
    implements _$$OtherKitNew2ModelImplCopyWith<$Res> {
  __$$OtherKitNew2ModelImplCopyWithImpl(_$OtherKitNew2ModelImpl _value,
      $Res Function(_$OtherKitNew2ModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? header = freezed,
    Object? resultCode = null,
    Object? resultMessage = null,
    Object? body = freezed,
  }) {
    return _then(_$OtherKitNew2ModelImpl(
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
class _$OtherKitNew2ModelImpl implements _OtherKitNew2Model {
  const _$OtherKitNew2ModelImpl(
      {this.header,
      this.resultCode = '',
      this.resultMessage = '',
      final List<dynamic>? body})
      : _body = body;

  factory _$OtherKitNew2ModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OtherKitNew2ModelImplFromJson(json);

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
    return 'OtherKitNew2Model(header: $header, resultCode: $resultCode, resultMessage: $resultMessage, body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtherKitNew2ModelImpl &&
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
  _$$OtherKitNew2ModelImplCopyWith<_$OtherKitNew2ModelImpl> get copyWith =>
      __$$OtherKitNew2ModelImplCopyWithImpl<_$OtherKitNew2ModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OtherKitNew2ModelImplToJson(
      this,
    );
  }
}

abstract class _OtherKitNew2Model implements OtherKitNew2Model {
  const factory _OtherKitNew2Model(
      {final Header? header,
      final String resultCode,
      final String resultMessage,
      final List<dynamic>? body}) = _$OtherKitNew2ModelImpl;

  factory _OtherKitNew2Model.fromJson(Map<String, dynamic> json) =
      _$OtherKitNew2ModelImpl.fromJson;

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
  _$$OtherKitNew2ModelImplCopyWith<_$OtherKitNew2ModelImpl> get copyWith =>
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
  String get pitmNm => throw _privateConstructorUsedError;
  String get cbxMaNo => throw _privateConstructorUsedError;
  String get itemNm => throw _privateConstructorUsedError;
  int get splitSeq => throw _privateConstructorUsedError;
  String get wrkRemark => throw _privateConstructorUsedError;
  String get pjtNm2 => throw _privateConstructorUsedError;
  String get wrkNo => throw _privateConstructorUsedError;
  String get splitNo => throw _privateConstructorUsedError;
  String get cbxExNo => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get cbxExNm => throw _privateConstructorUsedError;
  double get bomQty => throw _privateConstructorUsedError;
  int get cbxSuSeq => throw _privateConstructorUsedError;
  String get sboxSpec => throw _privateConstructorUsedError;
  String get wrkCfmYn => throw _privateConstructorUsedError;
  double get setCbxQty => throw _privateConstructorUsedError;
  String get wrkCfmDttm => throw _privateConstructorUsedError;
  String get tagNo => throw _privateConstructorUsedError;
  String get itemCd => throw _privateConstructorUsedError;
  String get pitmCd => throw _privateConstructorUsedError;
  String get wksNo => throw _privateConstructorUsedError;
  String get qtyUnit => throw _privateConstructorUsedError;
  int get wrkQty => throw _privateConstructorUsedError;
  int get cbxQty => throw _privateConstructorUsedError;
  int get setQty => throw _privateConstructorUsedError;

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
      {String pitmNm,
      String cbxMaNo,
      String itemNm,
      int splitSeq,
      String wrkRemark,
      String pjtNm2,
      String wrkNo,
      String splitNo,
      String cbxExNo,
      int id,
      String cbxExNm,
      double bomQty,
      int cbxSuSeq,
      String sboxSpec,
      String wrkCfmYn,
      double setCbxQty,
      String wrkCfmDttm,
      String tagNo,
      String itemCd,
      String pitmCd,
      String wksNo,
      String qtyUnit,
      int wrkQty,
      int cbxQty,
      int setQty});
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
    Object? pitmNm = null,
    Object? cbxMaNo = null,
    Object? itemNm = null,
    Object? splitSeq = null,
    Object? wrkRemark = null,
    Object? pjtNm2 = null,
    Object? wrkNo = null,
    Object? splitNo = null,
    Object? cbxExNo = null,
    Object? id = null,
    Object? cbxExNm = null,
    Object? bomQty = null,
    Object? cbxSuSeq = null,
    Object? sboxSpec = null,
    Object? wrkCfmYn = null,
    Object? setCbxQty = null,
    Object? wrkCfmDttm = null,
    Object? tagNo = null,
    Object? itemCd = null,
    Object? pitmCd = null,
    Object? wksNo = null,
    Object? qtyUnit = null,
    Object? wrkQty = null,
    Object? cbxQty = null,
    Object? setQty = null,
  }) {
    return _then(_value.copyWith(
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
              as String,
      cbxExNo: null == cbxExNo
          ? _value.cbxExNo
          : cbxExNo // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      cbxExNm: null == cbxExNm
          ? _value.cbxExNm
          : cbxExNm // ignore: cast_nullable_to_non_nullable
              as String,
      bomQty: null == bomQty
          ? _value.bomQty
          : bomQty // ignore: cast_nullable_to_non_nullable
              as double,
      cbxSuSeq: null == cbxSuSeq
          ? _value.cbxSuSeq
          : cbxSuSeq // ignore: cast_nullable_to_non_nullable
              as int,
      sboxSpec: null == sboxSpec
          ? _value.sboxSpec
          : sboxSpec // ignore: cast_nullable_to_non_nullable
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
      pitmCd: null == pitmCd
          ? _value.pitmCd
          : pitmCd // ignore: cast_nullable_to_non_nullable
              as String,
      wksNo: null == wksNo
          ? _value.wksNo
          : wksNo // ignore: cast_nullable_to_non_nullable
              as String,
      qtyUnit: null == qtyUnit
          ? _value.qtyUnit
          : qtyUnit // ignore: cast_nullable_to_non_nullable
              as String,
      wrkQty: null == wrkQty
          ? _value.wrkQty
          : wrkQty // ignore: cast_nullable_to_non_nullable
              as int,
      cbxQty: null == cbxQty
          ? _value.cbxQty
          : cbxQty // ignore: cast_nullable_to_non_nullable
              as int,
      setQty: null == setQty
          ? _value.setQty
          : setQty // ignore: cast_nullable_to_non_nullable
              as int,
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
      {String pitmNm,
      String cbxMaNo,
      String itemNm,
      int splitSeq,
      String wrkRemark,
      String pjtNm2,
      String wrkNo,
      String splitNo,
      String cbxExNo,
      int id,
      String cbxExNm,
      double bomQty,
      int cbxSuSeq,
      String sboxSpec,
      String wrkCfmYn,
      double setCbxQty,
      String wrkCfmDttm,
      String tagNo,
      String itemCd,
      String pitmCd,
      String wksNo,
      String qtyUnit,
      int wrkQty,
      int cbxQty,
      int setQty});
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
    Object? pitmNm = null,
    Object? cbxMaNo = null,
    Object? itemNm = null,
    Object? splitSeq = null,
    Object? wrkRemark = null,
    Object? pjtNm2 = null,
    Object? wrkNo = null,
    Object? splitNo = null,
    Object? cbxExNo = null,
    Object? id = null,
    Object? cbxExNm = null,
    Object? bomQty = null,
    Object? cbxSuSeq = null,
    Object? sboxSpec = null,
    Object? wrkCfmYn = null,
    Object? setCbxQty = null,
    Object? wrkCfmDttm = null,
    Object? tagNo = null,
    Object? itemCd = null,
    Object? pitmCd = null,
    Object? wksNo = null,
    Object? qtyUnit = null,
    Object? wrkQty = null,
    Object? cbxQty = null,
    Object? setQty = null,
  }) {
    return _then(_$SubBodyItemImpl(
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
              as String,
      cbxExNo: null == cbxExNo
          ? _value.cbxExNo
          : cbxExNo // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      cbxExNm: null == cbxExNm
          ? _value.cbxExNm
          : cbxExNm // ignore: cast_nullable_to_non_nullable
              as String,
      bomQty: null == bomQty
          ? _value.bomQty
          : bomQty // ignore: cast_nullable_to_non_nullable
              as double,
      cbxSuSeq: null == cbxSuSeq
          ? _value.cbxSuSeq
          : cbxSuSeq // ignore: cast_nullable_to_non_nullable
              as int,
      sboxSpec: null == sboxSpec
          ? _value.sboxSpec
          : sboxSpec // ignore: cast_nullable_to_non_nullable
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
      pitmCd: null == pitmCd
          ? _value.pitmCd
          : pitmCd // ignore: cast_nullable_to_non_nullable
              as String,
      wksNo: null == wksNo
          ? _value.wksNo
          : wksNo // ignore: cast_nullable_to_non_nullable
              as String,
      qtyUnit: null == qtyUnit
          ? _value.qtyUnit
          : qtyUnit // ignore: cast_nullable_to_non_nullable
              as String,
      wrkQty: null == wrkQty
          ? _value.wrkQty
          : wrkQty // ignore: cast_nullable_to_non_nullable
              as int,
      cbxQty: null == cbxQty
          ? _value.cbxQty
          : cbxQty // ignore: cast_nullable_to_non_nullable
              as int,
      setQty: null == setQty
          ? _value.setQty
          : setQty // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubBodyItemImpl implements _SubBodyItem {
  const _$SubBodyItemImpl(
      {this.pitmNm = '',
      this.cbxMaNo = '',
      this.itemNm = '',
      this.splitSeq = 0,
      this.wrkRemark = '',
      this.pjtNm2 = '',
      this.wrkNo = '',
      this.splitNo = '',
      this.cbxExNo = '',
      this.id = 0,
      this.cbxExNm = '',
      this.bomQty = 0.0,
      this.cbxSuSeq = 0,
      this.sboxSpec = '',
      this.wrkCfmYn = '',
      this.setCbxQty = 0.0,
      this.wrkCfmDttm = '',
      this.tagNo = '',
      this.itemCd = '',
      this.pitmCd = '',
      this.wksNo = '',
      this.qtyUnit = '',
      this.wrkQty = 0,
      this.cbxQty = 0,
      this.setQty = 0});

  factory _$SubBodyItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubBodyItemImplFromJson(json);

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
  final String splitNo;
  @override
  @JsonKey()
  final String cbxExNo;
  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String cbxExNm;
  @override
  @JsonKey()
  final double bomQty;
  @override
  @JsonKey()
  final int cbxSuSeq;
  @override
  @JsonKey()
  final String sboxSpec;
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
  final String pitmCd;
  @override
  @JsonKey()
  final String wksNo;
  @override
  @JsonKey()
  final String qtyUnit;
  @override
  @JsonKey()
  final int wrkQty;
  @override
  @JsonKey()
  final int cbxQty;
  @override
  @JsonKey()
  final int setQty;

  @override
  String toString() {
    return 'SubBodyItem(pitmNm: $pitmNm, cbxMaNo: $cbxMaNo, itemNm: $itemNm, splitSeq: $splitSeq, wrkRemark: $wrkRemark, pjtNm2: $pjtNm2, wrkNo: $wrkNo, splitNo: $splitNo, cbxExNo: $cbxExNo, id: $id, cbxExNm: $cbxExNm, bomQty: $bomQty, cbxSuSeq: $cbxSuSeq, sboxSpec: $sboxSpec, wrkCfmYn: $wrkCfmYn, setCbxQty: $setCbxQty, wrkCfmDttm: $wrkCfmDttm, tagNo: $tagNo, itemCd: $itemCd, pitmCd: $pitmCd, wksNo: $wksNo, qtyUnit: $qtyUnit, wrkQty: $wrkQty, cbxQty: $cbxQty, setQty: $setQty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubBodyItemImpl &&
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
            (identical(other.cbxExNo, cbxExNo) || other.cbxExNo == cbxExNo) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.cbxExNm, cbxExNm) || other.cbxExNm == cbxExNm) &&
            (identical(other.bomQty, bomQty) || other.bomQty == bomQty) &&
            (identical(other.cbxSuSeq, cbxSuSeq) ||
                other.cbxSuSeq == cbxSuSeq) &&
            (identical(other.sboxSpec, sboxSpec) ||
                other.sboxSpec == sboxSpec) &&
            (identical(other.wrkCfmYn, wrkCfmYn) ||
                other.wrkCfmYn == wrkCfmYn) &&
            (identical(other.setCbxQty, setCbxQty) ||
                other.setCbxQty == setCbxQty) &&
            (identical(other.wrkCfmDttm, wrkCfmDttm) ||
                other.wrkCfmDttm == wrkCfmDttm) &&
            (identical(other.tagNo, tagNo) || other.tagNo == tagNo) &&
            (identical(other.itemCd, itemCd) || other.itemCd == itemCd) &&
            (identical(other.pitmCd, pitmCd) || other.pitmCd == pitmCd) &&
            (identical(other.wksNo, wksNo) || other.wksNo == wksNo) &&
            (identical(other.qtyUnit, qtyUnit) || other.qtyUnit == qtyUnit) &&
            (identical(other.wrkQty, wrkQty) || other.wrkQty == wrkQty) &&
            (identical(other.cbxQty, cbxQty) || other.cbxQty == cbxQty) &&
            (identical(other.setQty, setQty) || other.setQty == setQty));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        pitmNm,
        cbxMaNo,
        itemNm,
        splitSeq,
        wrkRemark,
        pjtNm2,
        wrkNo,
        splitNo,
        cbxExNo,
        id,
        cbxExNm,
        bomQty,
        cbxSuSeq,
        sboxSpec,
        wrkCfmYn,
        setCbxQty,
        wrkCfmDttm,
        tagNo,
        itemCd,
        pitmCd,
        wksNo,
        qtyUnit,
        wrkQty,
        cbxQty,
        setQty
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
      {final String pitmNm,
      final String cbxMaNo,
      final String itemNm,
      final int splitSeq,
      final String wrkRemark,
      final String pjtNm2,
      final String wrkNo,
      final String splitNo,
      final String cbxExNo,
      final int id,
      final String cbxExNm,
      final double bomQty,
      final int cbxSuSeq,
      final String sboxSpec,
      final String wrkCfmYn,
      final double setCbxQty,
      final String wrkCfmDttm,
      final String tagNo,
      final String itemCd,
      final String pitmCd,
      final String wksNo,
      final String qtyUnit,
      final int wrkQty,
      final int cbxQty,
      final int setQty}) = _$SubBodyItemImpl;

  factory _SubBodyItem.fromJson(Map<String, dynamic> json) =
      _$SubBodyItemImpl.fromJson;

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
  String get splitNo;
  @override
  String get cbxExNo;
  @override
  int get id;
  @override
  String get cbxExNm;
  @override
  double get bomQty;
  @override
  int get cbxSuSeq;
  @override
  String get sboxSpec;
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
  String get pitmCd;
  @override
  String get wksNo;
  @override
  String get qtyUnit;
  @override
  int get wrkQty;
  @override
  int get cbxQty;
  @override
  int get setQty;
  @override
  @JsonKey(ignore: true)
  _$$SubBodyItemImplCopyWith<_$SubBodyItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
