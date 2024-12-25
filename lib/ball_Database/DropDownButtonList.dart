import 'DatabaseHelper.dart';

class DbToButton{

  static Future<List<String>> getItem(String table,String RoundColumn) async{
    final dbHelper = LogDatabaseHelper.instance;
    final db = await dbHelper.database;

    final result = await db.query(
      table, // 테이블 이름
      columns: [RoundColumn], // 가져올 열만 명시
    );

    // 결과를 List<String>으로 변환 (맵에서 값만 추출하여 문자열로 변환)
    return result.map((row) => row[RoundColumn].toString()).toList();

  }

}