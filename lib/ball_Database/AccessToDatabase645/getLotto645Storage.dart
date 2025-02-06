import 'package:html/parser.dart';
import 'package:sqflite/sqflite.dart';

import '../../LottoManager/ChoiceButtonItem/RoundToDate.dart';
import '../../LottoManager/mainListPage/ListPage.dart';
import '../DatabaseHelper.dart';

class Lotto645Storage{


  final Function(Map<int, int>,Map<int, int>) setMydbList;

  Lotto645Storage(this.setMydbList);


  void/*Future<Map<int, int>>*/ getLottoFrequency(int startNum, int endNum) async {

    if(startNum == -1) {
      startNum = 1;
      endNum = ListPage.round645;
    }

    print('------------------------------------------------$startNum--------------------$endNum');
    //final db = await database;
    Database db =  await LogDatabaseHelper.instance.database;
    // SQL 쿼리 실행
    final List<Map<String, dynamic>> result = await db.query(

      LogDatabaseHelper.table645Name,
      columns: [
        LogDatabaseHelper.columnPrize645_1,
        LogDatabaseHelper.columnPrize645_2,
        LogDatabaseHelper.columnPrize645_3,
        LogDatabaseHelper.columnPrize645_4,
        LogDatabaseHelper.columnPrize645_5,
        LogDatabaseHelper.columnPrize645_6,
        LogDatabaseHelper.columnBonus645
      ],
      where: '${LogDatabaseHelper.columnId645} BETWEEN ? AND ?',
      whereArgs: [startNum, endNum],
    );

    // 빈도수 저장 Map 초기화
    Map<int, int> frequencyMap = {};
    Map<int, int> bonusFrequencyMap = {};

    // 1부터 45까지 초기화
    for (int i = 0; i <= 45; i++) {

      if(i!=0) {
        frequencyMap[i] = 0;
        bonusFrequencyMap[i] = 0;
      }
      /*if(i<10) {
        bonusFrequencyMap[i] = 0;
      }*/
    }
    // 보너스 키 추가
    //frequencyMap[LogDatabaseHelper.columnBonus645] = 0;

    // 빈도수 계산
    for (var row in result) {
      for (int i = 1; i <= 6; i++) {
        String column = '${LogDatabaseHelper.columnPrize645_}$i'; // 각 칼럼명 생성
        int number = row[column]; // 데이터 값 추출

        // 빈도수 증가
        if (frequencyMap.containsKey(number)) {
          frequencyMap[number] = frequencyMap[number]! + 1;
        }
      }

      int bonusColumValue = row[LogDatabaseHelper.columnBonus645]; // 각 칼럼명 생성

      if (bonusFrequencyMap != null) {
        if (!bonusFrequencyMap.containsKey(bonusColumValue)) {
          bonusFrequencyMap[bonusColumValue] = 0;
        }
        bonusFrequencyMap[bonusColumValue] = bonusFrequencyMap[bonusColumValue]! + 1;
      }
      /*// 보너스 번호 빈도수 증가
      int bonusNumber = row[LogDatabaseHelper.columnBonus645];
      frequencyMap[LogDatabaseHelper.columnBonus645] = frequencyMap[LogDatabaseHelper.columnBonus645]! + 1;*/

    }

    setMydbList(frequencyMap,bonusFrequencyMap);

  }

}