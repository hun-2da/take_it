import 'package:flutter/material.dart';
import 'package:take_it/ball_Database/AccessToDatabase645/getRow645.dart';
import 'package:take_it/ball_Database/DatabaseHelper.dart';

import '../../../NumberGenerator/ButtonPage.dart';
import '../../../ball_Database/DropDownButtonList.dart';
import '../../../toolbox/DateInfo.dart';
import '../../../toolbox/IdSelector.dart';
import '../../../toolbox/PageTracker.dart';
import '../../ChoiceButtonItem/RoundToDate.dart';
import '../ListPage.dart';
import 'ball645.dart';




class Lotto645Page extends StatefulWidget {

  /// 파라미터로 받은 메소드
  final Function(String startNum,String endNum/*,bool lottoType*/) getSelectedRange;

  const Lotto645Page(this.getSelectedRange, {super.key});


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

  /// 생성자 함수 , 기본 세팅을 위해
  Lotto645PageState() {
    Future.delayed(const Duration(seconds: 0), () {
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

  /// DropDownButton의 동작에 의해 처리되는 메소드
  choiceItem(String item) async {
    String setRound = item;
    String setDate = RoundToDate.getDateFromWeeks(item,645);

    setState(() {
      _lastNumber645 = setRound;
      _round = 'NO.$setRound';
      _lottoDate = setDate;

    });

    Map<String, dynamic>? getColumnprize645 = await getRow645.getRowById(item);
    printBallImage(getColumnprize645);
  }

  /// 볼 이미지를 적용시키기 위한 메소드
  void printBallImage(Map<String, dynamic>? getColumnprize645){
    if (getColumnprize645 != null) {
      setState(() {
        _ball645Num1 = getColumnprize645[LogDatabaseHelper.columnPrize645_1];
        _ball645Num2 = getColumnprize645[LogDatabaseHelper.columnPrize645_2];
        _ball645Num3 = getColumnprize645[LogDatabaseHelper.columnPrize645_3];
        _ball645Num4 = getColumnprize645[LogDatabaseHelper.columnPrize645_4];
        _ball645Num5 = getColumnprize645[LogDatabaseHelper.columnPrize645_5];
        _ball645Num6 = getColumnprize645[LogDatabaseHelper.columnPrize645_6];
        _ball645Numbonus = getColumnprize645[LogDatabaseHelper.columnBonus645];
        _lottoDate = '$_lottoDate\n1인당  ${getColumnprize645[LogDatabaseHelper
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
      color: const Color.fromRGBO(235, 222, 214, 1),
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                top: 10.0,
                left: 0.0,
                child: _isDropdownLoading
                    ? const CircularProgressIndicator() // 로딩 표시
                    :PageTracker(_round,const Color.fromRGBO(243, 41, 75, 1))
            ),
            Positioned(
                top: 0,
                right: 3,
                child:
                _isDropdownLoading
                    ? const CircularProgressIndicator() // 로딩 표시
                    :DateInfo(_lottoDate)
            ),
            Positioned(
                top: 100,
                right: 0,
                child:  _isDropdownLoading
                    ? const CircularProgressIndicator() // 로딩 표시
                    : Idselector(
                  //true,
                    widget.getSelectedRange,
                    _lottoNumber645,
                    _lastNumber645,
                  choiceItem,
                  ListPage.round645
                ),
            ),
            Positioned(
                top: 177,
                right: 0,
                left: 0,
                //width: 100,
                height: 210,
                child: Container(
                    color: Colors.transparent,
                    margin: const EdgeInsets.only(
                      left: 5.0,  // 왼쪽 여백 20
                      top: 0.0,   // 위쪽 여백 20
                      right: 5.0, // 오른쪽 여백 20
                      bottom: 0.0, // 하단 여백 50 추가하여 70으로 설정
                    ),
                    //height: 20,
                    //color: Color.fromRGBO(64, 64, 64, .37),
                    child: ball645(_ball645Num1,_ball645Num2,_ball645Num3,_ball645Num4,_ball645Num5,_ball645Num6,_ball645Numbonus)
                )
            ),
            const Positioned(
              width: 230,
              height: 130,
              //top: 450,
              bottom: 47,
              right: 20,
              child: LottoStartButton(),
            ),
            const Positioned(
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
            const Positioned(
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
