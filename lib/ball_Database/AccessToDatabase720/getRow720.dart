import '../DatabaseHelper.dart';

class getRow720{
  /** 파라미터에 해당하는 행을 반환 (테이블 720) */
  static Future<Map<String, dynamic>?> getRowById720(String id) async {
    final dbHelper = LogDatabaseHelper.instance;
    final db = await dbHelper.database;

    // 테이블에서 특정 id 값에 해당하는 행을 조회합니다.
    List<Map<String, dynamic>> result = await db.query(
      LogDatabaseHelper.table720Name, // table720Name으로 변경
      where: '${LogDatabaseHelper.columnId720} = ?', // columnId720으로 변경
      whereArgs: [id],
    );
    // 만약 해당 id의 데이터가 존재하면 첫 번째 결과를 반환하고, 그렇지 않으면 null을 반환합니다.
    if (result.isNotEmpty) {
      return result.first;
    } else {
      return null;
    }
  }

}