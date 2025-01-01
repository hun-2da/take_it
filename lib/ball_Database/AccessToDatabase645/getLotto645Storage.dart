import 'package:sqflite/sqflite.dart';

import '../DatabaseHelper.dart';

class Lotto645Storage{



  Future<Map<String, int>> getLottoFrequency(int startNum, int endNum) async {
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
    Map<String, int> frequencyMap = {};

    // 1부터 45까지 초기화
    for (int i = 1; i <= 45; i++) {
      frequencyMap[i.toString()] = 0;
    }
    // 보너스 키 추가
    frequencyMap['bonus'] = 0;

    // 빈도수 계산
    for (var row in result) {
      for (int i = 1; i <= 6; i++) {
        String column = 'prize$i'; // 각 칼럼명 생성
        int number = row[column]; // 데이터 값 추출

        // 빈도수 증가
        if (frequencyMap.containsKey(number.toString())) {
          frequencyMap[number.toString()] = frequencyMap[number.toString()]! + 1;
        }
      }

      // 보너스 번호 빈도수 증가
      int bonusNumber = row['bonus'];
      frequencyMap['bonus'] = frequencyMap['bonus']! + 1;
    }

    return frequencyMap;
  }

}