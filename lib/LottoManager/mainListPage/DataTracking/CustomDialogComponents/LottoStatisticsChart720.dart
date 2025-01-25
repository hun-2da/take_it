
import 'package:flutter/cupertino.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:flutter/material.dart';

class LottoStatisticsChart720 extends StatefulWidget {

  int startNum = 1;
  int lastNum = 1;


  LottoStatisticsChart720(
      this.startNum,this.lastNum, {super.key}
      );



 final ballColors = [
    const Color.fromARGB(1,237, 226, 56), //노란색
    const Color.fromARGB(1,66, 182, 255), //파란색
    const Color.fromARGB(1,251, 21, 31),  //빨간색
    const Color.fromARGB(1,103, 249, 106),  // 초록색
    const Color.fromARGB(1,143, 143, 143),  //회색
    const Color.fromARGB(1,252, 137, 29),  //주황색
    const Color.fromARGB(1,160, 0, 233),  //보라색
    const Color.fromARGB(1,252, 137, 29),  //주황색
    const Color.fromARGB(1,235, 235, 235),  //밝은 회색
    // Colors.pink, Colors.teal, Colors.cyan, Colors.brown
  ];

  final Map<String, Color> ball720Colors = {
    'lightGray': const Color.fromARGB(255, 235, 235, 235), // 밝은 회색
    'red': const Color.fromARGB(255, 251, 21, 31),   // 빨간색
    'orange': const Color.fromARGB(255, 252, 137, 29), // 주황색
    'yellow': const Color.fromARGB(255, 237, 226, 56), // 노란색
    'blue': const Color.fromARGB(255, 66, 182, 255),  // 파란색
    'purple': const Color.fromARGB(255, 160, 0, 233), // 보라색
    'gray': const Color.fromARGB(255, 143, 143, 143), // 회색
  };
  //const ListPage({super.key});

  @override
  LottoChartBuilder createState() => LottoChartBuilder();
}

class LottoChartBuilder extends State<LottoStatisticsChart720> {



  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return (
        Container(
          child: Column(
            children: [

         /* BarChart(
                BarChartData(
                  barGroups: _buildBarGroups(data),
                  titlesData: FlTitlesData(
                    leftTitles: SideTitles(
                      showTitles: true,
                      getTitles: (value) => value.toInt().toString(), // Y축 레이블
                    ),
                    bottomTitles: SideTitles(
                      showTitles: true,
                      getTitles: (value) => value.toInt().toString(), // X축 레이블
                    ),
                  ),
                  borderData: FlBorderData(show: true),
                  gridData: FlGridData(show: true),
                ),
              )*/



            ],
          )
        )
    );
  }

/*List<BarChartGroupData> _buildBarGroups(Map<int, int> data) {
    return data.entries.map((entry) {
      return BarChartGroupData(
        x: entry.key, // X축 값
        barRods: [
          BarChartRodData(
            y: entry.value.toDouble(), // Y축 값
            colors: [Colors.blue], // 막대 색상
            width: 16,
          ),
        ],
      );
    }).toList();
  }*/


}
