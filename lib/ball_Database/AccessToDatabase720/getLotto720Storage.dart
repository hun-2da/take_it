import 'package:sqflite/sqflite.dart';

import '../../LottoManager/mainListPage/DataTracking/CustomDialogComponents/LottoStatisticsChart720.dart';
import '../../LottoManager/mainListPage/ListPage.dart';
import '../DatabaseHelper.dart';

class Lotto720Storage{

  final Function(
      Map<int,Map<int,int>> myDataMap,  //  데이들이 존재하는 map
      List<int> myTotalNumList,
      bool bonus
      ) _setMyColorStats;

  final bool bonus = true;

  Lotto720Storage(this._setMyColorStats);

  void getLottoFrequency(int startNum, int endNum) async {

    if(startNum == -1) {
      startNum = 1;
      endNum = ListPage.round720;
    }


    Database db =  await LogDatabaseHelper.instance.database;

    final List<Map<String, dynamic>> result = await db.query(
      LogDatabaseHelper.table720Name,
          columns: [
            LogDatabaseHelper.columnPrize720_1,
            LogDatabaseHelper.columnBonus720
          ],
      where: '${LogDatabaseHelper.columnId720} BETWEEN ? AND ?',          // 특정 범위에 대해 BETWEEN를 사용하여 범위를 지정 ?는 아래에서 각 선택됨
      whereArgs: [startNum, endNum],
      // 해당 구조는 sqlInjection을 예방이 가능, 가독성 증가 등의 이점이 존재
    );

    Map<int,Map<int,int>> frequencyMap = {};
    _initMap(frequencyMap,!bonus);
    Map<int,Map<int,int>> bonusFrequencyMap = {};
    _initMap(bonusFrequencyMap,bonus);
    List<int> totalColors = [0,0,0,0,0,0,0];
    List<int> totalBonusColors = [0,0,0,0,0,0,0];

    for (var row in result) {
      String prizeNumber = row[LogDatabaseHelper.columnPrize720_1]; // 데이터 값 추출 _ 현재는 조가 포함된 숫자열 6 _ 총 7자리
      setMyFrequencyMap(frequencyMap,totalColors,prizeNumber,!bonus);

      String bonusNumber = row[LogDatabaseHelper.columnBonus720]; // 조 _ 가 제외된 숫자 6자리
      setMyFrequencyMap(bonusFrequencyMap,totalBonusColors,bonusNumber,bonus);

    }

    _setMyColorStats(frequencyMap,totalColors,!bonus);
    _setMyColorStats(bonusFrequencyMap,totalBonusColors,bonus);

  }
  void setMyFrequencyMap(
      Map<int,Map<int,int>> frequencyMap,
      List<int> totalColors,
      String prizeNumber,
      bool bonus)
  {

    int i = (!bonus) ? 0 : 1;

    List<String> splitNumber = prizeNumber.split('');

    for(var placeValue in splitNumber){
      int num;
      try{
        num = int.parse(placeValue);
      }catch(e){
        continue;
      }


      //frequencyMap[i]?[num] = frequencyMap[i]![num]! + 1;
      totalColors[i] += 1;
      frequencyMap.putIfAbsent(i, () => {});
      frequencyMap[i]!.update(num, (value) => value + 1, ifAbsent: () => 1);


      i++;

    }

  }
  void _initMap(Map<int,Map<int,int>> colorMap,bool bonus){
    // 조건에 따라 lightGray 추가
    if (!bonus) {
      colorMap[LottoStatisticsChart720.lightGray] = {
        1: 0, 2: 0, 3: 0, 4: 0, 5: 0
      }; // 조
    }
    // 다른 공 데이터를 추가
    colorMap[LottoStatisticsChart720.red] = {
      0: 0, 1: 0, 2: 0, 3: 0, 4: 0, 5: 0, 6: 0, 7: 0, 8: 0, 9: 0
    }; // 빨간공

    colorMap[LottoStatisticsChart720.orange] = {
      0: 0, 1: 0, 2: 0, 3: 0, 4: 0, 5: 0, 6: 0, 7: 0, 8: 0, 9: 0
    }; // 주황공

    colorMap[LottoStatisticsChart720.yellow] = {
      0: 0, 1: 0, 2: 0, 3: 0, 4: 0, 5: 0, 6: 0, 7: 0, 8: 0, 9: 0
    }; // 노란공

    colorMap[LottoStatisticsChart720.blue] = {
      0: 0, 1: 0, 2: 0, 3: 0, 4: 0, 5: 0, 6: 0, 7: 0, 8: 0, 9: 0
    }; // 파란공

    colorMap[LottoStatisticsChart720.purple] = {
      0: 0, 1: 0, 2: 0, 3: 0, 4: 0, 5: 0, 6: 0, 7: 0, 8: 0, 9: 0
    }; // 보라공

    colorMap[LottoStatisticsChart720.gray] = {
      0: 0, 1: 0, 2: 0, 3: 0, 4: 0, 5: 0, 6: 0, 7: 0, 8: 0, 9: 0
    }; // 회색공
  }
}