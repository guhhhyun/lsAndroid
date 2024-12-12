import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:lsandroid/app/common/app_const.dart';
import 'package:lsandroid/app/common/global_service.dart';
import 'package:lsandroid/app/common/utils.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lsandroid/app/model/chulModel/chul_model.dart';
import 'package:lsandroid/app/model/chulModel/chul_second_model.dart';
import 'package:lsandroid/app/model/chulModel/chul_third_model.dart';
import 'package:lsandroid/app/model/chulgoModel/other_kit_model.dart';
import 'package:lsandroid/app/model/commonModel/common_model.dart';
import 'package:lsandroid/app/model/commonModel/zone_model.dart';
import 'package:lsandroid/app/model/etcChulgoModel/etc_chulgo_model.dart';
import 'package:lsandroid/app/model/etcChulgoModel/etc_chulgo_second_model.dart';
import 'package:lsandroid/app/model/etcIpgoModel/etc_ipgo_detail_model.dart';
import 'package:lsandroid/app/model/etcIpgoModel/etc_ipgo_model.dart';
import 'package:lsandroid/app/model/etcIpgoModel/etc_ipgo_second_detail_model.dart';
import 'package:lsandroid/app/model/etcIpgoModel/etc_ipgo_second_model.dart';
import 'package:lsandroid/app/model/ipgoModel/ipgo_cancel_model.dart';
import 'package:lsandroid/app/model/ipgoModel/ipgo_cheburn_model.dart';
import 'package:lsandroid/app/model/ipgoModel/ipgo_model.dart';
import 'package:lsandroid/app/model/ipgoModel/ipgo_qr_model.dart';
import 'package:lsandroid/app/model/ipgoModel/ipgo_smallbox_item_model.dart';
import 'package:lsandroid/app/model/ipgoModel/ipgo_smallbox_model.dart';
import 'package:lsandroid/app/model/loginModel/login_model.dart';
import 'package:lsandroid/app/model/mainKitModel/main_kit_model.dart';
import 'package:lsandroid/app/model/pickingModel/picking_first_model.dart';
import 'package:lsandroid/app/model/pickingModel/picking_second_model.dart';
import 'package:lsandroid/app/model/pickingModel/picking_third_model.dart';
import 'package:lsandroid/app/model/rackIpgoModel/rack_ipgo_model.dart';
import 'package:lsandroid/app/model/smallKitModel/small_kit_item_model.dart';
import 'package:lsandroid/app/model/smallKitModel/small_kit_model.dart';
import 'package:lsandroid/app/model/smallKitModel/small_kit_save_model.dart';
import 'package:lsandroid/app/pages/Ipgo/ipgo_controller.dart';
import 'package:lsandroid/app/pages/chulgo/chulgo_controller.dart';
import 'package:lsandroid/app/pages/mainKit/main_kit_controller.dart';
import 'package:lsandroid/app/pages/otherKit/other_kit_controller.dart';
import 'package:lsandroid/app/pages/picking/picking_controller.dart';
import 'package:lsandroid/app/pages/rackIpgo/rack_ipgo_controller.dart';
import 'package:lsandroid/app/pages/smallKit/small_kit_controller.dart';
import 'http_util.dart';
import 'network_manager.dart';
import 'package:http/http.dart' as http;

class HomeApi extends NetworkManager{
  static HomeApi get to => Get.find();



  /// 소박스 BOM 저장
  Future<String> registSmallKitBomSave(var params) async {
    String a = '0000';
    try {
      if (APP_CONST.LOCAL_JSON_MODE) {
      } else {

        final response = await HttpUtil.getDio()
            .post('/api/common/procedure/posts', data: jsonEncode(params),
          options: Options(
            headers: {
              'mng-bo-token':  await Utils.getStorage.read('token'),  // 실제 토큰 값 사용
              'mng-bo-rtoken': await Utils.getStorage.read('rtoken'),  // 실제 rtoken 값 사용
            },
          ),
        );
        if (response.statusCode == 200) {
          var token = response.headers['mng-bo-token'];
          var rtoken = response.headers['mng-bo-rtoken'];
          var jsonData = response.data;

          //  ipgoModel = IpgoModel.fromJson(jsonData);

          await Utils.getStorage.write('token', token);
          await Utils.getStorage.write('rtoken', rtoken);
        }
        // loginModel = LoginModel.fromJson(response.data);
      }

    } on DioError catch (e) {
      Get.log('registSmallKitBomSave - error');
      a = '1111';
      SmallKitController controller = Get.find();
      controller.isDbConnected.value = false;
      // commonError(e);
    } catch (err) {
      Get.log('registSmallKitBomSave = ${err.toString()}');
      a = '1111';
    }
    return a;
  }

  /// BOM 조회 -- model 바꿔야함
  Future<EtcChulgoSecondModel> reqBom(var params) async {
    var bomModel = EtcChulgoSecondModel();

    try {
      if (APP_CONST.LOCAL_JSON_MODE) {
      } else {

        final response = await HttpUtil.getDio()
            .post('/api/common/procedure/posts', data: jsonEncode(params),
          options: Options(
            headers: {
              'mng-bo-token':  await Utils.getStorage.read('token'),  // 실제 토큰 값 사용
              'mng-bo-rtoken': await Utils.getStorage.read('rtoken'),  // 실제 rtoken 값 사용
            },
          ),
        );
        if (response.statusCode == 200) {
          var token = response.headers['mng-bo-token'];
          var rtoken = response.headers['mng-bo-rtoken'];
          var jsonData = response.data;

          bomModel = EtcChulgoSecondModel.fromJson(jsonData);

          await Utils.getStorage.write('token', token);
          await Utils.getStorage.write('rtoken', rtoken);
        }
        // loginModel = LoginModel.fromJson(response.data);
      }

    } on DioError catch (e) {
      Get.log('reqBom - error');
      // commonError(e);
    } catch (err) {
      Get.log('reqBom = ${err.toString()}');
    }
    return bomModel;
  }

  /// 기타입고 QR 조회
  Future<EtcChulgoSecondModel> reqEtcChulgoQr(var params) async {
    var etcChulgoSecondModel = EtcChulgoSecondModel();

    try {
      if (APP_CONST.LOCAL_JSON_MODE) {
        var urlPath = 'assets/json/small_kit.json';
        final jsonResponse = await localJsonPaser(urlPath);
        etcChulgoSecondModel = EtcChulgoSecondModel.fromJson(jsonResponse);
      } else {

        final response = await HttpUtil.getDio()
            .post('/api/common/procedure/posts', data: jsonEncode(params),
          options: Options(
            headers: {
              'mng-bo-token':  await Utils.getStorage.read('token'),  // 실제 토큰 값 사용
              'mng-bo-rtoken': await Utils.getStorage.read('rtoken'),  // 실제 rtoken 값 사용
            },
          ),
        );
        if (response.statusCode == 200) {
          var token = response.headers['mng-bo-token'];
          var rtoken = response.headers['mng-bo-rtoken'];
          var jsonData = response.data;

          etcChulgoSecondModel = EtcChulgoSecondModel.fromJson(jsonData);

          await Utils.getStorage.write('token', token);
          await Utils.getStorage.write('rtoken', rtoken);
        }
        // loginModel = LoginModel.fromJson(response.data);
      }

    } on DioError catch (e) {
      Get.log('reqEtcChulgoQr - error');
      // commonError(e);
    } catch (err) {
      Get.log('reqEtcChulgoQr = ${err.toString()}');
    }
    return etcChulgoSecondModel;
  }

  /// 기타출고 조회
  Future<EtcChulgoModel> reqEtcChulgo(var params) async {
    var etcChulgoModel = EtcChulgoModel();

    try {
      if (APP_CONST.LOCAL_JSON_MODE) {
        var urlPath = 'assets/json/small_kit.json';
        final jsonResponse = await localJsonPaser(urlPath);
        etcChulgoModel = EtcChulgoModel.fromJson(jsonResponse);
      } else {

        final response = await HttpUtil.getDio()
            .post('/api/common/procedure/posts', data: jsonEncode(params),
          options: Options(
            headers: {
              'mng-bo-token':  await Utils.getStorage.read('token'),  // 실제 토큰 값 사용
              'mng-bo-rtoken': await Utils.getStorage.read('rtoken'),  // 실제 rtoken 값 사용
            },
          ),
        );
        if (response.statusCode == 200) {
          var token = response.headers['mng-bo-token'];
          var rtoken = response.headers['mng-bo-rtoken'];
          var jsonData = response.data;

          etcChulgoModel = EtcChulgoModel.fromJson(jsonData);

          await Utils.getStorage.write('token', token);
          await Utils.getStorage.write('rtoken', rtoken);
        }
        // loginModel = LoginModel.fromJson(response.data);
      }

    } on DioError catch (e) {
      Get.log('reqEtcChulgo - error');
      // commonError(e);
    } catch (err) {
      Get.log('reqEtcChulgo = ${err.toString()}');
    }
    return etcChulgoModel;
  }

  /// 기타 입고취소/저장 처리
  Future<String> registEtcCancelIpgo(var params) async {
    //  var ipgoModel = IpgoModel();
    String a = '0000';
    try {
      if (APP_CONST.LOCAL_JSON_MODE) {
        var urlPath = 'assets/json/ipgo_regist.json';
        final jsonResponse = await localJsonPaser(urlPath);
        //   ipgoModel = IpgoModel.fromJson(jsonResponse);
      } else {

        final response = await HttpUtil.getDio()
            .post('/api/common/procedure/posts', data: jsonEncode(params),
          options: Options(
            headers: {
              'mng-bo-token':  await Utils.getStorage.read('token'),  // 실제 토큰 값 사용
              'mng-bo-rtoken': await Utils.getStorage.read('rtoken'),  // 실제 rtoken 값 사용
            },
          ),
        );
        if (response.statusCode == 200) {
          var token = response.headers['mng-bo-token'];
          var rtoken = response.headers['mng-bo-rtoken'];
          var jsonData = response.data;

          //  ipgoModel = IpgoModel.fromJson(jsonData);

          await Utils.getStorage.write('token', token);
          await Utils.getStorage.write('rtoken', rtoken);
        }
        // loginModel = LoginModel.fromJson(response.data);
      }

    } on DioError catch (e) {
      Get.log('registEtcCancelIpgo - error');
      // commonError(e);
      a = '1111';
    } catch (err) {
      Get.log('registEtcCancelIpgo = ${err.toString()}');
      a = '1111';
    }
    return a;
  }

