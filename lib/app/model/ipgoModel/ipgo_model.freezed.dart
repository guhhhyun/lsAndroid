// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ipgo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IpgoModel _$IpgoModelFromJson(Map<String, dynamic> json) {
  return _IpgoModel.fromJson(json);
}

/// @nodoc
mixin _$IpgoModel {
  Header? get header => throw _privateConstructorUsedError;
  String get resultCode => throw _privateConstructorUsedError;
  String get resultMessage => throw _privateConstructorUsedError;
  List<dynamic>? get body => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IpgoModelCopyWith<IpgoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IpgoModelCopyWith<$Res> {
  factory $IpgoModelCopyWith(IpgoModel value, $Res Function(IpgoModel) then) =
      _$IpgoModelCopyWithImpl<$Res, IpgoModel>;
  @useResult
  $Res call(
      {Header? header,
      String resultCode,
      String resultMessage,
      List<dynamic>? body});

  $HeaderCopyWith<$Res>? get header;
}

/// @nodoc
class _$IpgoModelCopyWithImpl<$Res, $Val extends IpgoModel>
    implements $IpgoModelCopyWith<$Res> {
  _$IpgoModelCopyWithImpl(this._value, this._then);

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
abstract class _$$IpgoModelImplCopyWith<$Res>
    implements $IpgoModelCopyWith<$Res> {
  factory _$$IpgoModelImplCopyWith(
          _$IpgoModelImpl value, $Res Function(_$IpgoModelImpl) then) =
      __$$IpgoModelImplCopyWithImpl<$Res>;
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
class __$$IpgoModelImplCopyWithImpl<$Res>
    extends _$IpgoModelCopyWithImpl<$Res, _$IpgoModelImpl>
    implements _$$IpgoModelImplCopyWith<$Res> {
  __$$IpgoModelImplCopyWithImpl(
      _$IpgoModelImpl _value, $Res Function(_$IpgoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? header = freezed,
    Object? resultCode = null,
    Object? resultMessage = null,
    Object? body = freezed,
  }) {
    return _then(_$IpgoModelImpl(
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
class _$IpgoModelImpl implements _IpgoModel {
  const _$IpgoModelImpl(
      {this.header,
      this.resultCode = 'false',
      this.resultMessage = '',
      final List<dynamic>? body})
      : _body = body;

  factory _$IpgoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$IpgoModelImplFromJson(json);

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
    return 'IpgoModel(header: $header, resultCode: $resultCode, resultMessage: $resultMessage, body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IpgoModelImpl &&
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
  _$$IpgoModelImplCopyWith<_$IpgoModelImpl> get copyWith =>
      __$$IpgoModelImplCopyWithImpl<_$IpgoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IpgoModelImplToJson(
      this,
    );
  }
}

abstract class _IpgoModel implements IpgoModel {
  const factory _IpgoModel(
      {final Header? header,
      final String resultCode,
      final String resultMessage,
      final List<dynamic>? body}) = _$IpgoModelImpl;

  factory _IpgoModel.fromJson(Map<String, dynamic> json) =
      _$IpgoModelImpl.fromJson;

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
  _$$IpgoModelImplCopyWith<_$IpgoModelImpl> get copyWith =>
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
      orders: freezed == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as dynamic,
      chnlCd: freezed == chnlCd
          ? _value.chnlCd
          : chnlCd // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
      this.orders,
      this.chnlCd});

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
  final dynamic orders;
  @override
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

BodyItem1 _$BodyItem1FromJson(Map<String, dynamic> json) {
  return _BodyItem1.fromJson(json);
}

/// @nodoc
mixin _$BodyItem1 {
  List<BodyItem>? get body => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BodyItem1CopyWith<BodyItem1> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BodyItem1CopyWith<$Res> {
  factory $BodyItem1CopyWith(BodyItem1 value, $Res Function(BodyItem1) then) =
      _$BodyItem1CopyWithImpl<$Res, BodyItem1>;
  @useResult
  $Res call({List<BodyItem>? body});
}

/// @nodoc
class _$BodyItem1CopyWithImpl<$Res, $Val extends BodyItem1>
    implements $BodyItem1CopyWith<$Res> {
  _$BodyItem1CopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = freezed,
  }) {
    return _then(_value.copyWith(
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as List<BodyItem>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BodyItem1ImplCopyWith<$Res>
    implements $BodyItem1CopyWith<$Res> {
  factory _$$BodyItem1ImplCopyWith(
          _$BodyItem1Impl value, $Res Function(_$BodyItem1Impl) then) =
      __$$BodyItem1ImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<BodyItem>? body});
}

/// @nodoc
class __$$BodyItem1ImplCopyWithImpl<$Res>
    extends _$BodyItem1CopyWithImpl<$Res, _$BodyItem1Impl>
    implements _$$BodyItem1ImplCopyWith<$Res> {
  __$$BodyItem1ImplCopyWithImpl(
      _$BodyItem1Impl _value, $Res Function(_$BodyItem1Impl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = freezed,
  }) {
    return _then(_$BodyItem1Impl(
      body: freezed == body
          ? _value._body
          : body // ignore: cast_nullable_to_non_nullable
              as List<BodyItem>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BodyItem1Impl implements _BodyItem1 {
  const _$BodyItem1Impl({final List<BodyItem>? body}) : _body = body;

  factory _$BodyItem1Impl.fromJson(Map<String, dynamic> json) =>
      _$$BodyItem1ImplFromJson(json);

  final List<BodyItem>? _body;
  @override
  List<BodyItem>? get body {
    final value = _body;
    if (value == null) return null;
    if (_body is EqualUnmodifiableListView) return _body;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'BodyItem1(body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BodyItem1Impl &&
            const DeepCollectionEquality().equals(other._body, _body));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_body));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BodyItem1ImplCopyWith<_$BodyItem1Impl> get copyWith =>
      __$$BodyItem1ImplCopyWithImpl<_$BodyItem1Impl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BodyItem1ImplToJson(
      this,
    );
  }
}

abstract class _BodyItem1 implements BodyItem1 {
  const factory _BodyItem1({final List<BodyItem>? body}) = _$BodyItem1Impl;

  factory _BodyItem1.fromJson(Map<String, dynamic> json) =
      _$BodyItem1Impl.fromJson;

  @override
  List<BodyItem>? get body;
  @override
  @JsonKey(ignore: true)
  _$$BodyItem1ImplCopyWith<_$BodyItem1Impl> get copyWith =>
      throw _privateConstructorUsedError;
}

BodyItem _$BodyItemFromJson(Map<String, dynamic> json) {
  return _BodyItem.fromJson(json);
}

/// @nodoc
mixin _$BodyItem {
  int get no => throw _privateConstructorUsedError;
  int get doc1Rowspan => throw _privateConstructorUsedError;
  int get doc1Seq => throw _privateConstructorUsedError;
  String get pjtNm => throw _privateConstructorUsedError;
  String get grpKey => throw _privateConstructorUsedError;
  dynamic get pjtNo => throw _privateConstructorUsedError;
  String get inbType => throw _privateConstructorUsedError;
  dynamic get soNo => throw _privateConstructorUsedError;
  String get itemNm => throw _privateConstructorUsedError;
  int get selectedRowspan => throw _privateConstructorUsedError;
  int get grDtRowspan => throw _privateConstructorUsedError;
  dynamic get sapQtyUnit => throw _privateConstructorUsedError;
  dynamic get pjtNm2 => throw _privateConstructorUsedError;
  int get vendNmRowspan => throw _privateConstructorUsedError;
  dynamic get doc2 => throw _privateConstructorUsedError;
  int get noRowspan => throw _privateConstructorUsedError;
  String get doc1 => throw _privateConstructorUsedError;
  dynamic get rmnQty => throw _privateConstructorUsedError;
  String get vendNm => throw _privateConstructorUsedError;
  int get pjtNmRowspan => throw _privateConstructorUsedError;
  bool get selected => throw _privateConstructorUsedError;
  dynamic get wmsQty => throw _privateConstructorUsedError;
  dynamic get doc2Seq => throw _privateConstructorUsedError;
  String get whCd => throw _privateConstructorUsedError;
  dynamic get pkNo => throw _privateConstructorUsedError;
  String get grDt => throw _privateConstructorUsedError;
  String get itemCd => throw _privateConstructorUsedError;
  dynamic get appDttm => throw _privateConstructorUsedError;
  dynamic get lgort => throw _privateConstructorUsedError;
  String get plant => throw _privateConstructorUsedError;
  dynamic get wmsQtyUnit => throw _privateConstructorUsedError;
  dynamic get vendCd => throw _privateConstructorUsedError;
  String get mstKey => throw _privateConstructorUsedError;
  dynamic get sapQty => throw _privateConstructorUsedError;

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
      {int no,
      int doc1Rowspan,
      int doc1Seq,
      String pjtNm,
      String grpKey,
      dynamic pjtNo,
      String inbType,
      dynamic soNo,
      String itemNm,
      int selectedRowspan,
      int grDtRowspan,
      dynamic sapQtyUnit,
      dynamic pjtNm2,
      int vendNmRowspan,
      dynamic doc2,
      int noRowspan,
      String doc1,
      dynamic rmnQty,
      String vendNm,
      int pjtNmRowspan,
      bool selected,
      dynamic wmsQty,
      dynamic doc2Seq,
      String whCd,
      dynamic pkNo,
      String grDt,
      String itemCd,
      dynamic appDttm,
      dynamic lgort,
      String plant,
      dynamic wmsQtyUnit,
      dynamic vendCd,
      String mstKey,
      dynamic sapQty});
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
    Object? no = null,
    Object? doc1Rowspan = null,
    Object? doc1Seq = null,
    Object? pjtNm = null,
    Object? grpKey = null,
    Object? pjtNo = freezed,
    Object? inbType = null,
    Object? soNo = freezed,
    Object? itemNm = null,
    Object? selectedRowspan = null,
    Object? grDtRowspan = null,
    Object? sapQtyUnit = freezed,
    Object? pjtNm2 = freezed,
    Object? vendNmRowspan = null,
    Object? doc2 = freezed,
    Object? noRowspan = null,
    Object? doc1 = null,
    Object? rmnQty = freezed,
    Object? vendNm = null,
    Object? pjtNmRowspan = null,
    Object? selected = null,
    Object? wmsQty = freezed,
    Object? doc2Seq = freezed,
    Object? whCd = null,
    Object? pkNo = freezed,
    Object? grDt = null,
    Object? itemCd = null,
    Object? appDttm = freezed,
    Object? lgort = freezed,
    Object? plant = null,
    Object? wmsQtyUnit = freezed,
    Object? vendCd = freezed,
    Object? mstKey = null,
    Object? sapQty = freezed,
  }) {
    return _then(_value.copyWith(
      no: null == no
          ? _value.no
          : no // ignore: cast_nullable_to_non_nullable
              as int,
      doc1Rowspan: null == doc1Rowspan
          ? _value.doc1Rowspan
          : doc1Rowspan // ignore: cast_nullable_to_non_nullable
              as int,
      doc1Seq: null == doc1Seq
          ? _value.doc1Seq
          : doc1Seq // ignore: cast_nullable_to_non_nullable
              as int,
      pjtNm: null == pjtNm
          ? _value.pjtNm
          : pjtNm // ignore: cast_nullable_to_non_nullable
              as String,
      grpKey: null == grpKey
          ? _value.grpKey
          : grpKey // ignore: cast_nullable_to_non_nullable
              as String,
      pjtNo: freezed == pjtNo
          ? _value.pjtNo
          : pjtNo // ignore: cast_nullable_to_non_nullable
              as dynamic,
      inbType: null == inbType
          ? _value.inbType
          : inbType // ignore: cast_nullable_to_non_nullable
              as String,
      soNo: freezed == soNo
          ? _value.soNo
          : soNo // ignore: cast_nullable_to_non_nullable
              as dynamic,
      itemNm: null == itemNm
          ? _value.itemNm
          : itemNm // ignore: cast_nullable_to_non_nullable
              as String,
      selectedRowspan: null == selectedRowspan
          ? _value.selectedRowspan
          : selectedRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      grDtRowspan: null == grDtRowspan
          ? _value.grDtRowspan
          : grDtRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      sapQtyUnit: freezed == sapQtyUnit
          ? _value.sapQtyUnit
          : sapQtyUnit // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pjtNm2: freezed == pjtNm2
          ? _value.pjtNm2
          : pjtNm2 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      vendNmRowspan: null == vendNmRowspan
          ? _value.vendNmRowspan
          : vendNmRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      doc2: freezed == doc2
          ? _value.doc2
          : doc2 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      noRowspan: null == noRowspan
          ? _value.noRowspan
          : noRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      doc1: null == doc1
          ? _value.doc1
          : doc1 // ignore: cast_nullable_to_non_nullable
              as String,
      rmnQty: freezed == rmnQty
          ? _value.rmnQty
          : rmnQty // ignore: cast_nullable_to_non_nullable
              as dynamic,
      vendNm: null == vendNm
          ? _value.vendNm
          : vendNm // ignore: cast_nullable_to_non_nullable
              as String,
      pjtNmRowspan: null == pjtNmRowspan
          ? _value.pjtNmRowspan
          : pjtNmRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
      wmsQty: freezed == wmsQty
          ? _value.wmsQty
          : wmsQty // ignore: cast_nullable_to_non_nullable
              as dynamic,
      doc2Seq: freezed == doc2Seq
          ? _value.doc2Seq
          : doc2Seq // ignore: cast_nullable_to_non_nullable
              as dynamic,
      whCd: null == whCd
          ? _value.whCd
          : whCd // ignore: cast_nullable_to_non_nullable
              as String,
      pkNo: freezed == pkNo
          ? _value.pkNo
          : pkNo // ignore: cast_nullable_to_non_nullable
              as dynamic,
      grDt: null == grDt
          ? _value.grDt
          : grDt // ignore: cast_nullable_to_non_nullable
              as String,
      itemCd: null == itemCd
          ? _value.itemCd
          : itemCd // ignore: cast_nullable_to_non_nullable
              as String,
      appDttm: freezed == appDttm
          ? _value.appDttm
          : appDttm // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lgort: freezed == lgort
          ? _value.lgort
          : lgort // ignore: cast_nullable_to_non_nullable
              as dynamic,
      plant: null == plant
          ? _value.plant
          : plant // ignore: cast_nullable_to_non_nullable
              as String,
      wmsQtyUnit: freezed == wmsQtyUnit
          ? _value.wmsQtyUnit
          : wmsQtyUnit // ignore: cast_nullable_to_non_nullable
              as dynamic,
      vendCd: freezed == vendCd
          ? _value.vendCd
          : vendCd // ignore: cast_nullable_to_non_nullable
              as dynamic,
      mstKey: null == mstKey
          ? _value.mstKey
          : mstKey // ignore: cast_nullable_to_non_nullable
              as String,
      sapQty: freezed == sapQty
          ? _value.sapQty
          : sapQty // ignore: cast_nullable_to_non_nullable
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
      {int no,
      int doc1Rowspan,
      int doc1Seq,
      String pjtNm,
      String grpKey,
      dynamic pjtNo,
      String inbType,
      dynamic soNo,
      String itemNm,
      int selectedRowspan,
      int grDtRowspan,
      dynamic sapQtyUnit,
      dynamic pjtNm2,
      int vendNmRowspan,
      dynamic doc2,
      int noRowspan,
      String doc1,
      dynamic rmnQty,
      String vendNm,
      int pjtNmRowspan,
      bool selected,
      dynamic wmsQty,
      dynamic doc2Seq,
      String whCd,
      dynamic pkNo,
      String grDt,
      String itemCd,
      dynamic appDttm,
      dynamic lgort,
      String plant,
      dynamic wmsQtyUnit,
      dynamic vendCd,
      String mstKey,
      dynamic sapQty});
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
    Object? no = null,
    Object? doc1Rowspan = null,
    Object? doc1Seq = null,
    Object? pjtNm = null,
    Object? grpKey = null,
    Object? pjtNo = freezed,
    Object? inbType = null,
    Object? soNo = freezed,
    Object? itemNm = null,
    Object? selectedRowspan = null,
    Object? grDtRowspan = null,
    Object? sapQtyUnit = freezed,
    Object? pjtNm2 = freezed,
    Object? vendNmRowspan = null,
    Object? doc2 = freezed,
    Object? noRowspan = null,
    Object? doc1 = null,
    Object? rmnQty = freezed,
    Object? vendNm = null,
    Object? pjtNmRowspan = null,
    Object? selected = null,
    Object? wmsQty = freezed,
    Object? doc2Seq = freezed,
    Object? whCd = null,
    Object? pkNo = freezed,
    Object? grDt = null,
    Object? itemCd = null,
    Object? appDttm = freezed,
    Object? lgort = freezed,
    Object? plant = null,
    Object? wmsQtyUnit = freezed,
    Object? vendCd = freezed,
    Object? mstKey = null,
    Object? sapQty = freezed,
  }) {
    return _then(_$BodyItemImpl(
      no: null == no
          ? _value.no
          : no // ignore: cast_nullable_to_non_nullable
              as int,
      doc1Rowspan: null == doc1Rowspan
          ? _value.doc1Rowspan
          : doc1Rowspan // ignore: cast_nullable_to_non_nullable
              as int,
      doc1Seq: null == doc1Seq
          ? _value.doc1Seq
          : doc1Seq // ignore: cast_nullable_to_non_nullable
              as int,
      pjtNm: null == pjtNm
          ? _value.pjtNm
          : pjtNm // ignore: cast_nullable_to_non_nullable
              as String,
      grpKey: null == grpKey
          ? _value.grpKey
          : grpKey // ignore: cast_nullable_to_non_nullable
              as String,
      pjtNo: freezed == pjtNo
          ? _value.pjtNo
          : pjtNo // ignore: cast_nullable_to_non_nullable
              as dynamic,
      inbType: null == inbType
          ? _value.inbType
          : inbType // ignore: cast_nullable_to_non_nullable
              as String,
      soNo: freezed == soNo
          ? _value.soNo
          : soNo // ignore: cast_nullable_to_non_nullable
              as dynamic,
      itemNm: null == itemNm
          ? _value.itemNm
          : itemNm // ignore: cast_nullable_to_non_nullable
              as String,
      selectedRowspan: null == selectedRowspan
          ? _value.selectedRowspan
          : selectedRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      grDtRowspan: null == grDtRowspan
          ? _value.grDtRowspan
          : grDtRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      sapQtyUnit: freezed == sapQtyUnit ? _value.sapQtyUnit! : sapQtyUnit,
      pjtNm2: freezed == pjtNm2
          ? _value.pjtNm2
          : pjtNm2 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      vendNmRowspan: null == vendNmRowspan
          ? _value.vendNmRowspan
          : vendNmRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      doc2: freezed == doc2
          ? _value.doc2
          : doc2 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      noRowspan: null == noRowspan
          ? _value.noRowspan
          : noRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      doc1: null == doc1
          ? _value.doc1
          : doc1 // ignore: cast_nullable_to_non_nullable
              as String,
      rmnQty: freezed == rmnQty ? _value.rmnQty! : rmnQty,
      vendNm: null == vendNm
          ? _value.vendNm
          : vendNm // ignore: cast_nullable_to_non_nullable
              as String,
      pjtNmRowspan: null == pjtNmRowspan
          ? _value.pjtNmRowspan
          : pjtNmRowspan // ignore: cast_nullable_to_non_nullable
              as int,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
      wmsQty: freezed == wmsQty ? _value.wmsQty! : wmsQty,
      doc2Seq: freezed == doc2Seq
          ? _value.doc2Seq
          : doc2Seq // ignore: cast_nullable_to_non_nullable
              as dynamic,
      whCd: null == whCd
          ? _value.whCd
          : whCd // ignore: cast_nullable_to_non_nullable
              as String,
      pkNo: freezed == pkNo
          ? _value.pkNo
          : pkNo // ignore: cast_nullable_to_non_nullable
              as dynamic,
      grDt: null == grDt
          ? _value.grDt
          : grDt // ignore: cast_nullable_to_non_nullable
              as String,
      itemCd: null == itemCd
          ? _value.itemCd
          : itemCd // ignore: cast_nullable_to_non_nullable
              as String,
      appDttm: freezed == appDttm
          ? _value.appDttm
          : appDttm // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lgort: freezed == lgort
          ? _value.lgort
          : lgort // ignore: cast_nullable_to_non_nullable
              as dynamic,
      plant: null == plant
          ? _value.plant
          : plant // ignore: cast_nullable_to_non_nullable
              as String,
      wmsQtyUnit: freezed == wmsQtyUnit
          ? _value.wmsQtyUnit
          : wmsQtyUnit // ignore: cast_nullable_to_non_nullable
              as dynamic,
      vendCd: freezed == vendCd
          ? _value.vendCd
          : vendCd // ignore: cast_nullable_to_non_nullable
              as dynamic,
      mstKey: null == mstKey
          ? _value.mstKey
          : mstKey // ignore: cast_nullable_to_non_nullable
              as String,
      sapQty: freezed == sapQty ? _value.sapQty! : sapQty,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BodyItemImpl implements _BodyItem {
  const _$BodyItemImpl(
      {this.no = 0,
      this.doc1Rowspan = 0,
      this.doc1Seq = 0,
      this.pjtNm = '',
      this.grpKey = '',
      this.pjtNo,
      this.inbType = '',
      this.soNo,
      this.itemNm = '',
      this.selectedRowspan = 0,
      this.grDtRowspan = 0,
      this.sapQtyUnit = '',
      this.pjtNm2,
      this.vendNmRowspan = 0,
      this.doc2,
      this.noRowspan = 0,
      this.doc1 = '',
      this.rmnQty = 0.0,
      this.vendNm = '',
      this.pjtNmRowspan = 0,
      this.selected = false,
      this.wmsQty = 0.0,
      this.doc2Seq,
      this.whCd = '',
      this.pkNo,
      this.grDt = '',
      this.itemCd = '',
      this.appDttm,
      this.lgort,
      this.plant = '',
      this.wmsQtyUnit,
      this.vendCd,
      this.mstKey = '',
      this.sapQty = 0.0});

  factory _$BodyItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$BodyItemImplFromJson(json);

  @override
  @JsonKey()
  final int no;
  @override
  @JsonKey()
  final int doc1Rowspan;
  @override
  @JsonKey()
  final int doc1Seq;
  @override
  @JsonKey()
  final String pjtNm;
  @override
  @JsonKey()
  final String grpKey;
  @override
  final dynamic pjtNo;
  @override
  @JsonKey()
  final String inbType;
  @override
  final dynamic soNo;
  @override
  @JsonKey()
  final String itemNm;
  @override
  @JsonKey()
  final int selectedRowspan;
  @override
  @JsonKey()
  final int grDtRowspan;
  @override
  @JsonKey()
  final dynamic sapQtyUnit;
  @override
  final dynamic pjtNm2;
  @override
  @JsonKey()
  final int vendNmRowspan;
  @override
  final dynamic doc2;
  @override
  @JsonKey()
  final int noRowspan;
  @override
  @JsonKey()
  final String doc1;
  @override
  @JsonKey()
  final dynamic rmnQty;
  @override
  @JsonKey()
  final String vendNm;
  @override
  @JsonKey()
  final int pjtNmRowspan;
  @override
  @JsonKey()
  final bool selected;
  @override
  @JsonKey()
  final dynamic wmsQty;
  @override
  final dynamic doc2Seq;
  @override
  @JsonKey()
  final String whCd;
  @override
  final dynamic pkNo;
  @override
  @JsonKey()
  final String grDt;
  @override
  @JsonKey()
  final String itemCd;
  @override
  final dynamic appDttm;
  @override
  final dynamic lgort;
  @override
  @JsonKey()
  final String plant;
  @override
  final dynamic wmsQtyUnit;
  @override
  final dynamic vendCd;
  @override
  @JsonKey()
  final String mstKey;
  @override
  @JsonKey()
  final dynamic sapQty;

  @override
  String toString() {
    return 'BodyItem(no: $no, doc1Rowspan: $doc1Rowspan, doc1Seq: $doc1Seq, pjtNm: $pjtNm, grpKey: $grpKey, pjtNo: $pjtNo, inbType: $inbType, soNo: $soNo, itemNm: $itemNm, selectedRowspan: $selectedRowspan, grDtRowspan: $grDtRowspan, sapQtyUnit: $sapQtyUnit, pjtNm2: $pjtNm2, vendNmRowspan: $vendNmRowspan, doc2: $doc2, noRowspan: $noRowspan, doc1: $doc1, rmnQty: $rmnQty, vendNm: $vendNm, pjtNmRowspan: $pjtNmRowspan, selected: $selected, wmsQty: $wmsQty, doc2Seq: $doc2Seq, whCd: $whCd, pkNo: $pkNo, grDt: $grDt, itemCd: $itemCd, appDttm: $appDttm, lgort: $lgort, plant: $plant, wmsQtyUnit: $wmsQtyUnit, vendCd: $vendCd, mstKey: $mstKey, sapQty: $sapQty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BodyItemImpl &&
            (identical(other.no, no) || other.no == no) &&
            (identical(other.doc1Rowspan, doc1Rowspan) ||
                other.doc1Rowspan == doc1Rowspan) &&
            (identical(other.doc1Seq, doc1Seq) || other.doc1Seq == doc1Seq) &&
            (identical(other.pjtNm, pjtNm) || other.pjtNm == pjtNm) &&
            (identical(other.grpKey, grpKey) || other.grpKey == grpKey) &&
            const DeepCollectionEquality().equals(other.pjtNo, pjtNo) &&
            (identical(other.inbType, inbType) || other.inbType == inbType) &&
            const DeepCollectionEquality().equals(other.soNo, soNo) &&
            (identical(other.itemNm, itemNm) || other.itemNm == itemNm) &&
            (identical(other.selectedRowspan, selectedRowspan) ||
                other.selectedRowspan == selectedRowspan) &&
            (identical(other.grDtRowspan, grDtRowspan) ||
                other.grDtRowspan == grDtRowspan) &&
            const DeepCollectionEquality()
                .equals(other.sapQtyUnit, sapQtyUnit) &&
            const DeepCollectionEquality().equals(other.pjtNm2, pjtNm2) &&
            (identical(other.vendNmRowspan, vendNmRowspan) ||
                other.vendNmRowspan == vendNmRowspan) &&
            const DeepCollectionEquality().equals(other.doc2, doc2) &&
            (identical(other.noRowspan, noRowspan) ||
                other.noRowspan == noRowspan) &&
            (identical(other.doc1, doc1) || other.doc1 == doc1) &&
            const DeepCollectionEquality().equals(other.rmnQty, rmnQty) &&
            (identical(other.vendNm, vendNm) || other.vendNm == vendNm) &&
            (identical(other.pjtNmRowspan, pjtNmRowspan) ||
                other.pjtNmRowspan == pjtNmRowspan) &&
            (identical(other.selected, selected) ||
                other.selected == selected) &&
            const DeepCollectionEquality().equals(other.wmsQty, wmsQty) &&
            const DeepCollectionEquality().equals(other.doc2Seq, doc2Seq) &&
            (identical(other.whCd, whCd) || other.whCd == whCd) &&
            const DeepCollectionEquality().equals(other.pkNo, pkNo) &&
            (identical(other.grDt, grDt) || other.grDt == grDt) &&
            (identical(other.itemCd, itemCd) || other.itemCd == itemCd) &&
            const DeepCollectionEquality().equals(other.appDttm, appDttm) &&
            const DeepCollectionEquality().equals(other.lgort, lgort) &&
            (identical(other.plant, plant) || other.plant == plant) &&
            const DeepCollectionEquality()
                .equals(other.wmsQtyUnit, wmsQtyUnit) &&
            const DeepCollectionEquality().equals(other.vendCd, vendCd) &&
            (identical(other.mstKey, mstKey) || other.mstKey == mstKey) &&
            const DeepCollectionEquality().equals(other.sapQty, sapQty));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        no,
        doc1Rowspan,
        doc1Seq,
        pjtNm,
        grpKey,
        const DeepCollectionEquality().hash(pjtNo),
        inbType,
        const DeepCollectionEquality().hash(soNo),
        itemNm,
        selectedRowspan,
        grDtRowspan,
        const DeepCollectionEquality().hash(sapQtyUnit),
        const DeepCollectionEquality().hash(pjtNm2),
        vendNmRowspan,
        const DeepCollectionEquality().hash(doc2),
        noRowspan,
        doc1,
        const DeepCollectionEquality().hash(rmnQty),
        vendNm,
        pjtNmRowspan,
        selected,
        const DeepCollectionEquality().hash(wmsQty),
        const DeepCollectionEquality().hash(doc2Seq),
        whCd,
        const DeepCollectionEquality().hash(pkNo),
        grDt,
        itemCd,
        const DeepCollectionEquality().hash(appDttm),
        const DeepCollectionEquality().hash(lgort),
        plant,
        const DeepCollectionEquality().hash(wmsQtyUnit),
        const DeepCollectionEquality().hash(vendCd),
        mstKey,
        const DeepCollectionEquality().hash(sapQty)
      ]);

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
      {final int no,
      final int doc1Rowspan,
      final int doc1Seq,
      final String pjtNm,
      final String grpKey,
      final dynamic pjtNo,
      final String inbType,
      final dynamic soNo,
      final String itemNm,
      final int selectedRowspan,
      final int grDtRowspan,
      final dynamic sapQtyUnit,
      final dynamic pjtNm2,
      final int vendNmRowspan,
      final dynamic doc2,
      final int noRowspan,
      final String doc1,
      final dynamic rmnQty,
      final String vendNm,
      final int pjtNmRowspan,
      final bool selected,
      final dynamic wmsQty,
      final dynamic doc2Seq,
      final String whCd,
      final dynamic pkNo,
      final String grDt,
      final String itemCd,
      final dynamic appDttm,
      final dynamic lgort,
      final String plant,
      final dynamic wmsQtyUnit,
      final dynamic vendCd,
      final String mstKey,
      final dynamic sapQty}) = _$BodyItemImpl;

  factory _BodyItem.fromJson(Map<String, dynamic> json) =
      _$BodyItemImpl.fromJson;

  @override
  int get no;
  @override
  int get doc1Rowspan;
  @override
  int get doc1Seq;
  @override
  String get pjtNm;
  @override
  String get grpKey;
  @override
  dynamic get pjtNo;
  @override
  String get inbType;
  @override
  dynamic get soNo;
  @override
  String get itemNm;
  @override
  int get selectedRowspan;
  @override
  int get grDtRowspan;
  @override
  dynamic get sapQtyUnit;
  @override
  dynamic get pjtNm2;
  @override
  int get vendNmRowspan;
  @override
  dynamic get doc2;
  @override
  int get noRowspan;
  @override
  String get doc1;
  @override
  dynamic get rmnQty;
  @override
  String get vendNm;
  @override
  int get pjtNmRowspan;
  @override
  bool get selected;
  @override
  dynamic get wmsQty;
  @override
  dynamic get doc2Seq;
  @override
  String get whCd;
  @override
  dynamic get pkNo;
  @override
  String get grDt;
  @override
  String get itemCd;
  @override
  dynamic get appDttm;
  @override
  dynamic get lgort;
  @override
  String get plant;
  @override
  dynamic get wmsQtyUnit;
  @override
  dynamic get vendCd;
  @override
  String get mstKey;
  @override
  dynamic get sapQty;
  @override
  @JsonKey(ignore: true)
  _$$BodyItemImplCopyWith<_$BodyItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
