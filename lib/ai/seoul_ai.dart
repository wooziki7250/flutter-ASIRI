import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:team4_ing_app/seoul_json.dart'; // 미리 적어주기

class SeoulAi extends StatefulWidget {
  const SeoulAi({Key? key}) : super(key: key);

  @override
  _SeoulAiState createState() => _SeoulAiState();
}

class _SeoulAiState extends State<SeoulAi> {
  TextEditingController yearController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController kospiController = TextEditingController();
  TextEditingController gdpController = TextEditingController();
  TextEditingController seoulAptSaleController = TextEditingController();
  TextEditingController highSaleController = TextEditingController();

  String stepResult = '';

  late String year;
  late String month;

  late double kospi;
  double kospiMean = 2166.064;
  double kospiSd = 330.7283;

  late double gdp;
  double gdpMean = 36.73905;
  double gdpSd = 4.478034;

  late double seoulAptSale;
  double seoulAptSaleMean = 10864.44;
  double seoulAptSaleSd = 4247.025;

  late double high;
  double highMean = 318.8476;
  double highSd = 1.116149;

  late String step3;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    yearController.text = '2021';
    monthController.text = '9';
    kospiController.text = '3068.82';
    gdpController.text = '47.3';
    seoulAptSaleController.text = '5759';
    highSaleController.text = '320';
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
          title: const Text('서울 아파트 평균 매매가격 변동률 예측'),
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
                    controller: kospiController,
                    decoration: const InputDecoration(
                      labelText: '이번달 코스피지수',
                    ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: TextField(
                    controller: gdpController,
                    decoration: const InputDecoration(
                      labelText: '금년 GDP 비율',
                    ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: TextField(
                    controller: highSaleController,
                    decoration: const InputDecoration(
                      labelText: '금년 고등학교 수 합계',
                    ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: TextField(
                    controller: seoulAptSaleController,
                    decoration: const InputDecoration(
                      labelText: '지난달 수도권 아파트 거래량',
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
                        kospi = (double.parse(kospiController.text.toString()) -
                                kospiMean) /
                            kospiSd;
                        gdp = (double.parse(gdpController.text.toString()) -
                                gdpMean) /
                            gdpSd;
                        seoulAptSale = (double.parse(
                                    seoulAptSaleController.text.toString()) -
                                seoulAptSaleMean) /
                            seoulAptSaleSd;
                        high =
                            (double.parse(highSaleController.text.toString()) -
                                    highMean) /
                                highSd;
                        getJSONData();
                      },
                      child: const Text('입력'),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const SeoulJSON();
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
        'http://localhost:8080/Flutter/seoul.jsp?year=$year&month=$month&kospi=$kospi&gdp=$gdp&seoul_apt_sale=$seoulAptSale&high=$high');
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
        resultStr = '0.0008% 미만 하락이';
        // bmiImage = 'images/underweight.png';
      } else if (step3 == '2') {
        resultStr = '0% ~ 0.38% 상승이';
        // bmiImage = 'images/normal.png';
      } else {
        resultStr = '1.2% 이상 상승할 것으로';
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
