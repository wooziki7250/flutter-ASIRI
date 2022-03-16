import 'dart:convert';

import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:team4_ing_app/seoul_in_chart/seoul_in_chart.dart';
import 'package:team4_ing_app/seoul_in_chart/seoul_in_series.dart';
import 'package:http/http.dart' as http;

class SeoulInMain extends StatefulWidget {
  const SeoulInMain({Key? key}) : super(key: key);

  @override
  _SeoulInMainState createState() => _SeoulInMainState();
}

class _SeoulInMainState extends State<SeoulInMain> {
  late List<SeoulInSeries> data;

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
        title: const Text('서울 총전입 차트'),
      ),
      body: Center(
        child: SeoulInChart(data: data),
      ),
    );
  }

  Future<String> getJSONData() async {
    var url =
        Uri.parse('http://localhost:8080/Flutter/seoul_move_in_flutter.jsp');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON['results'];
    setState(() {
      for (int i = 0; i < result.length; i++) {
        data.add(SeoulInSeries(
          year: int.parse(result[i]['year']),
          pop: int.parse(result[i]['pop']),
          barColor: ColorUtil.fromDartColor(Colors.orange),
        ));
      }
    });
    return response.body;
  }
} // End