  /// 기타입고 QR 디테일 조회
  Future<EtcIpgoSecondDetailModel> reqEtcIpgoQrDetail(var params) async {
    var etcIpgoSecondDetailModel = EtcIpgoSecondDetailModel();

    try {
      if (APP_CONST.LOCAL_JSON_MODE) {
        var urlPath = 'assets/json/small_kit.json';
        final jsonResponse = await localJsonPaser(urlPath);
        etcIpgoSecondDetailModel = EtcIpgoSecondDetailModel.fromJson(jsonResponse);
      } else {

        final response = await HttpUtil.getDio()
            .post('/api/common/procedure/posts', data: jsonEncode(params),
          options: Options(
            headers: {
              'mng-bo-token':  await Utils.getStorage.read('token'),  // 실제 토큰 값 사용
              'mng-bo-rtoken': await Utils.getStorage.read('rtoken'),  // 실제 rtoken 값 사용
            },
          ),
        );
        if (response.statusCode == 200) {
          var token = response.headers['mng-bo-token'];
          var rtoken = response.headers['mng-bo-rtoken'];
          var jsonData = response.data;

          etcIpgoSecondDetailModel = EtcIpgoSecondDetailModel.fromJson(jsonData);

          await Utils.getStorage.write('token', token);
          await Utils.getStorage.write('rtoken', rtoken);
        }
        // loginModel = LoginModel.fromJson(response.data);
      }

    } on DioError catch (e) {
      Get.log('reqEtcIpgoQrDetail - error');
      // commonError(e);
    } catch (err) {
      Get.log('reqEtcIpgoQrDetail = ${err.toString()}');
    }
    return etcIpgoSecondDetailModel;
  }


  /// 기타입고 QR 조회
  Future<EtcIpgoSecondModel> reqEtcIpgoQr(var params) async {
    var etcIpgoSecondModel = EtcIpgoSecondModel();

    try {
      if (APP_CONST.LOCAL_JSON_MODE) {
        var urlPath = 'assets/json/small_kit.json';
        final jsonResponse = await localJsonPaser(urlPath);
        etcIpgoSecondModel = EtcIpgoSecondModel.fromJson(jsonResponse);
      } else {

        final response = await HttpUtil.getDio()
            .post('/api/common/procedure/posts', data: jsonEncode(params),
          options: Options(
            headers: {
              'mng-bo-token':  await Utils.getStorage.read('token'),  // 실제 토큰 값 사용
              'mng-bo-rtoken': await Utils.getStorage.read('rtoken'),  // 실제 rtoken 값 사용
            },
          ),
        );
        if (response.statusCode == 200) {
          var token = response.headers['mng-bo-token'];
          var rtoken = response.headers['mng-bo-rtoken'];
          var jsonData = response.data;

          etcIpgoSecondModel = EtcIpgoSecondModel.fromJson(jsonData);

          await Utils.getStorage.write('token', token);
          await Utils.getStorage.write('rtoken', rtoken);
        }
        // loginModel = LoginModel.fromJson(response.data);
      }

    } on DioError catch (e) {
      Get.log('reqEtcIpgoQr - error');
      // commonError(e);
    } catch (err) {
      Get.log('reqEtcIpgoQr = ${err.toString()}');
    }
    return etcIpgoSecondModel;
  }

  /// 기타입고 디테일 조회
  Future<EtcIpgoDetailModel> reqEtcIpgoDetail(var params) async {
    var etcIpgoDetailModel = EtcIpgoDetailModel();

    try {
      if (APP_CONST.LOCAL_JSON_MODE) {
        var urlPath = 'assets/json/small_kit.json';
        final jsonResponse = await localJsonPaser(urlPath);
        etcIpgoDetailModel = EtcIpgoDetailModel.fromJson(jsonResponse);
      } else {

        final response = await HttpUtil.getDio()
            .post('/api/common/procedure/posts', data: jsonEncode(params),
          options: Options(
            headers: {
              'mng-bo-token':  await Utils.getStorage.read('token'),  // 실제 토큰 값 사용
              'mng-bo-rtoken': await Utils.getStorage.read('rtoken'),  // 실제 rtoken 값 사용
            },
          ),
        );
        if (response.statusCode == 200) {
          var token = response.headers['mng-bo-token'];
          var rtoken = response.headers['mng-bo-rtoken'];
          var jsonData = response.data;

          etcIpgoDetailModel = EtcIpgoDetailModel.fromJson(jsonData);

          await Utils.getStorage.write('token', token);
          await Utils.getStorage.write('rtoken', rtoken);
        }
        // loginModel = LoginModel.fromJson(response.data);
      }

    } on DioError catch (e) {
      Get.log('reqEtcIpgoDetail - error');
      // commonError(e);
    } catch (err) {
      Get.log('reqEtcIpgoDetail = ${err.toString()}');
    }
    return etcIpgoDetailModel;
  }

  /// 기타입고 조회
  Future<EtcIpgoModel> reqEtcIpgo(var params) async {
    var etcIpgoModel = EtcIpgoModel();

    try {
      if (APP_CONST.LOCAL_JSON_MODE) {
        var urlPath = 'assets/json/small_kit.json';
        final jsonResponse = await localJsonPaser(urlPath);
        etcIpgoModel = EtcIpgoModel.fromJson(jsonResponse);
      } else {

        final response = await HttpUtil.getDio()
            .post('/api/common/procedure/posts', data: jsonEncode(params),
          options: Options(
            headers: {
              'mng-bo-token':  await Utils.getStorage.read('token'),  // 실제 토큰 값 사용
              'mng-bo-rtoken': await Utils.getStorage.read('rtoken'),  // 실제 rtoken 값 사용
            },
          ),
        );
        if (response.statusCode == 200) {
          var token = response.headers['mng-bo-token'];
          var rtoken = response.headers['mng-bo-rtoken'];
          var jsonData = response.data;

          etcIpgoModel = EtcIpgoModel.fromJson(jsonData);

          await Utils.getStorage.write('token', token);
          await Utils.getStorage.write('rtoken', rtoken);
        }
        // loginModel = LoginModel.fromJson(response.data);
      }

    } on DioError catch (e) {
      Get.log('reqEtcIpgo - error');
      // commonError(e);
    } catch (err) {
      Get.log('reqEtcIpgo = ${err.toString()}');
    }
    return etcIpgoModel;
  }

  /// 메인키트 디테일 저장
  Future<String> registMainKitDetailSave(var params) async {
    String a = '0000';
    try {
      if (APP_CONST.LOCAL_JSON_MODE) {
        var urlPath = 'assets/json/main_kit_save_regist.json';
        final jsonResponse = await localJsonPaser(urlPath);
        // ipgoModel = IpgoModel.fromJson(jsonResponse);
      } else {

        final response = await HttpUtil.getDio()
            .post('/api/common/procedure/posts', data: jsonEncode(params),
          options: Options(
            headers: {
              'mng-bo-token':  await Utils.getStorage.read('token'),  // 실제 토큰 값 사용
              'mng-bo-rtoken': await Utils.getStorage.read('rtoken'),  // 실제 rtoken 값 사용
            },
          ),
        );
        if (response.statusCode == 200) {
          var token = response.headers['mng-bo-token'];
          var rtoken = response.headers['mng-bo-rtoken'];
          var jsonData = response.data;

          //  ipgoModel = IpgoModel.fromJson(jsonData);

          await Utils.getStorage.write('token', token);
          await Utils.getStorage.write('rtoken', rtoken);
        }
        // loginModel = LoginModel.fromJson(response.data);
      }

    } on DioError catch (e) {
      Get.log('registMainKitDetailSave = ${e.toString()}');
      a = '1111';
      MainKitController controller = Get.find();
      controller.isDbConnected.value = false;
      // commonError(e);
    } catch (err) {
      Get.log('registMainKitDetailSave = ${err.toString()}');
      a = '1111';
    }
    return a;
  }

  /// 메인키트 확정
  Future<String> registMainKitSave(var params) async {
    String a = '0000';
    try {
      if (APP_CONST.LOCAL_JSON_MODE) {
        var urlPath = 'assets/json/main_kit_save_regist.json';
        final jsonResponse = await localJsonPaser(urlPath);
        // ipgoModel = IpgoModel.fromJson(jsonResponse);
      } else {

        final response = await HttpUtil.getDio()
            .post('/api/common/procedure/posts', data: jsonEncode(params),
          options: Options(
            headers: {
              'mng-bo-token':  await Utils.getStorage.read('token'),  // 실제 토큰 값 사용
              'mng-bo-rtoken': await Utils.getStorage.read('rtoken'),  // 실제 rtoken 값 사용
            },
          ),
        );
        if (response.statusCode == 200) {
          var token = response.headers['mng-bo-token'];
          var rtoken = response.headers['mng-bo-rtoken'];
          var jsonData = response.data;

          //  ipgoModel = IpgoModel.fromJson(jsonData);

          await Utils.getStorage.write('token', token);
          await Utils.getStorage.write('rtoken', rtoken);
        }
        // loginModel = LoginModel.fromJson(response.data);
      }

    } on DioError catch (e) {
      Get.log('registMainKitSave - error');
      a = '1111';
      MainKitController controller = Get.find();
      controller.isDbConnected.value = false;
      // commonError(e);
    } catch (err) {
      Get.log('registMainKitSave = ${err.toString()}');
      a = '1111';
    }
    return a;
  }


