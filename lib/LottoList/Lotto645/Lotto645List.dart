import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:take_it/LottoList/ChoiceButtonItem/RoundToDate.dart';
import 'package:take_it/LottoList/Lotto645/ball645.dart';
import 'package:take_it/ball_Database/AccessToDatabase645/getRow645.dart';
import 'package:take_it/ball_Database/DatabaseHelper.dart';

import '../../NumberGenerator/ButtonPage.dart';
import '../../main.dart';
import '../../ball_Database/DropDownButtonList.dart';
import '../../toolbox/DateInfo.dart';
import '../../toolbox/IdSelector.dart';
import '../../toolbox/PageTracker.dart';
import '../ListPage.dart';


class Lotto645Page extends StatefulWidget {
  @override
  Lotto645PageState createState() => Lotto645PageState();


}


class Lotto645PageState extends State<Lotto645Page>{
  List<String> _lottoNumber645  = ['1'];
  String _lastNumber645 = '1';

  String _lottoDate= '2002.12.07';

  String _round= 'NO.1';

  int _ball645Num1 = -1;
  int _ball645Num2 = -1;
  int _ball645Num3 = -1;
  int _ball645Num4 = -1;
  int _ball645Num5 = -1;
  int _ball645Num6 = -1;
  int _ball645Numbonus = -1;

  bool _isDropdownLoading = true;

  /**생성자 함수 , 기본 세팅을 위해 */
  Lotto645PageState() {
    Future.delayed(Duration(seconds: 0), () {
      setDownButton();
    });

  }
  Future<void> setDownButton() async {

    List<String> fetchedItems = await DbToButton.getItem(LogDatabaseHelper.table645Name, LogDatabaseHelper.columnId645);
    String lastRound = ListPage.round645.toString();


    setState(() {
      _lottoNumber645 = fetchedItems;
      _lastNumber645 = lastRound;
    });
    choiceItem(lastRound);
  }

  /**DropDownButton의 동작에 의해 처리되는 메소드*/
  choiceItem(String item) async {
    String setRound = item;
    String setDate = await RoundToDate.getDateFromWeeks(item,645);

    setState(() {
      _lastNumber645 = setRound;
      _round = 'NO.$setRound';
      _lottoDate = setDate;

    });

    Map<String, dynamic>? get_columnPrize645 = await getRow645.getRowById(item);
    printBallImage(get_columnPrize645);
  }

  /**볼 이미지를 적용시키기 위한 메소드*/
  void printBallImage(Map<String, dynamic>? get_columnPrize645){
    if (get_columnPrize645 != null) {
      setState(() {
        _ball645Num1 = get_columnPrize645[LogDatabaseHelper.columnPrize645_1];
        _ball645Num2 = get_columnPrize645[LogDatabaseHelper.columnPrize645_2];
        _ball645Num3 = get_columnPrize645[LogDatabaseHelper.columnPrize645_3];
        _ball645Num4 = get_columnPrize645[LogDatabaseHelper.columnPrize645_4];
        _ball645Num5 = get_columnPrize645[LogDatabaseHelper.columnPrize645_5];
        _ball645Num6 = get_columnPrize645[LogDatabaseHelper.columnPrize645_6];
        _ball645Numbonus = get_columnPrize645[LogDatabaseHelper.columnBonus645];
        _lottoDate = '$_lottoDate\n1인당  ${get_columnPrize645[LogDatabaseHelper
            .prizeMoney]} 원';
        _isDropdownLoading = false; // 로딩 완료
      });
      //print('aaaaaaaaaaaaaaaaaaaaaaaaaa');
    }else{
      print("해당 prize는 존재하지 않음(645)");

    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromRGBO(235, 222, 214, 1),
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                top: 10.0,
                left: 0.0,
                child: _isDropdownLoading
                    ? CircularProgressIndicator() // 로딩 표시
                    :PageTracker(_round,Color.fromRGBO(243, 41, 75, 1))
            ),
            Positioned(
                top: 0,
                right: 3,
                child:
                _isDropdownLoading
                    ? CircularProgressIndicator() // 로딩 표시
                    :DateInfo(_lottoDate)
            ),
            Positioned(
                top: 100,
                right: 0,
                child:  _isDropdownLoading
                    ? CircularProgressIndicator() // 로딩 표시
                    : Idselector(
                  _lottoNumber645,
                  _lastNumber645,
                  choiceItem,
                ),
            ),
            Positioned(
                top: 200,
                right: 0,
                left: 0,

                //width: 100,
                height: 210,
                child: Container(
                    color: Colors.transparent,
                    margin: EdgeInsets.only(
                      left: 5.0,  // 왼쪽 여백 20
                      top: 0.0,   // 위쪽 여백 20
                      right: 5.0, // 오른쪽 여백 20
                      bottom: 0.0, // 하단 여백 50 추가하여 70으로 설정
                    ),
                    //height: 20,
                    //color: Color.fromRGBO(64, 64, 64, .37),
                    child:
                    ball645(_ball645Num1,_ball645Num2,_ball645Num3,_ball645Num4,_ball645Num5,_ball645Num6,_ball645Numbonus)
                )
            ),
            Positioned(
              width: 230,
              height: 150,
              top: 450,
              right: 20,

              child: LottoStartButton(),

            ),
            Positioned(
                left: 0,
                bottom: 0,
                child: Text(
                    'Page.1-645',
                    style: TextStyle(
                        fontSize: 11.7,
                        color: Colors.black38,
                        fontWeight: FontWeight.bold
                    )
                )
            ),
            Positioned(
                right: 13,
                bottom: 0,
                child: Text(
                    '--->>',
                    style: TextStyle(
                        fontSize: 22.4,
                        color: Colors.black38,
                        fontWeight: FontWeight.bold
                    )
                )
            )
          ],
        ),
      ),
    );
  }
}
