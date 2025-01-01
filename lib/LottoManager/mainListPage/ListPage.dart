import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../main_colors.dart';
import 'DataTracking/BallDataStats.dart';
import 'DataTracking/DataStatsDialog.dart';
import 'Lotto645/Lotto645List.dart';
import 'Lotto720/Lotto720List.dart';



class ListPage extends StatefulWidget {
  static int round645 = 1;
  static int round720 = 1;

  //const ListPage({super.key});

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> with DataStatsDialog {
  String startNum  = '1';
  String endNum = '1';

  /** true 이면 645 false 이면 720 */
  bool LottoType = true;

  // PageController를 상태 클래스에서 선언
  PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose(); // PageController 해제
    super.dispose();
  }

  void getSelectedRange(String startNum,String endNum,bool LottoType){

    setState(() {
      if(startNum != "")
        this.startNum = startNum;
      if(endNum != "")
        this.endNum = endNum;

      this.LottoType = LottoType;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customPurple[900],
      body: Stack(
        //mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Positioned(
            top: 100.0,
            left: 0,
            right: 0,
            bottom: 70.7,
            child : Container(
                child: Container(
                  margin: EdgeInsets.only(
                    left: 24.0,  // 왼쪽 여백 20
                    top: 0,   // 위쪽 여백 20
                    right: 16.0, // 오른쪽 여백 20
                    bottom: 0.0, // 하단 여백 50 추가하여 70으로 설정
                  ),
                  color: Color.fromRGBO(222, 201, 192, 1),
                ),
            ),
          ),
          Positioned(
            top: 60.0,
            right: 37.0,
            child : Balldatastats(showCustomBottomSheet,startNum,endNum)
          ),
          Positioned(
            top: 103.7,
            left: 0,
            right: 0,
            bottom: 67.0,
            child : Container(
                child: Card(
                  elevation: 7.7,
                  margin: EdgeInsets.only(
                    left: 20.0,  // 왼쪽 여백 20
                    top: 0.0,   // 위쪽 여백 20
                    right: 20.0, // 오른쪽 여백 20
                    bottom: 0.0, // 하단 여백 50 추가하여 70으로 설정
                  ), // PageView에 여백 설정
                  child: Card(
                    margin: EdgeInsets.all(0),
                    elevation: 0,
                    child: PageView(
                      controller: _pageController, // PageController 사용
                      //onPageChanged: _onPageChanged,
                      children: [
                        Lotto645Page(getSelectedRange),
                        Lotto720Page(getSelectedRange),
                      ],
                    ),
                  ),
                )
            ),
          )
        ],
      ),
    );
  }
}