  /// 메인박스 KIT 첫번째 조회
  Future<MainKitModel> reqMainKit(var params) async {
    var mainKitModel = MainKitModel();

    try {
      if (APP_CONST.LOCAL_JSON_MODE) {
        var urlPath = 'assets/json/small_kit.json';
        final jsonResponse = await localJsonPaser(urlPath);
        mainKitModel = MainKitModel.fromJson(jsonResponse);
      } else {

        final response = await HttpUtil.getDio()
            .post('/api/common/procedure/posts', data: jsonEncode(params),
          options: Options(
            headers: {
              'mng-bo-token':  await Utils.getStorage.read('token'),  // 실제 토큰 값 사용
              'mng-bo-rtoken': await Utils.getStorage.read('rtoken'),  // 실제 rtoken 값 사용
            },
          ),
        );
        if (response.statusCode == 200) {
          var token = response.headers['mng-bo-token'];
          var rtoken = response.headers['mng-bo-rtoken'];
          var jsonData = response.data;

          mainKitModel = MainKitModel.fromJson(jsonData);

          await Utils.getStorage.write('token', token);
          await Utils.getStorage.write('rtoken', rtoken);
        }
        // loginModel = LoginModel.fromJson(response.data);
      }

    } on DioError catch (e) {
      Get.log('reqMainKit - error');
      // commonError(e);
      MainKitController controller = Get.find();
      controller.isDbConnected.value = false;
    } catch (err) {
      Get.log('reqMainKit = ${err.toString()}');
    }
    return mainKitModel;
  }

  /// 출고 등록
  Future<String> registChulgo(var params) async {
    String a = '0000';
    try {
      if (APP_CONST.LOCAL_JSON_MODE) {
        var urlPath = 'assets/json/ipgo_regist.json';
        final jsonResponse = await localJsonPaser(urlPath);
      } else {

        final response = await HttpUtil.getDio()
            .post('/api/common/procedure/posts', data: jsonEncode(params),
          options: Options(
            headers: {
              'mng-bo-token':  await Utils.getStorage.read('token'),  // 실제 토큰 값 사용
              'mng-bo-rtoken': await Utils.getStorage.read('rtoken'),  // 실제 rtoken 값 사용
            },
          ),
        );
        if (response.statusCode == 200) {
          var token = response.headers['mng-bo-token'];
          var rtoken = response.headers['mng-bo-rtoken'];
          var jsonData = response.data;

          await Utils.getStorage.write('token', token);
          await Utils.getStorage.write('rtoken', rtoken);
        }
        // loginModel = LoginModel.fromJson(response.data);
      }

    } on DioError catch (e) {
      Get.log('registChulgo - error');
      // commonError(e);
      a = '1111';
      ChulgoController controller = Get.find();
      controller.isDbConnected.value = false;
    } catch (err) {
      Get.log('registChulgo = ${err.toString()}');
      a = '1111';
    }
    return a;
  }

  /// 출고등록 세번째 조회
  Future<ChulThirdModel> reqChulThird(var params) async {
    var chulThirdModel = ChulThirdModel();

    try {
      if (APP_CONST.LOCAL_JSON_MODE) {
        var urlPath = 'assets/json/picking_second.json';
        final jsonResponse = await localJsonPaser(urlPath);
        chulThirdModel = ChulThirdModel.fromJson(jsonResponse);
      } else {

        final response = await HttpUtil.getDio()
            .post('/api/common/procedure/posts', data: jsonEncode(params),
          options: Options(
            headers: {
              'mng-bo-token':  await Utils.getStorage.read('token'),  // 실제 토큰 값 사용
              'mng-bo-rtoken': await Utils.getStorage.read('rtoken'),  // 실제 rtoken 값 사용
            },
          ),
        );
        if (response.statusCode == 200) {
          var token = response.headers['mng-bo-token'];
          var rtoken = response.headers['mng-bo-rtoken'];
          var jsonData = response.data;

          chulThirdModel = ChulThirdModel.fromJson(jsonData);

          await Utils.getStorage.write('token', token);
          await Utils.getStorage.write('rtoken', rtoken);
        }
        // loginModel = LoginModel.fromJson(response.data);
      }

    } on DioError catch (e) {
      Get.log('reqChulThird - error');
      // commonError(e);
      ChulgoController controller = Get.find();
      controller.isDbConnected.value = false;
    } catch (err) {
      Get.log('reqChulThird = ${err.toString()}');
    }
    return chulThirdModel;
  }

  /// 출고등록 두번째 조회
  Future<ChulSecondModel> reqChulSecond(var params) async {
    var chulSecondModel = ChulSecondModel();

    try {
      if (APP_CONST.LOCAL_JSON_MODE) {
        var urlPath = 'assets/json/picking_second.json';
        final jsonResponse = await localJsonPaser(urlPath);
        chulSecondModel = ChulSecondModel.fromJson(jsonResponse);
      } else {

        final response = await HttpUtil.getDio()
            .post('/api/common/procedure/posts', data: jsonEncode(params),
          options: Options(
            headers: {
              'mng-bo-token':  await Utils.getStorage.read('token'),  // 실제 토큰 값 사용
              'mng-bo-rtoken': await Utils.getStorage.read('rtoken'),  // 실제 rtoken 값 사용
            },
          ),
        );
        if (response.statusCode == 200) {
          var token = response.headers['mng-bo-token'];
          var rtoken = response.headers['mng-bo-rtoken'];
          var jsonData = response.data;

          chulSecondModel = ChulSecondModel.fromJson(jsonData);

          await Utils.getStorage.write('token', token);
          await Utils.getStorage.write('rtoken', rtoken);
        }
        // loginModel = LoginModel.fromJson(response.data);
      }

    } on DioError catch (e) {
      Get.log('reqChulSecond - error');
      // commonError(e);
      ChulgoController controller = Get.find();
      controller.isDbConnected.value = false;
    } catch (err) {
      Get.log('reqChulSecond = ${err.toString()}');
    }
    return chulSecondModel;
  }

  /// 출고등록 조회
  Future<ChulModel> reqChulgo(var params) async {
    var chulModel = ChulModel();

    try {
      if (APP_CONST.LOCAL_JSON_MODE) {
        var urlPath = 'assets/json/other_kit_save.json';
        final jsonResponse = await localJsonPaser(urlPath);
        chulModel = ChulModel.fromJson(jsonResponse);
      } else {

        final response = await HttpUtil.getDio()
            .post('/api/common/procedure/posts', data: jsonEncode(params),
          options: Options(
            headers: {
              'mng-bo-token':  await Utils.getStorage.read('token'),  // 실제 토큰 값 사용
              'mng-bo-rtoken': await Utils.getStorage.read('rtoken'),  // 실제 rtoken 값 사용
            },
          ),
        );
        if (response.statusCode == 200) {
          var token = response.headers['mng-bo-token'];
          var rtoken = response.headers['mng-bo-rtoken'];
          var jsonData = response.data;

          chulModel = ChulModel.fromJson(jsonData);

          await Utils.getStorage.write('token', token);
          await Utils.getStorage.write('rtoken', rtoken);
        }
        // loginModel = LoginModel.fromJson(response.data);
      }

    } on DioError catch (e) {
      Get.log('reqChulgo - error');
      // commonError(e);
      ChulgoController controller = Get.find();
      controller.isDbConnected.value = false;
    } catch (err) {
      Get.log('reqChulgo = ${err.toString()}');
    }
    return chulModel;
  }


  /// 별도박스 조회
  Future<OtherKitModel> reqOtherKit(var params) async {
    var otherKitModel = OtherKitModel();

    try {
      if (APP_CONST.LOCAL_JSON_MODE) {
        var urlPath = 'assets/json/other_kit_save.json';
        final jsonResponse = await localJsonPaser(urlPath);
        otherKitModel = OtherKitModel.fromJson(jsonResponse);
      } else {

        final response = await HttpUtil.getDio()
            .post('/api/common/procedure/posts', data: jsonEncode(params),
          options: Options(
            headers: {
              'mng-bo-token':  await Utils.getStorage.read('token'),  // 실제 토큰 값 사용
              'mng-bo-rtoken': await Utils.getStorage.read('rtoken'),  // 실제 rtoken 값 사용
            },
          ),
        );
        if (response.statusCode == 200) {
          var token = response.headers['mng-bo-token'];
          var rtoken = response.headers['mng-bo-rtoken'];
          var jsonData = response.data;

          otherKitModel = OtherKitModel.fromJson(jsonData);

          await Utils.getStorage.write('token', token);
          await Utils.getStorage.write('rtoken', rtoken);
        }
        // loginModel = LoginModel.fromJson(response.data);
      }

    } on DioError catch (e) {
      Get.log('reqOtherKit - error');
      // commonError(e);
      OtherKitController controller = Get.find();
      controller.isDbConnected.value = false;
    } catch (err) {
      Get.log('reqOtherKit = ${err.toString()}');
    }
    return otherKitModel;
  }


