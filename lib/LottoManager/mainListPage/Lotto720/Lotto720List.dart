

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:take_it/toolbox/PageTracker.dart';

import '../../../NumberGenerator/ButtonPage.dart';
import '../../../ball_Database/AccessToDatabase720/getRow720.dart';
import '../../../ball_Database/DatabaseHelper.dart';
import '../../../ball_Database/DropDownButtonList.dart';
import '../../../toolbox/DateInfo.dart';
import '../../../toolbox/IdSelector.dart';

import '../../ChoiceButtonItem/RoundToDate.dart';
import '../ListPage.dart';

import 'ball720.dart';


class Lotto720Page extends StatefulWidget {
  /// 파라미터로 받은 메소드
  final Function(String startNum,String endNum,bool LottoType) getSelectedRange;

  const Lotto720Page(this.getSelectedRange, {super.key});

  @override
  Lotto720PageState createState() => Lotto720PageState();
}


class Lotto720PageState extends State<Lotto720Page>{
  List<String> _lottoNumber720  = ['1'];
  String _lastNumber720 = '1';

  String _lottoDate= '2020.05.07';

  String _round= 'NO.1';

  bool checkbox1 = false;
  bool checkbox2 = false;
  bool checkbox3 = false;


  int ball720Num1 = -1;
  int ball720Num2 = -1;
  int ball720Num3 = -1;
  int ball720Num4 = -1;
  int ball720Num5 = -1;
  int ball720Num6 = -1;
  int ball720GroupNum = -1;

  List<int> ball720BonusNumList = [-1,-1,-1,-1,-1,-1];

  bool _isDropdownLoading = true;


  @override
  void initState() {
    super.initState();
    setDownButton();
  }

  Future<void> setDownButton() async {
    //await Future.delayed(Duration(seconds: 2));
    List<String> fetchedItems = await DbToButton.getItem(LogDatabaseHelper.table720Name, LogDatabaseHelper.columnId720);
    String lastRound = ListPage.round720.toString();

    // 상태 업데이트는 setState 내에서 수행
    if (mounted) {
      setState(() {
        _lottoNumber720 = fetchedItems;
        //print(fetchedItems);
        _lastNumber720 = lastRound;


      });
    }
      choiceItem(lastRound);
      //print("asdaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");

  }

  /// DropDownButton의 동작에 의해 처리되는 메소드
  choiceItem(String item) async {
    String setChoice = item;
    String setDate = RoundToDate.getDateFromWeeks(item,720);
    String setRound = item;


      setState(() {
        _lastNumber720 = setChoice;
        _lottoDate = setDate;
        _round = 'NO.$setRound';
      });

    Map<String, dynamic>? getColumnprize645 = await getRow720.getRowById720(item);
    printBallImage(getColumnprize645);


  }

  /// 볼 이미지를 적용시키기 위한 메소드
  void printBallImage(Map<String, dynamic>? getColumnprize720){
    if (getColumnprize720 != null) {

        String prize = getColumnprize720[LogDatabaseHelper.columnPrize720_1];
        List<int> prizeList = prize.isNotEmpty
            ? prize.split('').map((char) => int.parse(char)).toList()
            : [];

        String bonusPrize = getColumnprize720[LogDatabaseHelper.columnBonus720];

        ball720BonusNumList = bonusPrize.isNotEmpty
            ? bonusPrize.split('').map((char) => int.parse(char)).toList()
            : [];


        setState(() {
          ball720GroupNum = prizeList[0];
          ball720Num1 = prizeList[1];
          ball720Num2 =  prizeList[2];
          ball720Num3 =  prizeList[3];
          ball720Num4 =  prizeList[4];
          ball720Num5 =  prizeList[5];
          ball720Num6 = prizeList[6];

          _lottoDate = '$_lottoDate\n월 7,000,000 원';

          _isDropdownLoading = false; // 로딩 완료
        });
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
                    :PageTracker(_round, const Color.fromRGBO(60, 209, 163, 1))
            ),
            Positioned(
                top: 0,
                right: 3,
                child: _isDropdownLoading
                    ? const CircularProgressIndicator() // 로딩 표시
                    :DateInfo(_lottoDate)
            ),
            Positioned(
                top: 100,
                right: 0,
                child : _isDropdownLoading
                    ? const CircularProgressIndicator() // 로딩 표시
                    : Idselector(
                  false,
                  widget.getSelectedRange,
                    _lottoNumber720,
                    _lastNumber720,
                  choiceItem,
                  ListPage.round720
                ),
            ),
            Positioned(
              top: 170,
              right: 0,
              left: 0,
              height: 240,

              child: Container(

                  color: Colors.transparent,
                  child: ball720(
                      ball720Num1,
                      ball720Num2,
                      ball720Num3,
                      ball720Num4,
                      ball720Num5,
                      ball720Num6,
                      ball720GroupNum,
                      ball720BonusNumList
                  )

              ),


            ),
            const Positioned(
              width: 230,
              height: 150,
              top: 450,
              right: 20,
              child: LottoStartButton(),

            ),
            const Positioned(
                left: 0,
                bottom: 0,
                child: Text(
                    'Page.2-720',
                    style: TextStyle(
                        fontSize: 11.7,
                        color: Colors.black38,
                        fontWeight: FontWeight.bold
                    )
                )
            ),
            const Positioned(
                right: 3,
                bottom: 0,
                child: Text(
                    'X',
                    style: TextStyle(
                        fontSize: 23.4,
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
