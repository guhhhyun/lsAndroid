import 'package:flutter/foundation.dart';

class APP_CONST {
  static const bool isProduction = kReleaseMode;


    static const String BASE_URL = 'http://118.222.92.42:8888';
  // static const String BASE_URL = 'http://192.168.123.10:21002';
  // static const String BASE_URL = 'http://192.168.225.28:21002';
 // static const String BASE_URL = 'http://10.152.9.31:80'; // 개발서버
  // static const String BASE_URL = 'https://10.152.9.31:443'; // 개발서버2
 // static const String BASE_URL = 'http://192.168.255.28:21002';

  static const int connectTimeout = 20000;
  static const int receiveTimeout = 20000;

  // json 테스트
  static const bool LOCAL_JSON_MODE = false;


}

// 한 계정에 하나의 ssh키만 가질수 있다.
// 맥북의
// 근데 내가 로그인 했던건 내 아이디 인데