  /// 랙입고 등록
  Future<String> registPicking(var params) async {
    String a = '0000';
    try {
      if (APP_CONST.LOCAL_JSON_MODE) {
        var urlPath = 'assets/json/regist_picking.json';
        final jsonResponse = await localJsonPaser(urlPath);
        // ipgoModel = IpgoModel.fromJson(jsonResponse);
      } else {

        final response = await HttpUtil.getDio()
            .post('/api/common/procedure/posts', data: jsonEncode(params),
          options: Options(
            headers: {
              'mng-bo-token':  await Utils.getStorage.read('token'),  // 실제 토큰 값 사용
              'mng-bo-rtoken': await Utils.getStorage.read('rtoken'),  // 실제 rtoken 값 사용
            },
          ),
        );
        if (response.statusCode == 200) {
          var token = response.headers['mng-bo-token'];
          var rtoken = response.headers['mng-bo-rtoken'];
          var jsonData = response.data;

          //  ipgoModel = IpgoModel.fromJson(jsonData);

          await Utils.getStorage.write('token', token);
          await Utils.getStorage.write('rtoken', rtoken);
        }
        // loginModel = LoginModel.fromJson(response.data);
      }

    } on DioError catch (e) {
      Get.log('registPicking - error');
      a = '1111';
      // commonError(e);
      PickingController controller = Get.find();
      controller.isDbConnected.value = false;
    } catch (err) {
      a = '1111';
      Get.log('registPicking = ${err.toString()}');
    }
    return a;
  }


  /// 피킹지시 세번째 조회
  Future<PickingThirdModel> reqPickingThird(var params) async {
    var pickingThirdModel = PickingThirdModel();

    try {
      if (APP_CONST.LOCAL_JSON_MODE) {
        var urlPath = 'assets/json/picking_third.json';
        final jsonResponse = await localJsonPaser(urlPath);
        pickingThirdModel = PickingThirdModel.fromJson(jsonResponse);
      } else {

        final response = await HttpUtil.getDio()
            .post('/api/common/procedure/posts', data: jsonEncode(params),
          options: Options(
            headers: {
              'mng-bo-token':  await Utils.getStorage.read('token'),  // 실제 토큰 값 사용
              'mng-bo-rtoken': await Utils.getStorage.read('rtoken'),  // 실제 rtoken 값 사용
            },
          ),
        );
        if (response.statusCode == 200) {
          var token = response.headers['mng-bo-token'];
          var rtoken = response.headers['mng-bo-rtoken'];
          var jsonData = response.data;

          pickingThirdModel = PickingThirdModel.fromJson(jsonData);

          await Utils.getStorage.write('token', token);
          await Utils.getStorage.write('rtoken', rtoken);
        }
        // loginModel = LoginModel.fromJson(response.data);
      }

    } on DioError catch (e) {
      Get.log('reqPickingThird - error');
      // commonError(e);
      PickingController controller = Get.find();
      controller.isDbConnected.value = false;
    } catch (err) {
      Get.log('reqPickingThird = ${err.toString()}');
    }
    return pickingThirdModel;
  }

  /// 피킹지시 두번째 조회
  Future<PickingSecondModel> reqPickingSecond(var params) async {
    var pickingSecondModel = PickingSecondModel();

    try {
      if (APP_CONST.LOCAL_JSON_MODE) {
        var urlPath = 'assets/json/picking_second.json';
        final jsonResponse = await localJsonPaser(urlPath);
        pickingSecondModel = PickingSecondModel.fromJson(jsonResponse);
      } else {

        final response = await HttpUtil.getDio()
            .post('/api/common/procedure/posts', data: jsonEncode(params),
          options: Options(
            headers: {
              'mng-bo-token':  await Utils.getStorage.read('token'),  // 실제 토큰 값 사용
              'mng-bo-rtoken': await Utils.getStorage.read('rtoken'),  // 실제 rtoken 값 사용
            },
          ),
        );
        if (response.statusCode == 200) {
          var token = response.headers['mng-bo-token'];
          var rtoken = response.headers['mng-bo-rtoken'];
          var jsonData = response.data;

          pickingSecondModel = PickingSecondModel.fromJson(jsonData);

          await Utils.getStorage.write('token', token);
          await Utils.getStorage.write('rtoken', rtoken);
        }
        // loginModel = LoginModel.fromJson(response.data);
      }

    } on DioError catch (e) {
      Get.log('reqPickingSecond - error');
      // commonError(e);
      PickingController controller = Get.find();
      controller.isDbConnected.value = false;
    } catch (err) {
      Get.log('reqPickingSecond = ${err.toString()}');
    }
    return pickingSecondModel;
  }

  /// 피킹지시 첫번째 조회
  Future<PickingFirstModel> reqPickingFirst(var params) async {
    var pickingFirstModel = PickingFirstModel();

    try {
      if (APP_CONST.LOCAL_JSON_MODE) {
        var urlPath = 'assets/json/small_kit_save.json';
        final jsonResponse = await localJsonPaser(urlPath);
        pickingFirstModel = PickingFirstModel.fromJson(jsonResponse);
      } else {

        final response = await HttpUtil.getDio()
            .post('/api/common/procedure/posts', data: jsonEncode(params),
          options: Options(
            headers: {
              'mng-bo-token':  await Utils.getStorage.read('token'),  // 실제 토큰 값 사용
              'mng-bo-rtoken': await Utils.getStorage.read('rtoken'),  // 실제 rtoken 값 사용
            },
          ),
        );
        if (response.statusCode == 200) {
          var token = response.headers['mng-bo-token'];
          var rtoken = response.headers['mng-bo-rtoken'];
          var jsonData = response.data;

          pickingFirstModel = PickingFirstModel.fromJson(jsonData);

          await Utils.getStorage.write('token', token);
          await Utils.getStorage.write('rtoken', rtoken);
        }
        // loginModel = LoginModel.fromJson(response.data);
      }

    } on DioError catch (e) {
      Get.log('reqPickingFirst - error');
      // commonError(e);
      PickingController controller = Get.find();
      controller.isDbConnected.value = false;
    } catch (err) {
      Get.log('reqPickingFirst = ${err.toString()}');
    }
    return pickingFirstModel;
  }

  /// 별도박스 저장
  Future<String> registOtherKitSave(var params) async {
    String a = '0000';
    try {
      if (APP_CONST.LOCAL_JSON_MODE) {
        var urlPath = 'assets/json/small_kit_save_regist.json';
        final jsonResponse = await localJsonPaser(urlPath);
        // ipgoModel = IpgoModel.fromJson(jsonResponse);
      } else {

        final response = await HttpUtil.getDio()
            .post('/api/common/procedure/multiPosts', data: jsonEncode(params),
          options: Options(
            headers: {
              'mng-bo-token':  await Utils.getStorage.read('token'),  // 실제 토큰 값 사용
              'mng-bo-rtoken': await Utils.getStorage.read('rtoken'),  // 실제 rtoken 값 사용
            },
          ),
        );
        if (response.statusCode == 200) {
          var token = response.headers['mng-bo-token'];
          var rtoken = response.headers['mng-bo-rtoken'];
          var jsonData = response.data;

          //  ipgoModel = IpgoModel.fromJson(jsonData);

          await Utils.getStorage.write('token', token);
          await Utils.getStorage.write('rtoken', rtoken);
        }
        // loginModel = LoginModel.fromJson(response.data);
      }

    } on DioError catch (e) {
      Get.log('registSmallKitSave - error');
      a = '1111';
      // commonError(e);
      OtherKitController controller = Get.find();
      controller.isDbConnected.value = false;
    } catch (err) {
      Get.log('registSmallKitSave = ${err.toString()}');
      a = '1111';
    }
    return a;
  }

  /// 소박스 저장
  Future<String> registSmallKitSave(var params) async {
    String a = '0000';
    try {
      if (APP_CONST.LOCAL_JSON_MODE) {
        var urlPath = 'assets/json/small_kit_save_regist.json';
        final jsonResponse = await localJsonPaser(urlPath);
        // ipgoModel = IpgoModel.fromJson(jsonResponse);
      } else {

        final response = await HttpUtil.getDio()
            .post('/api/common/procedure/posts', data: jsonEncode(params),
          options: Options(
            headers: {
              'mng-bo-token':  await Utils.getStorage.read('token'),  // 실제 토큰 값 사용
              'mng-bo-rtoken': await Utils.getStorage.read('rtoken'),  // 실제 rtoken 값 사용
            },
          ),
        );
        if (response.statusCode == 200) {
          var token = response.headers['mng-bo-token'];
          var rtoken = response.headers['mng-bo-rtoken'];
          var jsonData = response.data;

          //  ipgoModel = IpgoModel.fromJson(jsonData);

          await Utils.getStorage.write('token', token);
          await Utils.getStorage.write('rtoken', rtoken);
        }
        // loginModel = LoginModel.fromJson(response.data);
      }

    } on DioError catch (e) {
      Get.log('registSmallKitSave - error');
      a = '1111';
      SmallKitController controller = Get.find();
      controller.isDbConnected.value = false;
      // commonError(e);
    } catch (err) {
      Get.log('registSmallKitSave = ${err.toString()}');
      a = '1111';
    }
    return a;
  }

  /// 소박스 KIT 저장 조회
  Future<SmallKitSaveModel> reqSmallKitSave(var params) async {
    var smallKitSaveModel = SmallKitSaveModel();

    try {
      if (APP_CONST.LOCAL_JSON_MODE) {
        var urlPath = 'assets/json/small_kit_save.json';
        final jsonResponse = await localJsonPaser(urlPath);
        smallKitSaveModel = SmallKitSaveModel.fromJson(jsonResponse);
      } else {

        final response = await HttpUtil.getDio()
            .post('/api/common/procedure/posts', data: jsonEncode(params),
          options: Options(
            headers: {
              'mng-bo-token':  await Utils.getStorage.read('token'),  // 실제 토큰 값 사용
              'mng-bo-rtoken': await Utils.getStorage.read('rtoken'),  // 실제 rtoken 값 사용
            },
          ),
        );
        if (response.statusCode == 200) {
          var token = response.headers['mng-bo-token'];
          var rtoken = response.headers['mng-bo-rtoken'];
          var jsonData = response.data;

          smallKitSaveModel = SmallKitSaveModel.fromJson(jsonData);

          await Utils.getStorage.write('token', token);
          await Utils.getStorage.write('rtoken', rtoken);
        }
        // loginModel = LoginModel.fromJson(response.data);
      }

    } on DioError catch (e) {
      Get.log('reqSmallKitSave - error');
      SmallKitController controller = Get.find();
      controller.isDbConnected.value = false;
      // commonError(e);
    } catch (err) {
      Get.log('reqSmallKitSave = ${err.toString()}');
    }
    return smallKitSaveModel;
  }

