import 'package:sqflite/sqflite.dart';

import '../DatabaseHelper.dart';

class Lotto720Storage{
  Lotto720Storage();

  void getLottoFrequency(int startNum, int endNum) async {
    Database db =  await LogDatabaseHelper.instance.database;

    final List<Map<String, dynamic>> result = await db.query(
      LogDatabaseHelper.logTable720,
          columns: [
            LogDatabaseHelper.columnPrize720_1,
            LogDatabaseHelper.columnBonus720
          ],
      where: '${LogDatabaseHelper.columnId720} BETWEEN ? AND ?',          // 특정 범위에 대해 BETWEEN를 사용하여 범위를 지정 ?는 아래에서 각 선택됨
      whereArgs: [startNum, endNum],
      // 해당 구조는 sqlInjection을 예방이 가능, 가독성 증가 등의 이점이 존재
    );

    for (var row in result) {
      String number = row[LogDatabaseHelper.columnPrize720_1]; // 데이터 값 추출 _ 현재는 조가 포함된 숫자열 6 _ 총 7자리



      String bonusNumber = row[LogDatabaseHelper.columnBonus720]; // 조 _ 가 제외된 숫자 6자리

    }

  }
}