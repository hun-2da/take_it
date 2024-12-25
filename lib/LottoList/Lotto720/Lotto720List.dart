import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../NumberGenerator/ButtonPage.dart';
import '../../ball_Database/DatabaseHelper.dart';
import '../../main.dart';
import '../../ball_Database/DropDownButtonList.dart';
import '../ChoiceButtonItem/RoundToDate.dart';
import '../ListPage.dart';
import 'ball720.dart';


class Lotto720Page extends StatefulWidget {
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


  Lotto720PageState(){
    Future.delayed(Duration(seconds: 0), () {
      setDownButton();
    });

  }

  Future<void> setDownButton() async {
    await Future.delayed(Duration(seconds: 2));
    List<String> fetchedItems = await DbToButton.getItem(LogDatabaseHelper.table720Name, LogDatabaseHelper.columnId720);
    String lastRound = ListPage.round720.toString();

    // 상태 업데이트는 setState 내에서 수행
    if (mounted) {
      setState(() {
        _lottoNumber720 = fetchedItems;
        _lastNumber720 = lastRound;
      });
    }
    choiceItem(lastRound);

  }

  choiceItem(String item) async {
    String setChoice = item;
    String setDate = await RoundToDate.getDateFromWeeks(item,720);
    String setRound = item;

    setState(() {
      _lastNumber720 = setChoice;
      _lottoDate = setDate;
      _round = 'NO.$setRound';

    });

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
                child:  Card(
                    margin: EdgeInsets.all(0),
                    color:  Color.fromRGBO(60, 209, 163, 1),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0), // Card 안쪽 패딩
                      child: Text(
                        _round,
                        style: TextStyle(
                            fontSize: 13.7,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0), // 왼쪽 상단 모서리 둥글게
                        topRight: Radius.circular(7.7), // 오른쪽 상단 모서리 둥글게
                        bottomLeft: Radius.circular(0.0), // 왼쪽 하단 모서리는 둥글지 않게
                        bottomRight: Radius.circular(7.7), // 오른쪽 하단 모서리는 둥글지 않게
                      ),
                    )
                )
            ),
            Positioned(
                top: 0,
                right: 3,
                child: Text(
                  _lottoDate,
                  style: TextStyle(
                      fontSize: 13.7,
                      color: Colors.black26,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold
                  ),

                )
            ),
            Positioned(
                top: 100,
                right: 0,

                child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container (
                          width: 77,
                          height: 30,
                          //color: Color.fromRGBO(64, 64, 64, .37),
                          child : Card(
                            color: Colors.transparent, // 투명한 배경색
                            elevation: 0,
                            child : TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                //labelText: '이름 입력',
                                hintText: '모두 선택',
                                //border: OutlineInputBorder(),
                                hintStyle: TextStyle(

                                  color: Colors.black54, // 힌트 텍스트의 색상을 회색으로 설정
                                ),
                              ),
                              onChanged: (text) {

                              },
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          )
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 5.0,  // 왼쪽 여백 20
                          top: 0.0,   // 위쪽 여백 20
                          right: 5.0, // 오른쪽 여백 20
                          bottom: 0.0, // 하단 여백 50 추가하여 70으로 설정
                        ),
                        child : Text(
                            '~',
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.black26,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold
                            )

                        ),
                      ),
                      Container(
                          width: 100,
                          height: 30,
                          //color: Color.fromRGBO(64, 64, 64, .37),
                          child : Card(
                              color: Colors.transparent, // 투명한 배경색
                              elevation: 0,
                              child : DropdownButton<String>(
                                value: _lastNumber720,
                                hint: Text(
                                  '숫자 선택',
                                  style: TextStyle(color: Colors.white, fontSize: 16), // 힌트 텍스트 스타일
                                ),
                                items: _lottoNumber720.map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      '$value 회',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold
                                      ), // 힌트 텍스트 스타일
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? value) { // list에서 지정해둔 value가 그대로 콜백메소드 value로 파라미터 처ㄹ
                                  setState(() {
                                    choiceItem(value!);
                                  });
                                },

                              )
                          )
                      )
                    ]
                )
            ),
            Positioned(
              top: 170,
              right: 0,
              left: 0,
              height: 240,

              child: Container(

                  color: Colors.transparent,
                  child: ball720()

              ),


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
                    'Page.2-720',
                    style: TextStyle(
                        fontSize: 11.7,
                        color: Colors.black38,
                        fontWeight: FontWeight.bold
                    )
                )
            ),
            Positioned(
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