  /// 소박스 KIT 두번째 조회(자재)
  Future<SmallKitItemModel> reqSmallKitItem(var params) async {
    var smallKitItemModel = SmallKitItemModel();

    try {
      if (APP_CONST.LOCAL_JSON_MODE) {
        var urlPath = 'assets/json/small_kit_item.json';
        final jsonResponse = await localJsonPaser(urlPath);
        smallKitItemModel = SmallKitItemModel.fromJson(jsonResponse);
      } else {

        final response = await HttpUtil.getDio()
            .post('/api/common/procedure/posts', data: jsonEncode(params),
          options: Options(
            headers: {
              'mng-bo-token':  await Utils.getStorage.read('token'),  // 실제 토큰 값 사용
              'mng-bo-rtoken': await Utils.getStorage.read('rtoken'),  // 실제 rtoken 값 사용
            },
          ),
        );
        if (response.statusCode == 200) {
          var token = response.headers['mng-bo-token'];
          var rtoken = response.headers['mng-bo-rtoken'];
          var jsonData = response.data;

          smallKitItemModel = SmallKitItemModel.fromJson(jsonData);

          await Utils.getStorage.write('token', token);
          await Utils.getStorage.write('rtoken', rtoken);
        }
        // loginModel = LoginModel.fromJson(response.data);
      }

    } on DioError catch (e) {
      Get.log('reqSmallKitItem - error');
      // commonError(e);
      SmallKitController controller = Get.find();
      controller.isDbConnected.value = false;
      controller.textQrController.text = '';
    } catch (err) {
      Get.log('reqSmallKitItem = ${err.toString()}');
    }
    return smallKitItemModel;
  }

  /// 소박스 KIT 첫번째 조회
  Future<SmallKitModel> reqSmallKit(var params) async {
    var smallKitModel = SmallKitModel();

    try {
      if (APP_CONST.LOCAL_JSON_MODE) {
        var urlPath = 'assets/json/small_kit.json';
        final jsonResponse = await localJsonPaser(urlPath);
        smallKitModel = SmallKitModel.fromJson(jsonResponse);
      } else {

        final response = await HttpUtil.getDio()
            .post('/api/common/procedure/posts', data: jsonEncode(params),
          options: Options(
            headers: {
              'mng-bo-token':  await Utils.getStorage.read('token'),  // 실제 토큰 값 사용
              'mng-bo-rtoken': await Utils.getStorage.read('rtoken'),  // 실제 rtoken 값 사용
            },
          ),
        );
        if (response.statusCode == 200) {
          var token = response.headers['mng-bo-token'];
          var rtoken = response.headers['mng-bo-rtoken'];
          var jsonData = response.data;

          smallKitModel = SmallKitModel.fromJson(jsonData);

          await Utils.getStorage.write('token', token);
          await Utils.getStorage.write('rtoken', rtoken);
        }
        // loginModel = LoginModel.fromJson(response.data);
      }

    } on DioError catch (e) {
      Get.log('reqSmallKit - error');
      // commonError(e);
      SmallKitController controller = Get.find();
      controller.isDbConnected.value = false;
      controller.textQrController.text = '';
    } catch (err) {
      Get.log('reqSmallKit = ${err.toString()}');
    }
    return smallKitModel;
  }

  /// 랙입고 등록
  Future<String> registRackIpgo(var params) async {
    String a = '0000';
    try {
      if (APP_CONST.LOCAL_JSON_MODE) {
        var urlPath = 'assets/json/ipgo_rack_regist.json';
        final jsonResponse = await localJsonPaser(urlPath);
       // ipgoModel = IpgoModel.fromJson(jsonResponse);
      } else {

        final response = await HttpUtil.getDio()
            .post('/api/common/procedure/posts', data: jsonEncode(params),
          options: Options(
            headers: {
              'mng-bo-token':  await Utils.getStorage.read('token'),  // 실제 토큰 값 사용
              'mng-bo-rtoken': await Utils.getStorage.read('rtoken'),  // 실제 rtoken 값 사용
            },
          ),
        );
        if (response.statusCode == 200) {
          var token = response.headers['mng-bo-token'];
          var rtoken = response.headers['mng-bo-rtoken'];
          var jsonData = response.data;

        //  ipgoModel = IpgoModel.fromJson(jsonData);

          await Utils.getStorage.write('token', token);
          await Utils.getStorage.write('rtoken', rtoken);
        }
        // loginModel = LoginModel.fromJson(response.data);
      }

    } on DioError catch (e) {
      Get.log('registRackIpgo - error');
      a = '1111';
      RackIpgoController controller = Get.find();
      controller.isDbConnected.value = false;
      // commonError(e);
    } catch (err) {
      Get.log('registRackIpgo = ${err.toString()}');
      a = '1111';
    }
    return a;
  }

  /// 랙입고 조회
  Future<RackIpgoModel> reqRackIpgo(var params) async {
    var rackIpgoModel = RackIpgoModel();

    try {
      if (APP_CONST.LOCAL_JSON_MODE) {
        var urlPath = 'assets/json/rack_ipgo.json';
        final jsonResponse = await localJsonPaser(urlPath);
        rackIpgoModel = RackIpgoModel.fromJson(jsonResponse);
      } else {

        final response = await HttpUtil.getDio()
            .post('/api/common/procedure/posts', data: jsonEncode(params),
          options: Options(
            headers: {
              'mng-bo-token':  await Utils.getStorage.read('token'),  // 실제 토큰 값 사용
              'mng-bo-rtoken': await Utils.getStorage.read('rtoken'),  // 실제 rtoken 값 사용
            },
          ),
        );
        if (response.statusCode == 200) {
          var token = response.headers['mng-bo-token'];
          var rtoken = response.headers['mng-bo-rtoken'];
          var jsonData = response.data;

          rackIpgoModel = RackIpgoModel.fromJson(jsonData);

          await Utils.getStorage.write('token', token);
          await Utils.getStorage.write('rtoken', rtoken);
        }
        // loginModel = LoginModel.fromJson(response.data);
      }

    } on DioError catch (e) {
      Get.log('reqRackIpgo - error');
      RackIpgoController controller = Get.find();
      controller.isDbConnected.value = false;
      // commonError(e);
    } catch (err) {
      Get.log('reqRackIpgo = ${err.toString()}');
    }
    return rackIpgoModel;
  }

  /// 입고 채번 조회
  Future<IpgoCheburnModel> reqCheburnIpgo(var params) async {
    var cheburnIpgoModel = IpgoCheburnModel();

    try {
      if (APP_CONST.LOCAL_JSON_MODE) {
        var urlPath = 'assets/json/ipgo_cheburn.json';
        final jsonResponse = await localJsonPaser(urlPath);
        cheburnIpgoModel = IpgoCheburnModel.fromJson(jsonResponse);
      } else {

        final response = await HttpUtil.getDio()
            .post('/api/common/procedure/posts', data: jsonEncode(params),
          options: Options(
            headers: {
              'mng-bo-token':  await Utils.getStorage.read('token'),  // 실제 토큰 값 사용
              'mng-bo-rtoken': await Utils.getStorage.read('rtoken'),  // 실제 rtoken 값 사용
            },
          ),
        );
        if (response.statusCode == 200) {
          var token = response.headers['mng-bo-token'];
          var rtoken = response.headers['mng-bo-rtoken'];
          var jsonData = response.data;

          cheburnIpgoModel = IpgoCheburnModel.fromJson(jsonData);

          await Utils.getStorage.write('token', token);
          await Utils.getStorage.write('rtoken', rtoken);
        }
        // loginModel = LoginModel.fromJson(response.data);
      }

    } on DioError catch (e) {
      Get.log('reqCheburnIpgo - error');
      IpgoController controller = Get.find();
      controller.isDbConnected.value = false;
      // commonError(e);
    } catch (err) {
      Get.log('reqCheburnIpgo = ${err.toString()}');
    }
    return cheburnIpgoModel;
  }


  /// 입고취소 처리
  Future<String> registCancelIpgo(var params) async {
  //  var ipgoModel = IpgoModel();
    String a = '0000';
    try {
      if (APP_CONST.LOCAL_JSON_MODE) {
        var urlPath = 'assets/json/ipgo_regist.json';
        final jsonResponse = await localJsonPaser(urlPath);
     //   ipgoModel = IpgoModel.fromJson(jsonResponse);
      } else {

        final response = await HttpUtil.getDio()
            .post('/api/common/procedure/posts', data: jsonEncode(params),
          options: Options(
            headers: {
              'mng-bo-token':  await Utils.getStorage.read('token'),  // 실제 토큰 값 사용
              'mng-bo-rtoken': await Utils.getStorage.read('rtoken'),  // 실제 rtoken 값 사용
            },
          ),
        );
        if (response.statusCode == 200) {
          var token = response.headers['mng-bo-token'];
          var rtoken = response.headers['mng-bo-rtoken'];
          var jsonData = response.data;

        //  ipgoModel = IpgoModel.fromJson(jsonData);

          await Utils.getStorage.write('token', token);
          await Utils.getStorage.write('rtoken', rtoken);
        }
        // loginModel = LoginModel.fromJson(response.data);
      }

    } on DioError catch (e) {
      Get.log('registCancelIpgo - error');
      IpgoController controller = Get.find();
      controller.isDbConnected.value = false;
      // commonError(e);
      a = '1111';
    } catch (err) {
      Get.log('registCancelIpgo = ${err.toString()}');
      a = '1111';
    }
    return a;
  }

