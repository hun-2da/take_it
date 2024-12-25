import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';
import 'package:http/http.dart' as http;

import '../DatabaseHelper.dart';

class Crawling645 {

  Future<void> parseLottoHtml(String html) async {
    print(html);
    try {
      // HTTP GET 요청을 보내고 응답을 기다림
      final response = await http.get(Uri.parse(html));

      if (response.statusCode == 200) {
        // HTML 문자열 파싱
        Document doc = parse(response.body);


        // CSS 선택자를 사용하여 요소 선택
        List<Element> trElements = doc.querySelectorAll(
            'table.tbl_data tbody tr');



        //print(trElements);

        for (Element tr in trElements) {
          // 회차 번호 추출
          int count = 0;
          int round = await stringToInt(tr
              .querySelector('td')
              ?.text ?? '');

          //print(tr.innerHtml);


          // 로또 번호 추출
          List<Element> lottoNumbers = tr.querySelectorAll('span.ball_645.sml');
          Element? prizeMoney = tr.querySelector('span.color_key1');
          String prizeMoneyText = (prizeMoney != null) ? prizeMoney.text : "";
          //print(prizeMoneyText);


          /**
           * table.tbl_data tbody tr는 HTML 문서 내에서 tbl_data라는 클래스를 가진 <table> 태그를 찾고,
              그 테이블의 <tbody> 안에 있는 모든 <tr>(행) 요소를 선택하겠다는 의미

           * */


          List<int> numbers = List.filled(6, 0);
          /**
           * List<int> numbers = List.filled(6, 0);는 길이가 6인 정수 리스트를 생성하며, 모든 요소를 0으로 초기화합니다.
              결과적으로 생성되는 리스트는 [0, 0, 0, 0, 0, 0]가 됩니다.

           * */

          int bonusNumber = 0;
          for (Element number in lottoNumbers) {
            if (count == 6) {
              //print(number.text);
              bonusNumber = int.parse(number.text);
            } else {
              int num = int.parse(number.text);
              numbers[count] = num;
            }
            count++;
          }

          // 결과를 로그에 기록하거나 데이터베이스에 삽입
          //print('회차: $round, 번호: ${numbers.join(", ")}, 보너스 번호: $bonusNumber');
          //print('1');
          await lotto645(round, numbers, bonusNumber,prizeMoneyText);

          //print('2');
        }
      } else {
        print(
            'Failed to load the webpage. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching or parsing HTML: $e');
    }
  }


  /**
   *
   * int round = stringToInt(tr.querySelector('td')?.text ?? '');:
      <tr> 요소의 첫 번째 <td> 요소의 텍스트를 추출하고,
      stringToInt 메서드를 사용하여 정수로 변환한 후 round 변수에 저장합니다.
      ?. 연산자는 null 안전성을 위해 사용되며, ?? ''는 값이 null일 경우 빈 문자열을 반환합니다.

   * */
  Future<int> stringToInt(String round) async {
    String numberStr = round.replaceAll(
        RegExp(r'[^\d]'), ''); // RegExp(r'[^\d]') 를 ''로 대체
    //  ^는 부정(not)을 의미합니다. 즉, \d가 아닌 것들을 의미

    return int.parse(numberStr);
  }

  Future<void> lotto645(int round, List<int> number, int bonus,String money) async {
    //print('3');
    // 데이터베이스에 대한 참조 가져오기
    final db = await LogDatabaseHelper.instance.database;

    // 삽입할 값을 저장할 맵 생성
    Map<String, dynamic> values = {
      LogDatabaseHelper.columnId645: round, // ID_645 열에 들어갈 값
      LogDatabaseHelper.columnBonus645: bonus, // BONUS_645 열에 들어갈 값
      LogDatabaseHelper.prizeMoney: money
    };

    // number 값들을 맵에 동적으로 추가
    for (int i = 0; i < number.length; i++) {
      values['${LogDatabaseHelper.columnPrize645_1.replaceAll('1', '')}${i +
          1}'] = number[i];
    }
    //print('어디까지 실행되는가?');
    // 데이터베이스에 행 삽입
    try {
      final newRowId = await db.insert(LogDatabaseHelper.table645Name, values);
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



