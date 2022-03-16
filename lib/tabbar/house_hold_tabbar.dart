import 'package:flutter/material.dart';
import 'package:team4_ing_app/house_hold_chart/gibang_main.dart';
import 'package:team4_ing_app/house_hold_chart/national_main.dart';
import 'package:team4_ing_app/house_hold_chart/sudo_main.dart';

class HouseHoldTabbar extends StatefulWidget {
  const HouseHoldTabbar({Key? key}) : super(key: key);

  @override
  _HouseHoldTabbarState createState() => _HouseHoldTabbarState();
}

class _HouseHoldTabbarState extends State<HouseHoldTabbar>
    with SingleTickerProviderStateMixin {
  late TabController controller5;

  @override
  void initState() {
    super.initState();
    controller5 = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller5.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('가구부채'),
        backgroundColor: Colors.orangeAccent,
        elevation: 0, // appbar 밑에 그림자 제거
      ),
      body: TabBarView(
        controller: controller5,
        children: const [NationalMain(), SudoMain(), GibangMain()],
      ),
      bottomNavigationBar: Container(
        color: Colors.white, // 탭바 색깔
        height: 90,
        child: TabBar(
          indicatorColor: Colors.orange, // 탭바 맨 밑에 이동 표시 막대 색깔
          indicatorWeight: 5,
          indicatorSize: TabBarIndicatorSize.label,
          labelColor: Colors.black, // 글자 색깔
          controller: controller5,
          tabs: const [
            Tab(
              child: Text(
                '전국',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ),
            Tab(
              child: Text(
                '수도권',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ),
            Tab(
              child: Text(
                '비수도권',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
