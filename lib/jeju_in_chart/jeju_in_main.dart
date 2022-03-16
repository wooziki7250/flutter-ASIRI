import 'dart:convert';

import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:team4_ing_app/jeju_in_chart/jeju_in_chart.dart';
import 'package:team4_ing_app/jeju_in_chart/jeju_in_series.dart';
import 'package:http/http.dart' as http; // ***

class JejuInMain extends StatefulWidget {
  const JejuInMain({Key? key}) : super(key: key);

  @override
  _JejuInMainState createState() => _JejuInMainState();
}

class _JejuInMainState extends State<JejuInMain> {
  late List<JejuInSeries> data;

  @override
  void initState() {
    super.initState();
    data = [];
    getJSONData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: JejuInChart(data: data),
      ),
    );
  }

  Future<String> getJSONData() async {
    var url =
        Uri.parse('http://localhost:8080/Flutter/jeju_move_in_flutter.jsp');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON['results'];
    setState(() {
      for (int i = 0; i < result.length; i++) {
        data.add(JejuInSeries(
          year: int.parse(result[i]['year']),
          pop: int.parse(result[i]['pop']),
          barColor: ColorUtil.fromDartColor(Colors.orange),
        ));
      }
    });
    return response.body;
  }
} // End

