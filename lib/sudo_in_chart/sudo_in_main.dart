import 'dart:convert';

import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:team4_ing_app/sudo_in_chart/sudo_in_chart.dart';
import 'package:team4_ing_app/sudo_in_chart/sudo_in_series.dart';
import 'package:http/http.dart' as http;

class SudoInMain extends StatefulWidget {
  const SudoInMain({Key? key}) : super(key: key);

  @override
  _SudoInMainState createState() => _SudoInMainState();
}

class _SudoInMainState extends State<SudoInMain> {
  late List<SudoInSeries> data;

  @override
  void initState() {
    super.initState();
    data = [];
    getJSONData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('경기•인천 총전입 차트'),
      ),
      body: Center(
        child: SudoInChart(data: data),
      ),
    );
  }

  Future<String> getJSONData() async {
    var url =
        Uri.parse('http://localhost:8080/Flutter/sudo_move_in_flutter.jsp');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON['results'];
    setState(() {
      for (int i = 0; i < result.length; i++) {
        data.add(SudoInSeries(
          year: int.parse(result[i]['year']),
          pop: int.parse(result[i]['pop']),
          barColor: ColorUtil.fromDartColor(Colors.orange),
        ));
      }
    });
    return response.body;
  }
} // End

