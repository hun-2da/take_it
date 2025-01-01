import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


import '../LottoManager/ChoiceButtonItem/RoundToDate.dart';
import '../LottoManager/mainListPage/ListPage.dart';
import 'Crawling/lotto645Crawling.dart';
import 'Crawling/lotto720Crawling.dart';
import 'DatabaseHelper.dart';

class DatabaseCheck{
  late Database db;

  Future<void> check() async {
    WidgetsFlutterBinding.ensureInitialized();
    final dbHelper = LogDatabaseHelper.instance;
    db = await dbHelper.database;

    await check645();
    await check720();
    
  }

  Future<void> check645() async{
    int round = RoundToDate.calculateWeeksFromStartDate(2002, 12, 7); //645 처음 날
    int last645 = await lastNumberCheck(LogDatabaseHelper.table645Name,round);
    String url = "";

    if(last645 == 1){
      ListPage.round645 = round;
      // 완벽
      print("완벽?");
      return;
    }else if(last645 == -1){
      url = "https://dhlottery.co.kr/gameResult.do?method=allWinPrint&gubun=byWin&nowPage=&drwNoStart=1&drwNoEnd=$round";
      print("입력?");
    }else{
      url = "https://dhlottery.co.kr/gameResult.do?method=allWinPrint&gubun=byWin&nowPage=&drwNoStart=$last645&drwNoEnd=$round";
      print("갱신?");
    }
    if(last645!=1) {
      await Crawling645().parseLottoHtml(url);

      if (last645 != -1) {
        ListPage.round645 = last645;
      }
    }
  }

  Future<void> check720() async{
    int round = RoundToDate.calculateWeeksFromStartDate(2020, 5, 7); //720 처음 날
    int last720 = await lastNumberCheck(LogDatabaseHelper.table720Name,round);
    String url = "";

    if(last720 == 1){
      ListPage.round720 = round;
      print("완벽?");
      return;
    }else if(last720 == -1){
      // 행이 존재하지 않음
      print("입력?");
      url = "https://www.dhlottery.co.kr/gameResult.do?method=win720Print&Round=190&drwNoStart=1&drwNoEnd=$round";
    }else{
      // 행이 존재하지만 갱신 필요
      print("갱신?");
      url = "https://www.dhlottery.co.kr/gameResult.do?method=win720Print&Round=190&drwNoStart=$last720&drwNoEnd=$round";
    }

    if(last720!=1) {
      await Crawling720().parseLottoHtml(url);

      if (last720 != -1) {
        ListPage.round720 = last720;

        //Lotto720PageState().setDownButton();
        //Lotto720PageState().choiceItem(last720.toString());

      }
    }
  }

  /*
  *마지막 number을 확인하고 만약
   * 마지막 숫자가 getInt와 같으면 1을 return ,
   * 아니면 last 를 return
   * */
  Future<int> lastNumberCheck(String table, int getInt) async {
    print('4');
    String selectLastIdQuery =
        'SELECT id '
        'FROM $table '
        'ORDER BY id '
        'DESC LIMIT 1';

    final List<Map<String, dynamic>> result = await db.rawQuery(selectLastIdQuery);

    if (result.isNotEmpty) {
      int lastId = result.first['id'] as int;

      if (lastId == getInt) {

        return 1; // TRUE를 1로 대체
      } else {
        return lastId;
      }
    }

    return -1; // ERROR를 -1로 대체
  }
}
