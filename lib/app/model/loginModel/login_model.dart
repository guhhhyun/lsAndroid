import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_model.freezed.dart';
part 'login_model.g.dart';

@freezed
class LoginModel with _$LoginModel {
  const factory LoginModel({
    Header? header,
    @Default('false') String resultCode,
    @Default('') String resultMessage,
    Body? body,
  }) = _LoginModel;

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
}

@freezed
class Header with _$Header {
  const factory Header({
    @Default(0) int currentPage,
    @Default(0) int pageSize,
    @Default(0) int totalRecords,
    dynamic orders, // Optional fields
    dynamic chnlCd, // Optional fields
  }) = _Header;

  factory Header.fromJson(Map<String, dynamic> json) => _$HeaderFromJson(json);
}

@freezed
class Body with _$Body {
  const factory Body({
    @Default('') String resCd,
    @Default(false) bool hasUser,
    @Default('') String userKey,
    @Default('') String duplicationKey,
    @Default('') String userName,
    dynamic orgNm,
    dynamic deptCd,
    @Default('') String deptNm,
    @Default(false) bool resetPassword,
    @Default(0) int loginFailCnt,
    @Default(0) int pwdUnchangedDays,
    @Default(false) bool completed,
    List<Authority?>? authorities,
  }) = _Body;

  factory Body.fromJson(Map<String, dynamic> json) => _$BodyFromJson(json);
}

@freezed
class Authority with _$Authority {
  const factory Authority({
    @Default('') String menuId,
    @Default('') String authority,
    @Default('') String clientAuthority,
    String? programId, // Optional field
  }) = _Authority;

  factory Authority.fromJson(Map<String, dynamic> json) =>
      _$AuthorityFromJson(json);
}