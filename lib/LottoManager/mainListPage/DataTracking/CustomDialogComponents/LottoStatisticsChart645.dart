import 'package:fl_chart/fl_chart.dart';

import 'package:flutter/material.dart';
import 'package:take_it/LottoManager/mainListPage/DataTracking/CustomDialogComponents/lotto645chartComponents/Lotto645Stats_Chart.dart';
import 'package:take_it/LottoManager/mainListPage/DataTracking/CustomDialogComponents/lotto645chartComponents/Lotto645Stats_Text.dart';

import '../../../../ball_Database/AccessToDatabase645/getLotto645Storage.dart';

class LottoStatisticsChart645 extends StatefulWidget {
  static int YellowNum = 0,BlueNum = 1, RedNum = 2, GrayNum = 3, GreenNum = 4;

  static Map<int, Color>? ball645Colors = {
    0: const Color.fromARGB(255, 237, 222, 56), // 노란색
    1: const Color.fromARGB(255, 66, 182, 255),  // 파란색
    2: const Color.fromARGB(255, 251, 21, 31),   // 빨간색
    3: const Color.fromARGB(255, 143, 143, 143), // 회색
    4: const Color.fromARGB(255, 103, 249, 106), // 초록색
    -1: Colors.black
  };


  int startNum = 1;
  int lastNum = 1;



  LottoStatisticsChart645(
      this.startNum,this.lastNum, {super.key}
      );

  //const ListPage({super.key});

  @override
  LottoChartBuilder createState() => LottoChartBuilder();
}

class LottoChartBuilder extends State<LottoStatisticsChart645> {


  /**일반 빈도를 직접적으로 측정한 변수*/
  Map<int, int> _frequencyMap = {};
  /**보너스 빈도를 직접적으로 측정한 변수*/
  Map<int, int> _bonusFrequencyMap = {};

  /**컬러 통계를 내기위한 변수*/
  Map<int,double> _colors = {};

  /**컬러 통계를 내기위한 변수*/
  Map<int,double> _bonusColors = {};

  late int colorSwitch;



  bool BonusColor = true;

  @override
  void initState() {
    super.initState();
    _bonusColors = {
      LottoStatisticsChart645.YellowNum : 0,
      LottoStatisticsChart645.BlueNum : 0,
      LottoStatisticsChart645.RedNum : 0,
      LottoStatisticsChart645.GrayNum : 0,
      LottoStatisticsChart645.GreenNum : 0
    };
    _colors = {
      LottoStatisticsChart645.YellowNum : 0,
      LottoStatisticsChart645.BlueNum : 0,
      LottoStatisticsChart645.RedNum : 0,
      LottoStatisticsChart645.GrayNum : 0,
      LottoStatisticsChart645.GreenNum : 0
    };
    Lotto645Storage(setMydbList).getLottoFrequency(widget.startNum,widget.lastNum);

    colorSwitch = 0;
  }

  void setMydbList( Map<int, int> frequencyMap ,Map<int, int> bonusFrequencyMap ){
    setState(() {
      this._frequencyMap = frequencyMap;
      this._bonusFrequencyMap = bonusFrequencyMap;
    });
  }

  @override
  Widget build(BuildContext context) {

    return
      Column(
        children: [
          Lotto645Stats_Text(_colors,!BonusColor),
          //const SizedBox(height: 30),
          // 첫 번째 PieChart
          SizedBox(

            width: 310, // 고정 너비
            height: 310, // 고정 높이
            child: Lotto645Stats_Chart(_frequencyMap, _colors,77,onColorsUpdated: getMyColorsMapStates),
          ),
          const SizedBox(height: 37), // 간격

          Divider(
            color: Colors.black12, // 구분선 색상
            thickness: 2,       // 두께
            indent: 20,         // 왼쪽 여백
            endIndent: 20,      // 오른쪽 여백
          ),
          const SizedBox(height: 37), // 간격

          Lotto645Stats_Text(_bonusColors,BonusColor),
          // 두 번째 PieChart
          SizedBox(
            width: 220, // 고정 너비
            height: 240, // 고정 높이
            child: Lotto645Stats_Chart(_bonusFrequencyMap,_bonusColors,37,onColorsUpdated: getMyColorsMapStates),
          ),

          const SizedBox(height: 37),
          //const SizedBox(height: 37), // 간격
        ],

      );
  }
  void getMyColorsMapStates(Map<int,double> colors,Map<int,double> colorState) {
    double total = colors.isNotEmpty ? colors.values.reduce((a, b) => a + b) : 0;
    //print('$widget._colors++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');

    if (total != 0 && colorSwitch < 4) {


      setState(() {
        colors.forEach((color, sum) {
          colorState[color] = total == 0 ? 0.0 : double.parse(
              ((sum / total) * 100).toStringAsFixed(1));
        });
        //print('||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||$widget._colors');
      });
      colorSwitch++;
    }



  }

}