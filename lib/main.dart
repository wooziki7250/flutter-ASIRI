import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:team4_ing_app/finance_page.dart';
import 'package:team4_ing_app/gdp_page.dart';
import 'package:team4_ing_app/home_page.dart';
import 'package:team4_ing_app/login.dart';
import 'package:team4_ing_app/population_page.dart';
import 'package:team4_ing_app/price_page.dart';
import 'package:team4_ing_app/tabbar_page.dart';

void main() {
  KakaoContext.clientId = '62c3403831adbeba89528e0f5daf8eab';

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false, // 왼쪽 상단의 debug 뱃지 제거
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) {
          return const TabbarPage();
        },
        '/homePage': (context) {
          return const HomePage();
        },
        '/populationPage': (context) {
          return const PopulationPage();
        },
        '/gdpPage': (context) {
          return const GdpPage();
        },
        '/financePage': (context) {
          return const FinancePage();
        },
        '/pricePage': (context) {
          return const PricePage();
        },
        '/login': (context) {
          return const LoginPage();
        }
      },
    );
  }
}
