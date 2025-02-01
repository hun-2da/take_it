import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../LottoStatisticsChart645.dart';

class Lotto645Stats_Chart extends StatefulWidget {

  Map<int,int> _frequencyMap = {};
  /**컬러 통계를 내기위한 변수*/
  Map<int,double> _colorsStat = {};

  Map<int,double> _color = {};
  double chartR;

  Function(Map<int, double>,Map<int, double>) onColorsUpdated;



  /**컬러 통계를 내기위한 변수*/

  //Function(Map<int,double>) getMyColorsMapStates;

  //Function(Map<int, double> colors) getMyColorsMapStates;

  Lotto645Stats_Chart(this._frequencyMap,this._colorsStat,this.chartR,
      {
        required this.onColorsUpdated,
        Key? key,
      }) : super(key: key){
    _color = {
      LottoStatisticsChart645.YellowNum : 0,
      LottoStatisticsChart645.BlueNum : 0,
      LottoStatisticsChart645.RedNum : 0,
      LottoStatisticsChart645.GrayNum : 0,
      LottoStatisticsChart645.GreenNum : 0
    };
  }


  @override
  ChartState createState() => ChartState();



}



class ChartState  extends State<Lotto645Stats_Chart> {
  int touchedIndex = -1;
  late num total;
  @override
  Widget build(BuildContext context) {

    total = widget._frequencyMap.isNotEmpty ? widget._frequencyMap.values.reduce((a, b) => a + b) : 0; // 값의 합 계산 (예외 처리)


    return PieChart(
      PieChartData(
        sections: generateSections(),
        centerSpaceRadius: widget.chartR, // 중앙 공간 설정
        sectionsSpace: 1,     // 섹션 간 간격

        pieTouchData: PieTouchData(// 터치 이벤트 설정

          touchCallback: (FlTouchEvent event, pieTouchResponse) {
            if (event is FlTapUpEvent && pieTouchResponse != null) {

              setState(() {
                touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
              });


              //final value = pieTouchResponse.touchedSection?.touchedSection?.value;

            }

          },
            /*touchCallback: (FlTouchEvent event, pieTouchResponse) {
              if (event is FlLongPressStart && pieTouchResponse != null) {
                setState(() {
                  touchedIndex =
                      pieTouchResponse.touchedSection!.touchedSectionIndex;
                });
              } else if (event is FlLongPressEnd) {
                setState(() {
                  touchedIndex = -1; // 초기화 (선택 해제)
                });
              }
            }*/


        ),


      ),

    );
  }


  /**차트에서 요소를 하나씩 추가하면서 돌릴 예정임*/
  List<PieChartSectionData> generateSections() {
    final List<PieChartSectionData> sections = [];
    //
    //int index = 1;


    //print('||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||$frequencyMap');

    int index = 0;

    widget._frequencyMap.forEach((key, value) {
      // print('==============================================$key');

      String percentage = "${(total == 0 ? 0 : ((value)! / total) * 100).toStringAsFixed(1)}%";
        //debugPrint('Touched section: ${value} ------------------ ${percentage}');


      final bool isTouched = index == touchedIndex;
      sections.add(


        PieChartSectionData(
          color: getPieColor(key,value,widget._color), // 색상 반복 적용
          value: value.toDouble(),
          title: '$key', // 소수점 1자리까지 표시 ${percentage.toStringAsFixed(1)}%
          radius: 77,
          titlePositionPercentageOffset: 1.11,
          titleStyle: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          badgeWidget: isTouched
              ? Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color.fromARGB(203, 47, 48, 53),
              border: Border.all(color: Colors.indigo),
              borderRadius: BorderRadius.circular(7),
            ),
            child: Text(
              '$key 번째 숫자는 : \n$percentage',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 13.7,
                fontWeight: FontWeight.bold
              ),
            ),
          )
              : null,
          badgePositionPercentageOffset: 1,
        ),
      );
      index++;
    });



    //widget.onColorsUpdated(widget._colors);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onColorsUpdated(widget._color,widget._colorsStat);
    });
    //print('X---------------------------------------------------------$myColorsMap----------------------------------------------------------------------------');
    return sections;
  }


  Color? getPieColor(int frequency_key, int frequency_value, Map<int, double> colors){
    int colorIndex = -1;

    if(frequency_key < 11){                               //노랑
      colorIndex = LottoStatisticsChart645.YellowNum;
    }else if(frequency_key < 21){                         //파랑
      colorIndex =  LottoStatisticsChart645.BlueNum;
    }else if(frequency_key < 31){                         //빨강
      colorIndex =  LottoStatisticsChart645.RedNum;
    }else if(frequency_key <41){                         //회색
      colorIndex =  LottoStatisticsChart645.GrayNum;

    }else if(frequency_key < 46){                       // 초록
      colorIndex =  LottoStatisticsChart645.GreenNum;
    }

    colors[colorIndex] = colors[colorIndex]! + frequency_value;

    return LottoStatisticsChart645.ball645Colors?[colorIndex];
  }


}
// widget.onColorsUpdated(widget._colors);