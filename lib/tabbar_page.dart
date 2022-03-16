import 'package:flutter/material.dart';
import 'package:team4_ing_app/finance_page.dart';
import 'package:team4_ing_app/gdp_page.dart';
import 'package:team4_ing_app/home_page.dart';
import 'package:team4_ing_app/population_page.dart';
import 'package:team4_ing_app/price_page.dart';

class TabbarPage extends StatefulWidget {
  const TabbarPage({Key? key}) : super(key: key);

  @override
  _TabbarPageState createState() => _TabbarPageState();
}

class _TabbarPageState extends State<TabbarPage>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller,
        children: const [
          HomePage(),
          PopulationPage(),
          GdpPage(),
          FinancePage(),
          PricePage()
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white, // 탭바 색깔
        height: 90,
        child: TabBar(
          indicatorColor: Colors.orange, // 탭바 맨 밑에 이동 표시 막대 색깔
          indicatorWeight: 5,
          indicatorSize: TabBarIndicatorSize.label,
          labelColor: Colors.black, // 글자 색깔
          controller: controller,
          tabs: const [
            Tab(
              icon: Icon(
                Icons.home,
                color: Colors.orange,
              ),
              text: 'Home',
            ),
            Tab(
              icon: Icon(
                Icons.people,
                color: Colors.orange,
              ),
              text: '인구',
            ),
            Tab(
              icon: Icon(
                Icons.align_vertical_bottom_outlined,
                color: Colors.orange,
              ),
              text: 'GDP',
            ),
            Tab(
              icon: Icon(
                Icons.attach_money,
                color: Colors.orange,
              ),
              text: '금융',
            ),
            Tab(
              icon: Icon(
                Icons.add_chart_sharp,
                color: Colors.orange,
              ),
              text: '물가',
            ),
          ],
        ),
      ),
    );
  }
}
