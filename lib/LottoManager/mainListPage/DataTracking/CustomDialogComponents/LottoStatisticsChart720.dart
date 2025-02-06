
import 'package:flutter/cupertino.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:flutter/material.dart';
import 'package:take_it/LottoManager/mainListPage/DataTracking/CustomDialogComponents/lotto720ChartComponents/Lotto720Stats_Chart.dart';

import '../../../../ball_Database/AccessToDatabase720/getLotto720Storage.dart';

class LottoStatisticsChart720 extends StatefulWidget {
  static int lightGray = 0,red = 1, orange = 2, yellow = 3, blue = 4 , purple = 5, gray = 6;

  static final Map<int, Color> ball720Colors = {
    //LottoStatisticsChart720.lightGray: const Color.fromARGB(255, 235, 235, 235), // 밝은 회색
    LottoStatisticsChart720.lightGray: const Color.fromARGB(255, 0, 0, 0), // 밝은 회색
    LottoStatisticsChart720.red: const Color.fromARGB(255, 251, 21, 31),   // 빨간색
    LottoStatisticsChart720.orange: const Color.fromARGB(255, 252, 137, 29), // 주황색
    LottoStatisticsChart720.yellow: const Color.fromARGB(255, 237, 226, 56), // 노란색
    LottoStatisticsChart720.blue: const Color.fromARGB(255, 66, 182, 255),  // 파란색
    LottoStatisticsChart720.purple: const Color.fromARGB(255, 160, 0, 233), // 보라색
    LottoStatisticsChart720.gray: const Color.fromARGB(255, 143, 143, 143), // 회색
  };

  int startNum = 1;
  int lastNum = 1;


  LottoStatisticsChart720(
      this.startNum,this.lastNum, {super.key}
      );
  

  //const ListPage({super.key});

  @override
  LottoChartBuilder createState() => LottoChartBuilder();
}

class LottoChartBuilder extends State<LottoStatisticsChart720> {

  /** 밖 map의 경우 색 분류,
   * 안 map 의 경우 0~9(색별 ID 아님)  당 횟수 */
  Map<int,Map<int,int>> _frequencyMap = {};
  Map<int,Map<int,int>> _bonusFrequencyMap = {};

  /**컬러 통계를 내기위한 변수*/
  Map<int,Map<int,double>> _colors = {};
  /**컬러 통계를 내기위한 변수*/
  Map<int,Map<int,double>> _bonusColors = {};

  List<int> totalColors = [0,0,0,0,0,0,0];
  List<int> totalBonusColors = [0,0,0,0,0,0];

  final bool bonus = true;

  @override
  void initState() {
    super.initState();
    //widget.startNum = -1;
    Lotto720Storage(_setMyColorStats).getLottoFrequency(widget.startNum,widget.lastNum);
  }



  @override
  Widget build(BuildContext context) {
    return (
        Container(
            child: Column(
              children: [
                for(var entry in _colors.entries)
                  Lotto720Stats_Chart(entry.value,entry.key),

                const Divider(
                  color: Colors.black12, // 구분선 색상
                  thickness: 2,       // 두께
                  indent: 20,         // 왼쪽 여백
                  endIndent: 20,      // 오른쪽 여백
                ),
                SizedBox(height: 70),
                Text(
                  'Bonus',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                  ),
                ),

                for(var entry in _bonusColors.entries)
                  Lotto720Stats_Chart(entry.value,entry.key),
              ],
            )
        )
    );
  }

  /**각 color별 %를 알아내기 위한 함수*/
  void _setMyColorStats(
      //Map<int,Map<int,double>> colorStatMap,  //  %를 저장할 map
      Map<int,Map<int,int>> myDataMap,  //  데이들이 존재하는 map
      List<int> myTotalNumList,
      bool bonus
      ){
    //print(";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n${myDataMap}");
    Map<int,Map<int,double>> colorStatMap;

    if(!bonus){
      colorStatMap = _colors;
    }else{
      colorStatMap = _bonusColors;
    }
    //int i=0,j = 0 ;
    setState(() {
      myDataMap.forEach((color,colorMap){ // 컬러별 순회
        //print("-----------------------------------------------------------------j : ${j++}");

        colorMap.forEach((key,value){ // 컬러 -> 넘버별 순회
          //print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++i : ${i++}");

          if (!colorStatMap.containsKey(color)) {
            colorStatMap[color] = {}; // Map<int,double> 생성
          }
          colorStatMap[color] ??= {}; // 없다면 빈 맵으로 초기화



          colorStatMap[color]?[key] =
          (myTotalNumList[color] == 0)
              ?
          0.0
              :
          double.parse(((value / myTotalNumList[color])*100).toStringAsFixed(1));

        });
      });
    });





  }

}