  /// 입고취소 조회
  Future<IpgoCancelModel> reqCancelIpgo(var params) async {
    IpgoController controller = Get.find();
    var ipgoCancelModel = IpgoCancelModel();

    try {
      if (APP_CONST.LOCAL_JSON_MODE) {
        var urlPath = 'assets/json/ipgo_cancel.json';
        final jsonResponse = await localJsonPaser(urlPath);
        ipgoCancelModel = IpgoCancelModel.fromJson(jsonResponse);
      } else {

        final response = await HttpUtil.getDio()
            .post('/api/common/procedure/posts', data: jsonEncode(params),
          options: Options(
            headers: {
              'mng-bo-token':  await Utils.getStorage.read('token'),  // 실제 토큰 값 사용
              'mng-bo-rtoken': await Utils.getStorage.read('rtoken'),  // 실제 rtoken 값 사용
            },
          ),
        );
        if (response.statusCode == 200) {
          var token = response.headers['mng-bo-token'];
          var rtoken = response.headers['mng-bo-rtoken'];
          var jsonData = response.data;

          ipgoCancelModel = IpgoCancelModel.fromJson(jsonData);

          await Utils.getStorage.write('token', token);
          await Utils.getStorage.write('rtoken', rtoken);
        }
        // loginModel = LoginModel.fromJson(response.data);
      }

    } on DioError catch (e) {
      Get.log('reqCancelIpgo - error');
      controller.isDbConnected.value = false;
      // commonError(e);
    } catch (err) {
      Get.log('reqCancelIpgo = ${err.toString()}');
      controller.isDbConnected.value = false;
    }
    return ipgoCancelModel;
  }

  /// 소박스 qr조회 두번째
  Future<IpgoSmallboxItemModel> reqIpgoSmallboxQr2(var params) async {
    var ipgoSmallboxItemModel = IpgoSmallboxItemModel();

    try {
      if (APP_CONST.LOCAL_JSON_MODE) {
        var urlPath = 'assets/json/ipgo_invnr.json';
        final jsonResponse = await localJsonPaser(urlPath);
        ipgoSmallboxItemModel = IpgoSmallboxItemModel.fromJson(jsonResponse);
      } else {

        final response = await HttpUtil.getDio()
            .post('/api/common/procedure/posts', data: jsonEncode(params),
          options: Options(
            headers: {
              'mng-bo-token':  await Utils.getStorage.read('token'),  // 실제 토큰 값 사용
              'mng-bo-rtoken': await Utils.getStorage.read('rtoken'),  // 실제 rtoken 값 사용
            },
          ),
        );
        if (response.statusCode == 200) {
          var token = response.headers['mng-bo-token'];
          var rtoken = response.headers['mng-bo-rtoken'];
          var jsonData = response.data;

          ipgoSmallboxItemModel = IpgoSmallboxItemModel.fromJson(jsonData);

          await Utils.getStorage.write('token', token);
          await Utils.getStorage.write('rtoken', rtoken);
        }
        // loginModel = LoginModel.fromJson(response.data);
      }

    } on DioError catch (e) {
      Get.log('reqIpgoSmallboxQr2 - error');
      IpgoController controller = Get.find();
      controller.isDbConnected.value = false;
      // commonError(e);
    } catch (err) {
      Get.log('reqIpgoSmallboxQr2 = ${err.toString()}');
    }
    return ipgoSmallboxItemModel;
  }

  /// 소박스 qr조회 첫번째
  Future<IpgoSmallboxModel> reqIpgoSmallboxQr(var params) async {
    var ipgoSmallboxModel = IpgoSmallboxModel();

    try {
      if (APP_CONST.LOCAL_JSON_MODE) {
        var urlPath = 'assets/json/ipgo_invnr.json';
        final jsonResponse = await localJsonPaser(urlPath);
        ipgoSmallboxModel = IpgoSmallboxModel.fromJson(jsonResponse);
      } else {

        final response = await HttpUtil.getDio()
            .post('/api/common/procedure/posts', data: jsonEncode(params),
          options: Options(
            headers: {
              'mng-bo-token':  await Utils.getStorage.read('token'),  // 실제 토큰 값 사용
              'mng-bo-rtoken': await Utils.getStorage.read('rtoken'),  // 실제 rtoken 값 사용
            },
          ),
        );
        if (response.statusCode == 200) {
          var token = response.headers['mng-bo-token'];
          var rtoken = response.headers['mng-bo-rtoken'];
          var jsonData = response.data;

          ipgoSmallboxModel = IpgoSmallboxModel.fromJson(jsonData);

          await Utils.getStorage.write('token', token);
          await Utils.getStorage.write('rtoken', rtoken);
        }
        // loginModel = LoginModel.fromJson(response.data);
      }

    } on DioError catch (e) {
      Get.log('reqIpgoSmallboxQr - error');
      IpgoController controller = Get.find();
      controller.isDbConnected.value = false;
      // commonError(e);
    } catch (err) {
      Get.log('reqIpgoSmallboxQr = ${err.toString()}');
    }
    return ipgoSmallboxModel;
  }

  /// 입고 등록
  Future<String> registIpgo(var params) async {
    var ipgoModel = IpgoModel();
    String a = '0000';
    try {
      if (APP_CONST.LOCAL_JSON_MODE) {
        var urlPath = 'assets/json/ipgo_regist.json';
        final jsonResponse = await localJsonPaser(urlPath);
        ipgoModel = IpgoModel.fromJson(jsonResponse);
      } else {

        final response = await HttpUtil.getDio()
            .post('/api/common/procedure/posts', data: jsonEncode(params),
          options: Options(
            headers: {
              'mng-bo-token':  await Utils.getStorage.read('token'),  // 실제 토큰 값 사용
              'mng-bo-rtoken': await Utils.getStorage.read('rtoken'),  // 실제 rtoken 값 사용
            },
          ),
        );
        if (response.statusCode == 200) {
          var token = response.headers['mng-bo-token'];
          var rtoken = response.headers['mng-bo-rtoken'];
          var jsonData = response.data;

          ipgoModel = IpgoModel.fromJson(jsonData);

          await Utils.getStorage.write('token', token);
          await Utils.getStorage.write('rtoken', rtoken);
        }
        // loginModel = LoginModel.fromJson(response.data);
      }

    } on DioError catch (e) {
      Get.log('registIpgo - error');
      IpgoController controller = Get.find();
      controller.isDbConnected.value = false;
      // commonError(e);
      a = '1111';
    } catch (err) {
      Get.log('registIpgo = ${err.toString()}');
      a = '1111';
    }
    return a;
  }

  /// 입고 QR조회
  Future<IpgoQrModel> reqIpgoQr(var params) async {
    var ipgoQrModel = IpgoQrModel();

    try {
      if (APP_CONST.LOCAL_JSON_MODE) {
        var urlPath = 'assets/json/ipgo_invnr.json';
        final jsonResponse = await localJsonPaser(urlPath);
        ipgoQrModel = IpgoQrModel.fromJson(jsonResponse);
      } else {

        final response = await HttpUtil.getDio()
            .post('/api/common/procedure/posts', data: jsonEncode(params),
          options: Options(
            headers: {
              'mng-bo-token':  await Utils.getStorage.read('token'),  // 실제 토큰 값 사용
              'mng-bo-rtoken': await Utils.getStorage.read('rtoken'),  // 실제 rtoken 값 사용
            },
          ),
        );
        if (response.statusCode == 200) {
          var token = response.headers['mng-bo-token'];
          var rtoken = response.headers['mng-bo-rtoken'];
          var jsonData = response.data;

          ipgoQrModel = IpgoQrModel.fromJson(jsonData);

          await Utils.getStorage.write('token', token);
          await Utils.getStorage.write('rtoken', rtoken);
        }
        // loginModel = LoginModel.fromJson(response.data);
      }

    } on DioError catch (e) {
      Get.log('reqIpgoQr - error');
      IpgoController controller = Get.find();
      controller.isDbConnected.value = false;
      // commonError(e);
    } catch (err) {
      Get.log('reqIpgoQr = ${err.toString()}');
    }
    return ipgoQrModel;
  }

  /// 로그인
  Future<LoginModel> reqLogin(var params) async {
    var loginModel = LoginModel();

    try {
      if (APP_CONST.LOCAL_JSON_MODE) {
        var urlPath = 'assets/json/login.json';
        final jsonResponse = await localJsonPaser(urlPath);
        loginModel = LoginModel.fromJson(jsonResponse);
      } else {
        final response = await HttpUtil.getDio()
            .post('/api/authentication/login', data: jsonEncode(params),
         );
        if (response.statusCode == 200) {

          var token = response.headers['mng-bo-token'];
          var rtoken = response.headers['mng-bo-rtoken'];
          var jsonData = response.data;
          loginModel = LoginModel.fromJson(jsonData);
          HttpUtil.setToken(token: token!);
          await Utils.getStorage.write('userId', params['userId']);
          await Utils.getStorage.write('userPw', params['userPw']);
          await Utils.getStorage.write('token', token);
          await Utils.getStorage.write('rtoken', rtoken);
          GlobalService.to.setLoginInfo(id: params['userId'], password: params['userPw']);

          Get.log('token: $token');
          Get.log('token: $rtoken');
        }
        // loginModel = LoginModel.fromJson(response.data);
      }

    } on DioError catch (e) {
      Get.log('reqLogin - error');
      // commonError(e);
    } catch (err) {
      Get.log('reqLogin = ${err.toString()}');
    }
    return loginModel;
  }

