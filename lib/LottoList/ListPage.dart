import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main_colors.dart';
import 'Lotto645/Lotto645List.dart';
import 'Lotto720/Lotto720List.dart';


class ListPage extends StatefulWidget {
  static int round645 = 1;
  static int round720 = 1;

  const ListPage({super.key});

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  // PageController를 상태 클래스에서 선언
  PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose(); // PageController 해제
    super.dispose();
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
            child : Align(
              alignment: Alignment.centerRight, // 오른쪽 정렬
              child:Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(7.7), // 왼쪽 상단 모서리 둥글게
                    topRight: Radius.circular(7.7), // 오른쪽 상단 모서리 둥글게
                    bottomLeft: Radius.circular(0.0), // 왼쪽 하단 모서리는 둥글지 않게
                    bottomRight: Radius.circular(0.0), // 오른쪽 하단 모서리는 둥글지 않게
                  ),
                ),
                //margin: EdgeInsets.only(right: 40.0, top: 70.0, bottom: 0.0),
                elevation: 0,
                color: Color.fromRGBO(211, 177, 209, 1),
                child: Container(
                    padding: EdgeInsets.only(
                      left: 0.0,  // 왼쪽 여백 20
                      top: 3.7,   // 위쪽 여백 20
                      right: 0.0, // 오른쪽 여백 20
                      bottom: 0.0, // 하단 여백 50 추가하여 70으로 설정
                    ),
                    width: 145.0,
                    height: 40.0,
                    //color: Color.fromRGBO(209, 209, 209, 0),
                    //margin: EdgeInsets.only(right: 40.0, top: 70.0, bottom: 0.0),
                    child: Align(
                        child : ElevatedButton(

                          onPressed: () {
                            // 버튼을 눌렀을 때의 동작
                          },
                          child: Text(
                            '통 계',
                            style: TextStyle(
                              fontSize: 14, // 텍스트 크기 조정
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(232, 232, 232, 1),
                            fixedSize: Size(120, 25),
                            minimumSize: Size(120, 25),
                            maximumSize: Size(120, 25),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap, // 버튼 타겟 크기 _ 버튼 간격 조정용
                            // padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.0), // 둥근 모서리 반경 설정
                            ),

                          ),
                        )
                    )
                ),
              ),
            ),
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
                        Lotto645Page(),
                        Lotto720Page(),
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