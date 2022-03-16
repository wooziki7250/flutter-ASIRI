import 'dart:convert';

import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:team4_ing_app/jeju_out_chart/jeju_out_chart.dart';
import 'package:team4_ing_app/jeju_out_chart/jeju_out_series.dart';
import 'package:http/http.dart' as http; // ***

class JejuOutMain extends StatefulWidget {
  const JejuOutMain({Key? key}) : super(key: key);

  @override
  _JejuOutMainState createState() => _JejuOutMainState();
}

class _JejuOutMainState extends State<JejuOutMain> {
  late List<JejuOutSeries> data;

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
        child: JejuOutChart(data: data),
      ),
    );
  }

  Future<String> getJSONData() async {
    var url =
        Uri.parse('http://localhost:8080/Flutter/jeju_move_out_flutter.jsp');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON['results'];
    setState(() {
      for (int i = 0; i < result.length; i++) {
        data.add(JejuOutSeries(
          year: int.parse(result[i]['year']),
          pop: int.parse(result[i]['pop']),
          barColor: ColorUtil.fromDartColor(Colors.orange),
        ));
      }
    });
    return response.body;
  }
} // End

