import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:team4_ing_app/jeju_json.dart'; // 미리 적어주기

class JejuAi extends StatefulWidget {
  const JejuAi({Key? key}) : super(key: key);

  @override
  _JejuAiState createState() => _JejuAiState();
}

class _JejuAiState extends State<JejuAi> {
  TextEditingController yearController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController nominalGDPController = TextEditingController();
  TextEditingController schoolController = TextEditingController();
  TextEditingController popController = TextEditingController();

  String stepResult = '';

  late String year;
  late String month;

  late double nominalGDP;
  double nominalGDPMean = 1738257;
  double nominalGDPSd = 180924.5;

  late double school;
  double schoolMean = 186.4554;
  double schoolSd = 1.746567;

  late double pop;
  double popMean = 634133.2;
  double popSd = 34101.21;

  late String step3;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    yearController.text = '2021';
    monthController.text = '9';
    nominalGDPController.text = '1933152';
    schoolController.text = '188';
    popController.text = '676079';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // 화면 눌렀을 때 키보드 사라짐
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('제주 아파트 평균 매매가격 변동률 예측'),
          backgroundColor: Colors.orangeAccent,
        ),
        body: SingleChildScrollView(
          // 공사장 표시 나올 때
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: TextField(
                    controller: yearController,
                    decoration: const InputDecoration(
                      labelText: '예측희망 연도',
                    ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: TextField(
                    controller: monthController,
                    decoration: const InputDecoration(
                      labelText: '예측희망 월',
                    ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: TextField(
                    controller: nominalGDPController,
                    decoration: const InputDecoration(
                      labelText: '국민총생산 명목 GDP',
                    ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: TextField(
                    controller: schoolController,
                    decoration: const InputDecoration(
                      labelText: '금년 초등학교, 중학교, 고등학교 수 합계',
                    ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: TextField(
                    controller: popController,
                    decoration: const InputDecoration(
                      labelText: '금년 제주 인구수',
                    ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        year = yearController.text.toString();
                        month = monthController.text.toString();
                        nominalGDP = (double.parse(
                                    nominalGDPController.text.toString()) -
                                nominalGDPMean) /
                            nominalGDPSd;
                        school =
                            (double.parse(schoolController.text.toString()) -
                                    schoolMean) /
                                schoolSd;
                        pop = (double.parse(popController.text.toString()) -
                                popMean) /
                            popSd;
                        getJSONData();
                      },
                      child: const Text('입력'),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const JejuJSON();
                        }));
                      },
                      icon: const Icon(
                        Icons.contact_support_outlined,
                        size: 20,
                      ),
                      label: const Text('데이터 보기'),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.orange[50]),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('images/apt.png'),
                    radius: 100,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  getJSONData() async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/jeju.jsp?year=$year&month=$month&nominalGDP=$nominalGDP&school=$school&pop=$pop');
    var response = await http.get(url);
    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      step3 = dataConvertedJSON['step3'];
    });
    _showDialog(context, step3);
  }

  _showDialog(BuildContext context, String step3) {
    setState(() {
      String resultStr;
      if (step3 == '1') {
        resultStr = '0.08% 미만 하락이';
        // bmiImage = 'images/underweight.png';
      } else if (step3 == '2') {
        resultStr = '0% ~ 0.11% 상승이';
        // bmiImage = 'images/normal.png';
      } else {
        resultStr = '1.9% 이상 상승할 것으로';
        // bmiImage = 'images/obese.png';
      }
      stepResult = '이전달 대비 아파트 평균매매가는 $resultStr 예측됩니다.';
    });

    showDialog(
        context: context,
        builder: (BuildContext contex) {
          return AlertDialog(
            title: const Text('변동률 예측 결과'),
            content: Text(stepResult),
            actions: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      // imageName = result;
                    });
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'))
            ],
          );
        });
  }
}
