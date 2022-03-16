import 'package:flutter/material.dart';
import 'package:team4_ing_app/gibang_in_chart/gibang_in_main.dart';
import 'package:team4_ing_app/gibang_out_chart/gibang_out_main.dart';

class JibangTabbar extends StatefulWidget {
  const JibangTabbar({Key? key}) : super(key: key);

  @override
  _JibangTabbarState createState() => _JibangTabbarState();
}

class _JibangTabbarState extends State<JibangTabbar>
    with SingleTickerProviderStateMixin {
  late TabController controller5;

  @override
  void initState() {
    super.initState();
    controller5 = TabController(length: 2, vsync: this);
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
        title: const Text('비수도권 인구 이동'),
        backgroundColor: Colors.orangeAccent,
        elevation: 0, // appbar 밑에 그림자 제거
      ),
      body: TabBarView(
        controller: controller5,
        children: const [GibangInMain(), GibangOutMain()],
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
