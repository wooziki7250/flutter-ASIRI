import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_table/json_table.dart';

class JejuJSON extends StatefulWidget {
  const JejuJSON({Key? key}) : super(key: key);

  @override
  _JejuJSONState createState() => _JejuJSONState();
}

class _JejuJSONState extends State<JejuJSON> {
  final String jsonSample =
      '[ { "년" : "2012", "월" : "2", "GDP" : "1440111.4", "초중고합계" : "183", "인구수" : "577094" } , { "년" : "2012", "월" : "3", "GDP" : "1440111.4", "초중고합계" : "183", "인구수" : "577812" } , { "년" : "2012", "월" : "4", "GDP" : "1440111.4", "초중고합계" : "183", "인구수" : "578437" } , { "년" : "2012", "월" : "5", "GDP" : "1440111.4", "초중고합계" : "183", "인구수" : "579260" } , { "년" : "2012", "월" : "6", "GDP" : "1440111.4", "초중고합계" : "183", "인구수" : "579859" } , { "년" : "2012", "월" : "7", "GDP" : "1440111.4", "초중고합계" : "183", "인구수" : "580794" } , { "년" : "2012", "월" : "8", "GDP" : "1440111.4", "초중고합계" : "183", "인구수" : "581340" } , { "년" : "2012", "월" : "9", "GDP" : "1440111.4", "초중고합계" : "183", "인구수" : "582022" } , { "년" : "2012", "월" : "10", "GDP" : "1440111.4", "초중고합계" : "183", "인구수" : "582693" } , { "년" : "2012", "월" : "11", "GDP" : "1440111.4", "초중고합계" : "183", "인구수" : "583293" } , { "년" : "2012", "월" : "12", "GDP" : "1440111.4", "초중고합계" : "183", "인구수" : "583713" } , { "년" : "2013", "월" : "1", "GDP" : "1500819.1", "초중고합계" : "184", "인구수" : "584045" } , { "년" : "2013", "월" : "2", "GDP" : "1500819.1", "초중고합계" : "184", "인구수" : "585231" } , { "년" : "2013", "월" : "3", "GDP" : "1500819.1", "초중고합계" : "184", "인구수" : "586149" } , { "년" : "2013", "월" : "4", "GDP" : "1500819.1", "초중고합계" : "184", "인구수" : "587153" } , { "년" : "2013", "월" : "5", "GDP" : "1500819.1", "초중고합계" : "184", "인구수" : "588001" } , { "년" : "2013", "월" : "6", "GDP" : "1500819.1", "초중고합계" : "184", "인구수" : "588618" } , { "년" : "2013", "월" : "7", "GDP" : "1500819.1", "초중고합계" : "184", "인구수" : "589622" } , { "년" : "2013", "월" : "8", "GDP" : "1500819.1", "초중고합계" : "184", "인구수" : "590450" } , { "년" : "2013", "월" : "9", "GDP" : "1500819.1", "초중고합계" : "184", "인구수" : "591341" } , { "년" : "2013", "월" : "10", "GDP" : "1500819.1", "초중고합계" : "184", "인구수" : "592199" } , { "년" : "2013", "월" : "11", "GDP" : "1500819.1", "초중고합계" : "184", "인구수" : "593004" } , { "년" : "2013", "월" : "12", "GDP" : "1500819.1", "초중고합계" : "184", "인구수" : "593806" } , { "년" : "2014", "월" : "1", "GDP" : "1562928.9", "초중고합계" : "185", "인구수" : "594623" } , { "년" : "2014", "월" : "2", "GDP" : "1562928.9", "초중고합계" : "185", "인구수" : "595913" } , { "년" : "2014", "월" : "3", "GDP" : "1562928.9", "초중고합계" : "185", "인구수" : "596941" } , { "년" : "2014", "월" : "4", "GDP" : "1562928.9", "초중고합계" : "185", "인구수" : "598015" } , { "년" : "2014", "월" : "5", "GDP" : "1562928.9", "초중고합계" : "185", "인구수" : "599122" } , { "년" : "2014", "월" : "6", "GDP" : "1562928.9", "초중고합계" : "185", "인구수" : "600284" } , { "년" : "2014", "월" : "7", "GDP" : "1562928.9", "초중고합계" : "185", "인구수" : "601467" } , { "년" : "2014", "월" : "8", "GDP" : "1562928.9", "초중고합계" : "185", "인구수" : "602521" } , { "년" : "2014", "월" : "9", "GDP" : "1562928.9", "초중고합계" : "185", "인구수" : "603567" } , { "년" : "2014", "월" : "10", "GDP" : "1562928.9", "초중고합계" : "185", "인구수" : "604771" } , { "년" : "2014", "월" : "11", "GDP" : "1562928.9", "초중고합계" : "185", "인구수" : "606072" } , { "년" : "2014", "월" : "12", "GDP" : "1562928.9", "초중고합계" : "185", "인구수" : "607346" } , { "년" : "2015", "월" : "1", "GDP" : "1658020.4", "초중고합계" : "187", "인구수" : "608325" } , { "년" : "2015", "월" : "2", "GDP" : "1658020.4", "초중고합계" : "187", "인구수" : "609612" } , { "년" : "2015", "월" : "3", "GDP" : "1658020.4", "초중고합계" : "187", "인구수" : "611044" } , { "년" : "2015", "월" : "4", "GDP" : "1658020.4", "초중고합계" : "187", "인구수" : "612505" } , { "년" : "2015", "월" : "5", "GDP" : "1658020.4", "초중고합계" : "187", "인구수" : "613858" } , { "년" : "2015", "월" : "6", "GDP" : "1658020.4", "초중고합계" : "187", "인구수" : "615250" } , { "년" : "2015", "월" : "7", "GDP" : "1658020.4", "초중고합계" : "187", "인구수" : "617038" } , { "년" : "2015", "월" : "8", "GDP" : "1658020.4", "초중고합계" : "187", "인구수" : "618447" } , { "년" : "2015", "월" : "9", "GDP" : "1658020.4", "초중고합계" : "187", "인구수" : "620009" } , { "년" : "2015", "월" : "10", "GDP" : "1658020.4", "초중고합계" : "187", "인구수" : "621661" } , { "년" : "2015", "월" : "11", "GDP" : "1658020.4", "초중고합계" : "187", "인구수" : "622952" } , { "년" : "2015", "월" : "12", "GDP" : "1658020.4", "초중고합계" : "187", "인구수" : "624395" } , { "년" : "2016", "월" : "1", "GDP" : "1740779.6", "초중고합계" : "187", "인구수" : "625451" } , { "년" : "2016", "월" : "2", "GDP" : "1740779.6", "초중고합계" : "187", "인구수" : "627442" } , { "년" : "2016", "월" : "3", "GDP" : "1740779.6", "초중고합계" : "187", "인구수" : "629220" } , { "년" : "2016", "월" : "4", "GDP" : "1740779.6", "초중고합계" : "187", "인구수" : "631061" } , { "년" : "2016", "월" : "5", "GDP" : "1740779.6", "초중고합계" : "187", "인구수" : "632802" } , { "년" : "2016", "월" : "6", "GDP" : "1740779.6", "초중고합계" : "187", "인구수" : "634274" } , { "년" : "2016", "월" : "7", "GDP" : "1740779.6", "초중고합계" : "187", "인구수" : "635800" } , { "년" : "2016", "월" : "8", "GDP" : "1740779.6", "초중고합계" : "187", "인구수" : "637172" } , { "년" : "2016", "월" : "9", "GDP" : "1740779.6", "초중고합계" : "187", "인구수" : "638199" } , { "년" : "2016", "월" : "10", "GDP" : "1740779.6", "초중고합계" : "187", "인구수" : "639306" } , { "년" : "2016", "월" : "11", "GDP" : "1740779.6", "초중고합계" : "187", "인구수" : "640488" } , { "년" : "2016", "월" : "12", "GDP" : "1740779.6", "초중고합계" : "187", "인구수" : "641597" } , { "년" : "2017", "월" : "1", "GDP" : "1835698.2", "초중고합계" : "187", "인구수" : "642388" } , { "년" : "2017", "월" : "2", "GDP" : "1835698.2", "초중고합계" : "187", "인구수" : "643736" } , { "년" : "2017", "월" : "3", "GDP" : "1835698.2", "초중고합계" : "187", "인구수" : "644924" } , { "년" : "2017", "월" : "4", "GDP" : "1835698.2", "초중고합계" : "187", "인구수" : "646140" } , { "년" : "2017", "월" : "5", "GDP" : "1835698.2", "초중고합계" : "187", "인구수" : "647547" } , { "년" : "2017", "월" : "6", "GDP" : "1835698.2", "초중고합계" : "187", "인구수" : "648497" } , { "년" : "2017", "월" : "7", "GDP" : "1835698.2", "초중고합계" : "187", "인구수" : "650190" } , { "년" : "2017", "월" : "8", "GDP" : "1835698.2", "초중고합계" : "187", "인구수" : "651888" } , { "년" : "2017", "월" : "9", "GDP" : "1835698.2", "초중고합계" : "187", "인구수" : "653270" } , { "년" : "2017", "월" : "10", "GDP" : "1835698.2", "초중고합계" : "187", "인구수" : "654750" } , { "년" : "2017", "월" : "11", "GDP" : "1835698.2", "초중고합계" : "187", "인구수" : "656013" } , { "년" : "2017", "월" : "12", "GDP" : "1835698.2", "초중고합계" : "187", "인구수" : "657083" } , { "년" : "2018", "월" : "1", "GDP" : "1898192.6", "초중고합계" : "188", "인구수" : "658167" } , { "년" : "2018", "월" : "2", "GDP" : "1898192.6", "초중고합계" : "188", "인구수" : "659189" } , { "년" : "2018", "월" : "3", "GDP" : "1898192.6", "초중고합계" : "188", "인구수" : "660441" } , { "년" : "2018", "월" : "4", "GDP" : "1898192.6", "초중고합계" : "188", "인구수" : "661511" } , { "년" : "2018", "월" : "5", "GDP" : "1898192.6", "초중고합계" : "188", "인구수" : "662633" } , { "년" : "2018", "월" : "6", "GDP" : "1898192.6", "초중고합계" : "188", "인구수" : "663526" } , { "년" : "2018", "월" : "7", "GDP" : "1898192.6", "초중고합계" : "188", "인구수" : "664579" } , { "년" : "2018", "월" : "8", "GDP" : "1898192.6", "초중고합계" : "188", "인구수" : "665517" } , { "년" : "2018", "월" : "9", "GDP" : "1898192.6", "초중고합계" : "188", "인구수" : "666151" } , { "년" : "2018", "월" : "10", "GDP" : "1898192.6", "초중고합계" : "188", "인구수" : "666686" } , { "년" : "2018", "월" : "11", "GDP" : "1898192.6", "초중고합계" : "188", "인구수" : "667064" } , { "년" : "2018", "월" : "12", "GDP" : "1898192.6", "초중고합계" : "188", "인구수" : "667191" } , { "년" : "2019", "월" : "1", "GDP" : "1924498.1", "초중고합계" : "188", "인구수" : "667337" } , { "년" : "2019", "월" : "2", "GDP" : "1924498.1", "초중고합계" : "188", "인구수" : "667522" } , { "년" : "2019", "월" : "3", "GDP" : "1924498.1", "초중고합계" : "188", "인구수" : "668120" } , { "년" : "2019", "월" : "4", "GDP" : "1924498.1", "초중고합계" : "188", "인구수" : "668648" } , { "년" : "2019", "월" : "5", "GDP" : "1924498.1", "초중고합계" : "188", "인구수" : "669328" } , { "년" : "2019", "월" : "6", "GDP" : "1924498.1", "초중고합계" : "188", "인구수" : "669771" } , { "년" : "2019", "월" : "7", "GDP" : "1924498.1", "초중고합계" : "188", "인구수" : "670209" } , { "년" : "2019", "월" : "8", "GDP" : "1924498.1", "초중고합계" : "188", "인구수" : "670521" } , { "년" : "2019", "월" : "9", "GDP" : "1924498.1", "초중고합계" : "188", "인구수" : "670610" } , { "년" : "2019", "월" : "10", "GDP" : "1924498.1", "초중고합계" : "188", "인구수" : "670738" } , { "년" : "2019", "월" : "11", "GDP" : "1924498.1", "초중고합계" : "188", "인구수" : "670895" } , { "년" : "2019", "월" : "12", "GDP" : "1924498.1", "초중고합계" : "188", "인구수" : "670989" } , { "년" : "2020", "월" : "1", "GDP" : "1933152.4", "초중고합계" : "188", "인구수" : "670749" } , { "년" : "2020", "월" : "2", "GDP" : "1933152.4", "초중고합계" : "188", "인구수" : "670876" } , { "년" : "2020", "월" : "3", "GDP" : "1933152.4", "초중고합계" : "188", "인구수" : "670508" } , { "년" : "2020", "월" : "4", "GDP" : "1933152.4", "초중고합계" : "188", "인구수" : "670595" } , { "년" : "2020", "월" : "5", "GDP" : "1933152.4", "초중고합계" : "188", "인구수" : "670793" } , { "년" : "2020", "월" : "6", "GDP" : "1933152.4", "초중고합계" : "188", "인구수" : "671316" } , { "년" : "2020", "월" : "7", "GDP" : "1933152.4", "초중고합계" : "188", "인구수" : "671913" } , { "년" : "2020", "월" : "8", "GDP" : "1933152.4", "초중고합계" : "188", "인구수" : "672524" } , { "년" : "2020", "월" : "9", "GDP" : "1933152.4", "초중고합계" : "188", "인구수" : "672948" } , { "년" : "2020", "월" : "10", "GDP" : "1933152.4", "초중고합계" : "188", "인구수" : "673606" } , { "년" : "2020", "월" : "11", "GDP" : "1933152.4", "초중고합계" : "188", "인구수" : "674001" } , { "년" : "2020", "월" : "12", "GDP" : "1933152.4", "초중고합계" : "188", "인구수" : "674635" } , { "년" : "2021", "월" : "1", "GDP" : "1933152.4", "초중고합계" : "188", "인구수" : "674615" } , { "년" : "2021", "월" : "2", "GDP" : "1933152.4", "초중고합계" : "188", "인구수" : "675137" } , { "년" : "2021", "월" : "3", "GDP" : "1933152.4", "초중고합계" : "188", "인구수" : "673974" } , { "년" : "2021", "월" : "4", "GDP" : "1933152.4", "초중고합계" : "188", "인구수" : "674484" } , { "년" : "2021", "월" : "5", "GDP" : "1933152.4", "초중고합계" : "188", "인구수" : "674877" } , { "년" : "2021", "월" : "6", "GDP" : "1933152.4", "초중고합계" : "188", "인구수" : "675293" } , { "년" : "2021", "월" : "7", "GDP" : "1933152.4", "초중고합계" : "188", "인구수" : "675876" } , { "년" : "2021", "월" : "8", "GDP" : "1933152.4", "초중고합계" : "188", "인구수" : "675883" } , { "년" : "2021", "월" : "9", "GDP" : "1933152.4", "초중고합계" : "188", "인구수" : "676079" } ]';
  bool toggle = true;

  @override
  Widget build(BuildContext context) {
    var json = jsonDecode(jsonSample);
    return Scaffold(
      appBar: AppBar(
        title: const Text('데이터'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(11, 50, 11, 0),
        child: Container(
          child: toggle
              ? Column(
                  children: [
                    JsonTable(
                      json,
                      showColumnToggle: true,
                      allowRowHighlight: true,
                      rowHighlightColor: Colors.yellow[500]!.withOpacity(0.7),
                      paginationRowCount: 11,
                      onRowSelect: (index, map) {
                        print(index);
                        print(map);
                      },
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    const Text("지역 : 제주"),
                    const Text("기간 : 2012년 2월 ~ 2021년 9월"),
                  ],
                )
              : Center(
                  child: Text(getPrettyJSONString(jsonSample)),
                ),
        ),
      ),
    );
  }

  String getPrettyJSONString(jsonObject) {
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    String jsonString = encoder.convert(json.decode(jsonObject));
    return jsonString;
  }
}
