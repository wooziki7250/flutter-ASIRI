import 'package:flutter/material.dart';
import 'package:team4_ing_app/jeju_in_chart/jeju_in_main.dart';
import 'package:team4_ing_app/jeju_out_chart/jeju_out_main.dart';

class JejuTabbar extends StatefulWidget {
  const JejuTabbar({Key? key}) : super(key: key);

  @override
  _JejuTabbarState createState() => _JejuTabbarState();
}

class _JejuTabbarState extends State<JejuTabbar>
    with SingleTickerProviderStateMixin {
  late TabController controller2;

  @override
  void initState() {
    super.initState();
    controller2 = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('제주 인구 이동'),
        backgroundColor: Colors.orangeAccent,
        elevation: 0, // appbar 밑에 그림자 제거
      ),
      body: TabBarView(
        controller: controller2,
        children: const [JejuInMain(), JejuOutMain()],
      ),
      bottomNavigationBar: Container(
        color: Colors.white, // 탭바 색깔
        height: 90,
        child: TabBar(
          indicatorColor: Colors.orange, // 탭바 맨 밑에 이동 표시 막대 색깔
          indicatorWeight: 5,
          indicatorSize: TabBarIndicatorSize.label,
          labelColor: Colors.black, // 글자 색깔
          controller: controller2,
          tabs: const [
            Tab(
              child: Text(
                '총전입',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ),
            Tab(
              child: Text(
                '총전출',
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
