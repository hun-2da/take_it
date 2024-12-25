import 'dart:convert';

import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';
import 'package:http/http.dart' as http;
import '../DatabaseHelper.dart';
import 'dart:convert';

class Crawling720 {

  Future<void> parseLottoHtml(String url) async {
    try {
      print(url);
      // HTTP GET 요청을 보내고 응답을 기다림
      final response = await http.get(Uri.parse(url));


      if (response.statusCode == 200) {
        // HTTP 응답 본문을 사용하여 HTML 문자열 파싱
        //String body = ascii.decode(response.bodyBytes);
        //print(body);

        Document doc = parse(response.body);

        // 모든 tbl_data 테이블 요소들을 선택
        List<Element> tableElements = doc.querySelectorAll('table.tbl_data');

        if (tableElements.length >= 2) {
          // 두 번째 tbl_data 테이블 선택
          Element secondTable = tableElements[1];

          // 두 번째 테이블의 tbody tr 요소 선택
          List<Element> trElements = secondTable.querySelectorAll('tbody tr');

          bool isFirstElement = true;
          for (Element tr in trElements) {
            if (isFirstElement) { // 첫 번째 Element 건너뛰기
              isFirstElement = false;
              continue;
            }

            // 각 <tr> 태그의 첫 번째 <td> (회차)
            Element tdRound = tr.children[0];

            // <td> 태그의 특정 값 추출
            int round = int.parse(tdRound.text.trim());

            List<String> prize = List.filled(7, '0');

            prize[0] = groupAppend(tr.children[2].text);
            //print('------------------------------------------- $prize');
            prize[1] = tr.children[3].text.trim();
            prize[2] = tr.children[4].text.trim();
            prize[3] = tr.children[5].text.trim();
            prize[4] = tr.children[6].text.trim();
            prize[5] = tr.children[7].text.trim();
            prize[6] = tr.children[8].text.trim();

            String lastPrize = tr.children[9].text.trim();

            // 결과를 로그에 기록하거나 데이터베이스에 삽입
            await lotto720(round, prize, lastPrize);
          }
        } else {
          print('두 번째 tbl_data 테이블을 찾을 수 없습니다.');
        }
      } else {
        print('Failed to load the webpage. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching or parsing HTML: $e');
    }
  }

  String groupAppend(String prize) {
    //print(prize);
    prize = prize.replaceAll('Á¶ ', '');
    //print('-------------------------------------------- $prize');
    return prize;
  }

  // 720+ 로또 데이터를 데이터베이스에 삽입하는 메소드
  Future<void> lotto720(int round, List<String> number, String bonus) async {
    // 데이터베이스에 대한 참조 가져오기
    final db = await LogDatabaseHelper.instance.database;

    // 삽입할 값을 저장할 맵 생성
    Map<String, dynamic> values = {
      LogDatabaseHelper.columnId720: round, // ID_720 열에 들어갈 값
      LogDatabaseHelper.columnBonus720: bonus // BONUS_720 열에 들어갈 값
    };

    // number 값들을 맵에 동적으로 추가
    for (int i = 0; i < number.length; i++) {
      values['${LogDatabaseHelper.columnPrize720_1.replaceAll('1', '')}${i + 1}'] = number[i];
    }

    // 데이터베이스에 행 삽입
    try {
      final newRowId = await db.insert(LogDatabaseHelper.table720Name, values);
      if (newRowId == -1) {
        print("오류: 데이터베이스에 데이터 삽입 실패");
      } else {
        //print("데이터가 성공적으로 삽입되었습니다. 행 ID: $newRowId");
      }
    } catch (e) {
      print("오류 발생: $e");
    }
  }

}