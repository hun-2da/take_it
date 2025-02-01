import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../LottoStatisticsChart645.dart';
import '../LottoStatisticsChart720.dart';

class Lotto720Stats_Chart extends StatefulWidget {


  Map<int,double> _colorStat = {};

  //Map<int,double> _color = {};

  int chartColor = 0;


  //Function(Map<int, double>,Map<int, double>) onColorsUpdated;
  //Map<int,int> _frequencyMap = {};
  /**컬러 통계를 내기위한 변수*/
  /**컬러 통계를 내기위한 변수*/
  //double chartR;
  //Function(Map<int,double>) getMyColorsMapStates;

  //Function(Map<int, double> colors) getMyColorsMapStates;



  Lotto720Stats_Chart(this._colorStat,this.chartColor);


  @override
  ChartState createState() => ChartState();



}

class ChartState extends State<Lotto720Stats_Chart> {

  @override
  Widget build(BuildContext context) {

    print("=============================================${widget._colorStat}");
    // TODO: implement build

    return  SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child : Padding(
          padding: EdgeInsets.all(5),
          child: Container(
            width: 9* 40.0, // 데이터 개수에 따라 폭 설정
            height: 200,

            child: BarChart(
              BarChartData(
                maxY: widget._colorStat.isNotEmpty ? widget._colorStat.values.reduce((a, b) => a > b ? a : b) + 17.7 : 10,
                barGroups: _buildBarGroups(widget._colorStat),
                barTouchData: barTouch(),
                titlesData: FlTitlesData(
                    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false),),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          // X축 값 그대로 레이블로 표시
                          return Text(
                            value.toInt().toString(),
                            style: TextStyle(fontSize: 12),
                          );
                        },
                        reservedSize: 40, // 레이블 영역 크기
                      ),
                    )
                ),
                borderData: FlBorderData(
                    show: true
                ),
                gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false

                ),
              ),
            ),
          ),
        )
    );
  }
  List<BarChartGroupData> _buildBarGroups(Map<int,double> colorStat){

    return colorStat.entries.map((entry) {
      return BarChartGroupData(
        x: entry.key, // X축 값
        barRods: [
          BarChartRodData(
            toY:  entry.value,
            color: LottoStatisticsChart720.ball720Colors[widget.chartColor], // 막대 색상
            borderRadius: BorderRadius.circular(0),
          ),
        ],
      );
    }).toList();
  }

  BarTouchData barTouch(){
    return BarTouchData(
      touchTooltipData: BarTouchTooltipData(

        getTooltipItem: (group, groupIndex, rod, rodIndex) {
          return BarTooltipItem(
            '${groupIndex + 1} 번째 숫자는 : ${rod.toY}',
            TextStyle(
              color: Colors.white,
              fontSize: 13.7,
              fontWeight: FontWeight.bold,
            ),
          );
        },
      ),
    );
  }

}