  /// 존 조회
  Future<ZoneModel> reqZone(var params) async {
    var zoneModel = ZoneModel();

    try {
      if (APP_CONST.LOCAL_JSON_MODE) {
        var urlPath = 'assets/json/zone.json';
        final jsonResponse = await localJsonPaser(urlPath);
        zoneModel = ZoneModel.fromJson(jsonResponse);
      } else {

        final response = await HttpUtil.getDio()
            .post('/api/common/procedure/posts', data: jsonEncode(params),
          options: Options(
            headers: {
              'mng-bo-token':  await Utils.getStorage.read('token'),  // 실제 토큰 값 사용
              'mng-bo-rtoken': await Utils.getStorage.read('rtoken'),  // 실제 rtoken 값 사용
            },
          ),
        );
        if (response.statusCode == 200) {
          var token = response.headers['mng-bo-token'];
          var rtoken = response.headers['mng-bo-rtoken'];
          var jsonData = response.data;

          zoneModel = ZoneModel.fromJson(jsonData);

          await Utils.getStorage.write('token', token);
          await Utils.getStorage.write('rtoken', rtoken);
        }
        // loginModel = LoginModel.fromJson(response.data);
      }

    } on DioError catch (e) {
      Get.log('reqZone - error');
      // commonError(e);
    } catch (err) {
      Get.log('reqZone = ${err.toString()}');
    }
    return zoneModel;
  }

  /// 공통조회2
  Future<CommonModel> reqCommon2(var params) async {
    var commonModel = CommonModel();

    try {
      if (APP_CONST.LOCAL_JSON_MODE) {
        var urlPath = 'assets/json/common.json';
        final jsonResponse = await localJsonPaser(urlPath);
        commonModel = CommonModel.fromJson(jsonResponse);
      } else {

        final response = await HttpUtil.getDio()
            .post('/api/system/code/group', data: jsonEncode(params),
          options: Options(
            headers: {
              'mng-bo-token':  await Utils.getStorage.read('token'),  // 실제 토큰 값 사용
              'mng-bo-rtoken': await Utils.getStorage.read('rtoken'),  // 실제 rtoken 값 사용
            },
          ),
        );
        if (response.statusCode == 200) {
          var token = response.headers['mng-bo-token'];
          var rtoken = response.headers['mng-bo-rtoken'];
          var jsonData = response.data;

          commonModel = CommonModel.fromJson(jsonData);

          await Utils.getStorage.write('token', token);
          await Utils.getStorage.write('rtoken', rtoken);
        }
        // loginModel = LoginModel.fromJson(response.data);
      }

    } on DioError catch (e) {
      Get.log('reqCommon - error');
      // commonError(e);
    } catch (err) {
      Get.log('reqCommon = ${err.toString()}');
    }
    return commonModel;
  }

  /// 공통조회
  Future<CommonModel> reqCommon(var params) async {
    var commonModel = CommonModel();

    try {
      if (APP_CONST.LOCAL_JSON_MODE) {
        var urlPath = 'assets/json/common.json';
        final jsonResponse = await localJsonPaser(urlPath);
        commonModel = CommonModel.fromJson(jsonResponse);
      } else {

        final response = await HttpUtil.getDio()
            .post('/api/common/procedure/posts', data: jsonEncode(params),
          options: Options(
            headers: {
              'mng-bo-token':  await Utils.getStorage.read('token'),  // 실제 토큰 값 사용
              'mng-bo-rtoken': await Utils.getStorage.read('rtoken'),  // 실제 rtoken 값 사용
            },
          ),
        );
        if (response.statusCode == 200) {
          var token = response.headers['mng-bo-token'];
          var rtoken = response.headers['mng-bo-rtoken'];
          var jsonData = response.data;

          commonModel = CommonModel.fromJson(jsonData);

          await Utils.getStorage.write('token', token);
          await Utils.getStorage.write('rtoken', rtoken);
        }
        // loginModel = LoginModel.fromJson(response.data);
      }

    } on DioError catch (e) {
      Get.log('reqCommon - error');
      // commonError(e);
    } catch (err) {
      Get.log('reqCommon = ${err.toString()}');
    }
    return commonModel;
  }

