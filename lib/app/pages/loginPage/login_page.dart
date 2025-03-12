import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:lsandroid/app/common/app_theme.dart';
import 'package:lsandroid/app/common/common_appbar_widget.dart';
import 'package:lsandroid/app/common/global_service.dart';
import 'package:lsandroid/app/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController controller = Get.find();
  GlobalService gs = Get.find();
  FocusNode _focusNode = FocusNode();

  String _user_id = '';
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    var keyboardVisibilityController = KeyboardVisibilityController();

   /* _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        // 포커스를 받았을 때 키보드를 명시적으로 열 수 있습니다.
        FocusScope.of(context).requestFocus(_focusNode);
      }
    });
    // 키보드가 보이지 않을 때 포커스 요청
    keyboardVisibilityController.onChange.listen((bool visible) {
      if (!visible) {
        FocusScope.of(context).requestFocus(_focusNode);
      }
    });*/
  }


  Widget idTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '아이디',
          style: AppTheme.a15700
              .copyWith(color: AppTheme.light_text_secondary),
        ),
        const SizedBox(
          height: AppTheme.spacing_xs_8,
        ),
        TextFormField(
         // focusNode: _focusNode,
          style:
          AppTheme.a15500.copyWith(color: AppTheme.light_text_primary),
          textAlignVertical: TextAlignVertical.center,
          controller: controller.idTextController,
          decoration: InputDecoration(
            contentPadding:
            const EdgeInsets.only(left: 16, top: 16, bottom: 16),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: AppTheme.light_ui_06)),
            hintText: '아이디를 입력하세요',
            hintStyle: AppTheme.a15500.copyWith(color: AppTheme.light_ui_05),
          ),
          keyboardType: TextInputType.text,

          /*validator: (value) {
            if (value!.isEmpty) {
              return '아이디를 입력해주세요';
            }
          },
          onSaved: (name) => _user_id = name!,*/
        ),
      ],
    );
  }

  Widget passwordTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '비밀번호',
          style: AppTheme.a15700
              .copyWith(color: AppTheme.light_text_secondary),
        ),
        const SizedBox(
          height: AppTheme.spacing_xs_8,
        ),
        TextFormField(
          style:
          AppTheme.a15500.copyWith(color: AppTheme.light_text_primary),
          textAlignVertical: TextAlignVertical.center,
          controller: controller.pwTextController,
          obscureText: true,
          decoration: InputDecoration(
            contentPadding:
            const EdgeInsets.only(left: 16, top: 16, bottom: 16),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: AppTheme.light_ui_06)),
            hintText: '비밀번호를 입력하세요',
            hintStyle: AppTheme.a15500.copyWith(color: AppTheme.light_ui_05),
          ),
          keyboardType: TextInputType.text,
        ),
      ],
    );
  }


  Widget loginButton() {
    return SizedBox(
      child: TextButton(
        style: ButtonStyle(
            backgroundColor:
            MaterialStateProperty.all<Color>(AppTheme.black),
            padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.only(
                    top: AppTheme.spacing_m_16, bottom: AppTheme.spacing_m_16)),
            shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)))),
        onPressed: () {
          Get.log('로그인 클릭!');
          controller.btnLogin();
        },
        child: Text(
          '로그인',
          style: AppTheme.bodyBody2.copyWith(color: Colors.white),
        ),
      ),
    );
  }


  Widget _textFieldArea() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(
            left: AppTheme.spacing_m_16, right: AppTheme.spacing_m_16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Form(
              key: formKey,
              child: Column(
                children: [
                  idTextField(),
                  const SizedBox(
                    height: AppTheme.spacing_m_16,
                  ),
                  passwordTextField(),
                ],
              ),
            ),
            const SizedBox(
              height: AppTheme.spacing_xxl_32,
            ),
            loginButton(),
            Container(
              height: AppTheme.spacing_xl_24,
            ),

          ],
        ),
      ),
    );
  }

  Widget _logoWidget(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(top: 15, bottom: 60),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: AppTheme.spacing_xl_24,
              ),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [0, 0.23],
                    colors: [AppTheme.white, AppTheme.black,], // List of colors
                  ),
                ),
                padding: EdgeInsets.only(top: 16, bottom: 16),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('ver250307', style: AppTheme.a16700.copyWith(color: AppTheme.white),),
                    SizedBox(width: 24,)
                  ],
                ),
                /*  child: Image.asset(
                        'assets/app/egu2.png', width: 200, height: 50,)*/),
              SizedBox(height: 16,),
              Text(
                'LS전선 모바일 시스템에 오신걸 환영합니다',
                style: AppTheme.bodyBody2.copyWith(color: AppTheme.a969696),
              ),
              Text(
                '서비스를 이용하기 위해 로그인해 주세요',
                style: AppTheme.bodyBody2.copyWith(color: AppTheme.a969696),
              ),
            ],
          ),
        ),
      ),

    );
  }

  Widget _bannerWidget() {
    return SliverToBoxAdapter(
        child: Container(
          padding: const EdgeInsets.only(
              left: AppTheme.spacing_m_16,
              right: AppTheme.spacing_m_16,
              bottom: 34),
          child: Column(
            children: [
              const SizedBox(
                height: AppTheme.spacing_m_16,
              ),
              const SizedBox(
                height: AppTheme.spacing_xxxl_40,
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.light_ui_background,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              // LoginHeader(strTitle: 'strTitle', appBarType: 1),
              _logoWidget(context),
              _textFieldArea(),
              _bannerWidget(),
            ],
          ),
        ],
      ),
    );
  }
}

