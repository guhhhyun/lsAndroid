


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:lsandroid/app/net/http_util.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app/common/color_schemes.g.dart';
import 'app/common/init_binding.dart';

import 'app/common/logger_utils.dart';
import 'app/routes/app_route.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  HttpUtil.init();

  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      color: Colors.white,
      builder: (context, child) {
        return MediaQuery(
          // 스마트폰 기기 자체 폰트 사이즈 무시하기.
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: child!);
      },
      title: "LS전선",
      debugShowCheckedModeBanner: false,
      logWriterCallback: Logger.write,
      defaultTransition: Transition.fadeIn,
      initialBinding: InitBinding(),
      getPages: AppRoute.routes,
      initialRoute: Routes.SPLASH,
      themeMode: ThemeMode.system,
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme,
          fontFamily: 'NotoSansKR'
      ),
        localizationsDelegates: [
          // 앱의 로컬라이제이션을 구성합니다.
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],

      supportedLocales: [
        const Locale('ko','KR'),
      ],
      //locale: ui.window.locale,
    );
  }
}
