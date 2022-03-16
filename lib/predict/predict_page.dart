import 'package:flutter/material.dart';
import 'package:team4_ing_app/ai/jeju_ai.dart';
import 'package:team4_ing_app/ai/jibang_ai.dart';
import 'package:team4_ing_app/ai/seoul_ai.dart';
import 'package:team4_ing_app/ai/sudo_ai.dart';
import 'package:team4_ing_app/jeju_in_chart/jeju_in_main.dart';
import 'package:team4_ing_app/tabbar/jeju_tabbar.dart';

class PredictPage extends StatefulWidget {
  const PredictPage({Key? key}) : super(key: key);

  @override
  _PredictPageState createState() => _PredictPageState();
}

class _PredictPageState extends State<PredictPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('예측하기'),
        backgroundColor: Colors.orangeAccent,
        elevation: 0, // appbar 밑에 그림자 제거
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 30),
              child: Text(
                '지역 선택',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(500, 100),
                  primary: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                    // 모서리 모양
                    borderRadius: BorderRadius.circular(20.0), // 모서리 모양 둥글게
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SeoulAi();
                  }));
                },
                child: const Text(
                  '서울',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(500, 100),
                  primary: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                    // 모서리 모양
                    borderRadius: BorderRadius.circular(20.0), // 모서리 모양 둥글게
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SudoAi();
                  }));
                },
                child: const Text(
                  '경기∙인천',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(500, 100),
                  primary: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                    // 모서리 모양
                    borderRadius: BorderRadius.circular(20.0), // 모서리 모양 둥글게
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const JibangAi();
                  }));
                },
                child: const Text(
                  '비수도권',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(500, 100),
                  primary: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                    // 모서리 모양
                    borderRadius: BorderRadius.circular(20.0), // 모서리 모양 둥글게
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const JejuAi();
                  }));
                },
                child: const Text(
                  '제주',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