  /// 입고조회
  Future<IpgoModel> reqIpgo(var params) async {
    var ipgoModel = IpgoModel();

    try {
      if (APP_CONST.LOCAL_JSON_MODE) {
        var urlPath = 'assets/json/ipgo_invnr.json';
        final jsonResponse = await localJsonPaser(urlPath);
        ipgoModel = IpgoModel.fromJson(jsonResponse);
      } else {

        final response = await HttpUtil.getDio()
            .post('/api/common/procedure/posts', data: jsonEncode(params),
            options: Options(
              headers: {
                'mng-bo-token':  await Utils.getStorage.read('token'),  // 실제 토큰 값 사용
                'mng-bo-rtoken': await Utils.getStorage.read('rtoken'),  // 실제 rtoken 값 사용
              },
            ),
        );
        if (response.statusCode == 200) {
          var token = response.headers['mng-bo-token'];
          var rtoken = response.headers['mng-bo-rtoken'];
          var jsonData = response.data;

          ipgoModel = IpgoModel.fromJson(jsonData);

          await Utils.getStorage.write('token', token);
          await Utils.getStorage.write('rtoken', rtoken);
        }
        // loginModel = LoginModel.fromJson(response.data);
      }

    } on DioError catch (e) {
      Get.log('reqIpgo - error');
      // commonError(e);
    } catch (err) {
      Get.log('reqIpgo = ${err.toString()}');
    }
    return ipgoModel;
  }




/*


  /// 로그인....`
  Future<bool> reqLogin(var params) async {
    var userModel = UserModel();

    try {
      final response =
      await HttpUtil.getDio().post('shem/login.sm', data: params);

      if (response.data['rtnCd'] == "00") {
        userModel = UserModel.fromJson(response.data['rtnData']['userInfo']);

        GlobalService.to.authToken = userModel.tokn;

        HttpUtil.setToken(token: userModel.tokn);
        await Utils.getStorage.write('userId', params['userId']);
        await Utils.getStorage.write('userPw', params['userPw']);
        await Utils.getStorage.write('authToken', userModel.tokn);
        GlobalService.to.setLoginInfo(userModel: userModel);
        return true;
      } else {
        Utils.gErrorMessage('${response.data['rtnMsg']}', title: '로그인 실패');
      }
    } on DioError catch (e) {
      Get.log('reqTest - login error');
      //commonError(e);
    } catch (err) {
      Get.log('reqLogin = ${err.toString()}');
    }

    return false;
  }

  /// 신고유형 불러오기
  Future<List<dynamic>> reqReportType() async {
    List<dynamic> typeModelList = [];

    var params = {
      'cdGrp': "PRPS_TYPE_CD",
    };

    try {
      final response = await HttpUtil.getDio()
          .post('cmon/code/searchCmonCdList.sm', data: params);

      if (response.data['rtnCd'] == "00") {
        for (int i = 0; i < response.data['rtnData']['result'].length; i++) {
          typeModelList.add(response.data['rtnData']['result'][i]);
        }

        return typeModelList;
      } else {
        Utils.gErrorMessage('Data Load Fail!', title: '신고유형 불러오기 실패');
      }
    } on DioError catch (e) {
      Get.log('reqTest - type error');
      //commonError(e);
    } catch (err) {
      Get.log('reqLogin = ${err.toString()}');
    }

    return typeModelList;
  }

  /// 신고장소 불러오기
  Future<List<dynamic>> reqReportPlace() async {
    List<dynamic> placeModelList = [];

    var params = {
      'cdGrp': "PLACE1_CD",
    };

    try {
      final response = await HttpUtil.getDio()
          .post('cmon/code/searchCmonCdList.sm', data: params);

      if (response.data['rtnCd'] == "00") {
        for (int i = 0; i < response.data['rtnData']['result'].length; i++) {
          placeModelList.add(response.data['rtnData']['result'][i]);
        }

        return placeModelList;
      } else {
        Utils.gErrorMessage('Data Load Fail!', title: '신고유형 불러오기 실패');
      }
    } on DioError catch (e) {
      Get.log('reqTest - place error');
      //commonError(e);
    } catch (err) {
      Get.log('reqLogin = ${err.toString()}');
    }

    return placeModelList;
  }

  /// 신고라인 불러오기
  Future<List<dynamic>> reqReportLine() async {
    List<dynamic> lineModelList = [];

    var params = {
      'cdGrp': "PLACE2_CD",
    };

    try {
      final response = await HttpUtil.getDio()
          .post('cmon/code/searchCmonCdList.sm', data: params);

      if (response.data['rtnCd'] == "00") {
        for (int i = 0; i < response.data['rtnData']['result'].length; i++) {
          lineModelList.add(response.data['rtnData']['result'][i]);
        }

        return lineModelList;
      } else {
        Utils.gErrorMessage('Data Load Fail!', title: '신고유형 불러오기 실패');
      }
    } on DioError catch (e) {
      Get.log('reqTest - line error');
      //commonError(e);
    } catch (err) {
      Get.log('reqLogin = ${err.toString()}');
    }

    return lineModelList;
  }

  /// 조직트리 불러오기.
  Future<OrganizationTreeModel> reqOrganizationTree() async {
    var organizationTreeModel = OrganizationTreeModel();

    Get.log('organizationTreeModelList');

    try {
      if (APP_CONST.LOCAL_JSON_MODE) {
        Get.log('로컬모드 제이슨없어 ㅠ');
        // var urlPath = 'assets/json/login.json';
        // final jsonResponse = await localJsonPaser(urlPath);
        // loginModel = LoginModel.fromJson(jsonResponse);
      } else {
        Get.log('서버모드');
        final response = await HttpUtil.getDio()
            .get('ses/cmon/searchOrgTree.sm' //, queryParameters: params
        );
        organizationTreeModel = OrganizationTreeModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      Get.log('reqTest - tree error');
      //commonError(e);
    } catch (err) {
      Get.log('reqOrganizationTree = ${err.toString()}');
    }
    return organizationTreeModel;
  }

  /// 조직도 불러오기.
  Future<OrganizationModel> reqOrganization() async {
    var organizationModel = OrganizationModel();

    Get.log('organizationModelList');

    try {
      if (APP_CONST.LOCAL_JSON_MODE) {
        Get.log('로컬모드 제이슨없어 ㅠ');
        // var urlPath = 'assets/json/login.json';
        // final jsonResponse = await localJsonPaser(urlPath);
        // loginModel = LoginModel.fromJson(jsonResponse);
      } else {
        Get.log('서버모드');

        final response = await HttpUtil.getDio()
            .get('ses/cmon/searchOrgPersonTree.sm' //, queryParameters: params
        );
        organizationModel = OrganizationModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      Get.log('reqTest - tree map error');
      //commonError(e);
    } catch (err) {
      Get.log('reqOrganization = ${err.toString()}');
    }
    return organizationModel;
  }

  /// 안전신문고 제보하기.
  Future<bool> reqReport({required var formData}) async {
    try {
      Dio _dio = await HttpUtil.getDio();
      _dio.options.headers['Content-Type'] = 'multipart/form-data';

      final response =
      await _dio.post('sps/api/proposal/register.sp', data: formData);

      if (response.data['rtnCd'] == "00") {
        _dio.options.headers['Content-Type'] = 'application/json;charset=UTF-8';
        return true;
      } else {
        Utils.gErrorMessage('잠시 후 다시 시도해주세요.', title: '신고하기 실패!');
      }
    } on DioError catch (e) {
      Get.log('reqTest - report error');
    } catch (err) {
      Get.log('reqLogin = ${err.toString()}');
    }

    return false;
  }

  /// 신고 내역 불러오기.
  Future<List<dynamic>> reqReportList(params) async {
    List<dynamic> reportList = [];
    try {
      final response = await HttpUtil.getDio()
          .post('sps/api/proposal/getList.sp', data: params);


      if (response.data['rtnCd'] == "00") {
        for (int i = 0;
        i < response.data['rtnData']['resultList'].length;
        i++) {
          if (params['stepCd'] == '10') {
            if (response.data['rtnData']['resultList'][i]['statusCd'] ==
                '0200') {
              reportList.add(response.data['rtnData']['resultList'][i]);
            }
          } else if (params['stepCd'] == '20') {
            if (response.data['rtnData']['resultList'][i]['statusCd'] ==
                '0300') {
              reportList.add(response.data['rtnData']['resultList'][i]);
            }
          } else if (params['stepCd'] == '30') {
            if (response.data['rtnData']['resultList'][i]
            ['statusCd'] ==
                '0400' ||
                response.data['rtnData']['resultList'][i]['statusCd'] ==
                    '0500' ||
                response.data['rtnData']['resultList'][i]['statusCd'] ==
                    '0600') {
              reportList.add(response.data['rtnData']['resultList'][i]);
            }
          } else {
            if (response.data['rtnData']['resultList'][i]['statusCd'] ==
                '0700') {
              reportList.add(response.data['rtnData']['resultList'][i]);
            }
          }
        }

        return reportList;
      } else {
        Utils.gErrorMessage('잠시 후 다시 시도해주세요.', title: '신고하기 실패!');
      }
    } on DioError catch (e) {
      Get.log('reqTest - reportlist error');
    } catch (err) {
      Get.log('reqLogin = ${err.toString()}');
    }

    return reportList;
  }

  /// 신고 상세목록 가져오기.
  Future<dynamic> reqReportDetail(params) async {
    dynamic reportData = null;
    try {
      final response = await HttpUtil.getDio()
          .post('sps/api/proposal/getDetail.sp', data: params);

      if (response.data['rtnCd'] == "00") {
        reportData = response.data['rtnData']['detail'];

        return reportData;
      } else {
        Utils.gErrorMessage('잠시 후 다시 시도해주세요.', title: '신고하기 실패!');
      }
    } on DioError catch (e) {
      Get.log('reqTest - detail error');
    } catch (err) {
      Get.log('reqLogin = ${err.toString()}');
    }

    return reportData;
  }

  /// 신고 진행 통계 가져오기.
  Future<dynamic> reqMyBoard(params) async {
    try {
      final response = await HttpUtil.getDio()
          .post('sps/api/proposal/getStepStatus.sp', data: params);

      if (response.data['rtnCd'] == "00") {
        Map map = Map<String, dynamic>.from(response.data['rtnData']);
        Get.log(map.toString());
        return map;
      } else {
        Utils.gErrorMessage('잠시 후 다시 시도해주세요.', title: '신고하기 실패!');
      }
    } on DioError catch (e) {
      Get.log('reqTest - step error');
    } catch (err) {
      Get.log('reqLogin = ${err.toString()}');
    }

    return;
  }

  /// 조치 부서 배정.
  Future<bool> reqAssignTeam(params) async {
    try {
      final response = await HttpUtil.getDio()
          .post('sps/api/proposal/updateActionOrg.sp', data: params);

      if (response.data['rtnCd'] == "00") {
        return true;
      } else {
        Utils.gErrorMessage('잠시 후 다시 시도해주세요.', title: '담당팀 배정 실패!');
      }
    } on DioError catch (e) {
      Get.log('reqTest - action team error');
    } catch (err) {
      Get.log('reqLogin = ${err.toString()}');
    }

    return false;
  }

  /// 조치 인원 배정.
  Future<bool> reqAssignPeople(params) async {
    try {
      final response = await HttpUtil.getDio()
          .post('sps/api/proposal/updateActionUser.sp', data: params);

      if (response.data['rtnCd'] == "00") {
        return true;
      } else {
        Utils.gErrorMessage('잠시 후 다시 시도해주세요.', title: '담당팀 배정 실패!');
      }
    } on DioError catch (e) {
      Get.log('reqTest - action people error');
    } catch (err) {
      Get.log('reqLogin = ${err.toString()}');
    }

    return false;
  }

  /// 안전신문고 조치 등록/수정 하기.
  Future<bool> reqAction({required var formData}) async {
    try {
      Dio _dio = await HttpUtil.getDio();
      _dio.options.headers['Content-Type'] = 'multipart/form-data';

      final response = await _dio.post('sps/api/proposal/updateActionDetail.sp',
          data: formData);

      if (response.data['rtnCd'] == "00") {
        _dio.options.headers['Content-Type'] = 'application/json;charset=UTF-8';
        return true;
      } else {
        Utils.gErrorMessage('잠시 후 다시 시도해주세요.', title: '신고하기 실패!');
      }
    } on DioError catch (e) {
      Get.log('reqTest - action error');
    } catch (err) {
      Get.log('reqLogin = ${err.toString()}');
    }

    return false;
  }

  /// 조치 부서 팀장 승인 - 0600으로 이동
  Future<bool> teamLeaderAssign(params) async {
    try {
      final response = await HttpUtil.getDio()
          .post('sps/api/proposal/updateActionOrgApproved.sp', data: params);

      if (response.data['rtnCd'] == "00") {
        return true;
      } else {
        Utils.gErrorMessage('잠시 후 다시 시도해주세요.', title: '담당팀 배정 실패!');
      }
    } on DioError catch (e) {
      Get.log('reqTest - teamleader assign error');
    } catch (err) {
      Get.log('reqLogin = ${err.toString()}');
    }

    return false;
  }

  /// 안전직원 승인 - 0700으로 이동
  Future<bool> safetyEmpAssign(params) async {
    try {
      final response = await HttpUtil.getDio()
          .post('sps/api/proposal/updateToComplete.sp', data: params);

      if (response.data['rtnCd'] == "00") {
        return true;
      } else {
        Utils.gErrorMessage('잠시 후 다시 시도해주세요.', title: '담당팀 배정 실패!');
      }
    } on DioError catch (e) {
      Get.log('reqTest - safety emp error');
    } catch (err) {
      Get.log('reqLogin = ${err.toString()}');
    }

    return false;
  }

  /// 안전직원 신고 미승인
  Future<bool> notAssign(params) async {
    try {
      final response = await HttpUtil.getDio()
          .post('sps/api/proposal/refuse.sp', data: params);

      if (response.data['rtnCd'] == "00") {
        return true;
      } else {
        Utils.gErrorMessage('잠시 후 다시 시도해주세요.', title: '미승인 처리 실패!');
      }
    } on DioError catch (e) {
      Get.log('reqTest - safety emp error');
    } catch (err) {
      Get.log('reqLogin = ${err.toString()}');
    }

    return false;
  }

  /// 작성자 신고 철회
  Future<bool> reportDrop(params) async {
    try {
      final response = await HttpUtil.getDio()
          .post('sps/api/proposal/withdraw.sp', data: params);

      if (response.data['rtnCd'] == "00") {
        return true;
      } else {
        Utils.gErrorMessage('잠시 후 다시 시도해주세요.', title: '신고 철회 실패!');
      }
    } on DioError catch (e) {
      Get.log('reqTest - safety emp error');
    } catch (err) {
      Get.log('reqLogin = ${err.toString()}');
    }

    return false;
  }

  Future<VersionModel> reqMobileVersion() async {
    var versionModel = VersionModel();

    try {
      final response = await HttpUtil.getDio().post(
        'api/public/v1/getAppInfo.sp',
      );

      if (response.data['rtnCd'] == "00") {
        versionModel = VersionModel.fromJson(response.data);

        return versionModel;
      } else {
        Utils.gErrorMessage('${response.data['rtnMsg']}', title: '버전 로드 실패');
      }
    } on DioError catch (e) {
      Get.log('reqVersion - version load error');
      //commonError(e);
    } catch (err) {
      Get.log('reqVersion = ${err.toString()}');
    }

    return versionModel;
  }

   */
}
