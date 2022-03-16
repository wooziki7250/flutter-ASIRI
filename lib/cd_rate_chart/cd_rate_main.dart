import 'dart:convert';

import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:team4_ing_app/cd_rate_chart/cd_rate_chart.dart';
import 'package:team4_ing_app/cd_rate_chart/cd_rate_series.dart';
import 'package:http/http.dart' as http;

class CdRateMain extends StatefulWidget {
  const CdRateMain({Key? key}) : super(key: key);

  @override
  _CdRateMainState createState() => _CdRateMainState();
}

class _CdRateMainState extends State<CdRateMain> {
  late List<CdRateSeries> data;

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
        title: const Text('CD유통수익률 91일'),
      ),
      body: Center(
        child: CdRateChart(data: data),
      ),
    );
  }

  Future<String> getJSONData() async {
    var url =
        Uri.parse('http://localhost:8080/Flutter/cd_for_sqldb_flutter.jsp');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON['results'];
    setState(() {
      for (int i = 0; i < result.length; i++) {
        data.add(CdRateSeries(
          year: int.parse(result[i]['year']),
          rate: double.parse(result[i]['rate']),
          barColor: ColorUtil.fromDartColor(Colors.red),
        ));
      }
    });
    return response.body;
  }
}
