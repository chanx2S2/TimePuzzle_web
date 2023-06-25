import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'DetailPage.dart';
import 'LoginPage.dart';
import 'MyNextHomePage.dart';
import 'SignupPage.dart';
import 'SplashPage.dart';
import 'TimePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TimePuzzle',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(),
      routes: {
        '/next' : (context) => MyNextHomePage(),
        '/detail': (context) => DetailPage(),
        '/time': (context) => TimePage(title: '새로운 시간표'), // 생성자에 title 값 전달
        '/login': (context) => LoginPage(), // 로그인 페이지 추가
        '/signup': (context) => SignupPage(), // 회원가입 페이지 추가
      },
    );
  }
}

