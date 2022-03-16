import 'package:flutter/material.dart';
import 'package:team4_ing_app/sudo_in_chart/sudo_in_main.dart';
import 'package:team4_ing_app/sudo_out_chart/sudo_out_main.dart';

class SudoTabbar extends StatefulWidget {
  const SudoTabbar({Key? key}) : super(key: key);

  @override
  _SudoTabbarState createState() => _SudoTabbarState();
}

class _SudoTabbarState extends State<SudoTabbar>
    with SingleTickerProviderStateMixin {
  late TabController controller4;

  @override
  void initState() {
    super.initState();
    controller4 = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    controller4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('경기•인천 인구 이동'),
        backgroundColor: Colors.orangeAccent,
        elevation: 0, // appbar 밑에 그림자 제거
      ),
      body: TabBarView(
        controller: controller4,
        children: const [SudoInMain(), SudoOutMain()],
      ),
      bottomNavigationBar: Container(
        color: Colors.white, // 탭바 색깔
        height: 90,
        child: TabBar(
          indicatorColor: Colors.orange, // 탭바 맨 밑에 이동 표시 막대 색깔
          indicatorWeight: 5,
          indicatorSize: TabBarIndicatorSize.label,
          labelColor: Colors.black, // 글자 색깔
          controller: controller4,
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
