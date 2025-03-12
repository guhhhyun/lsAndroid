import 'package:flutter/foundation.dart';

class APP_CONST {
  static const bool isProduction = kReleaseMode;


  // static const String BASE_URL = 'http://118.222.92.42:8888'; // 옥토 개발서버
  // static const String BASE_URL = 'http://192.168.123.10:21002';
  // static const String BASE_URL = 'http://192.168.225.28:21002';
 // static const String BASE_URL = 'http://10.152.9.31:80'; // 개발서버
   static const String BASE_URL = 'https://10.152.9.31:443'; // LS 개발서버2
  // static const String BASE_URL = 'https://10.152.1.136:443'; // LS 운영서버+

 // static const String BASE_URL = 'http://192.168.255.28:21002';

  static const int connectTimeout = 20000;
  static const int receiveTimeout = 20000;

  // json 테스트
  static const bool LOCAL_JSON_MODE = false;
}

class test {

}