import 'dart:ffi';

import 'package:flutter/material.dart';


class GenratorCusomDialog extends StatefulWidget{

  @override
  MyCustomDialog createState() => MyCustomDialog();
}

class MyCustomDialog extends State<GenratorCusomDialog>{
  int _num1 = 10,_num2 = 10,_num3 = 10,_num4 = 10,_num5 = 10,_num6 = 10;
  Color _ballColor = Colors.yellowAccent;
  //String prizeString = "1028회\n4등";
  bool _click = false;
  final PageController _pageController = PageController(initialPage: 0);
  double _NumberSize = .97;
  double _StringSize = .37;

  @override
  Widget build(BuildContext context) {

    return Container(
        width: 150,
        height: 120,
        //child: Card(
        color: Colors.transparent,
        child: PageView(
          controller: _pageController,
          onPageChanged: (index){
            Navigator.pop(context);
          },
          children: [
            Card(
              margin: EdgeInsets.only(top: 4,bottom: 4,left: 4),
              color: const Color.fromRGBO(249, 228, 251, .9),
              child : Row(
                children: [
                  Expanded(
                    flex: 1, child: SizedBox(),

                  ),
                  //SizedBox(width: 30),
                  Expanded(
                      flex: 4,
                      child: AspectRatio(
                        aspectRatio: 1, // 1:1 비율로

                        child: ElevatedButton(
                            onPressed: (){

                              if(_click) return;

                              setState(() {
                                _click = true;
                              });
                              Future.delayed(Duration(seconds: 3), () {
                                if (mounted) { // 화면이 여전히 활성화된 상태인지 확인
                                  Navigator.pop(context);
                                }
                              });
                            },
                            //child: Expanded(
                            child: Stack(
                              children: [
                                Center( // Text를 중앙에 배치
                                  child: Text(
                                    "승 인",
                                    style: TextStyle(
                                      fontSize: 17.7,
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                _click ?
                                Image.asset(
                                  'assets/images/stamp_img.png',
                                  fit: BoxFit.cover, // 이미지를 버튼 전체에 맞춤
                                ) :
                                SizedBox.shrink()
                              ],
                            ),
                            //),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              backgroundColor: Colors.transparent,   // 배경색 투명
                              shadowColor: Colors.transparent,       // 그림자 색상도 투명
                              elevation: 0,                          // elevation(그림자) 없앰
                              side: BorderSide(color: Colors.blueGrey, width: 2), // 테두리 설정
                              shape: RoundedRectangleBorder(
                                //borderRadius: BorderRadius.circular(10),     // 모서리 라운드
                                borderRadius: BorderRadius.zero,
                              ),
                            )
                        ),
                      )
                  ),
                  Expanded(
                    flex: 10,
                    child: Text(
                        '$_num1  $_num2  $_num3 \n$_num4  $_num5  $_num6',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 27.7,
                          color: _ballColor,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(offset: Offset(-_NumberSize, -_NumberSize), color: Colors.black),
                            Shadow(offset: Offset(_NumberSize, -_NumberSize), color: Colors.black),
                            Shadow(offset: Offset(_NumberSize,_NumberSize), color: Colors.black),
                            Shadow(offset: Offset(-_NumberSize, _NumberSize), color: Colors.black),
                          ],
                        )
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child : Container(
                          alignment: Alignment.center,
                          height: 120,
                          color: Colors.blueGrey,
                          child:Text(
                            "<<",
                            style: TextStyle(
                              //fontSize: 1.7,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                      )
                  )
                ],
              ),
            ),
            //Card(
            //color: Colors.transparent,
            Column(
              children: [
                Expanded(child: Container(color: Colors.transparent), flex: 1),
                Expanded(child: Container(
                  alignment: Alignment.centerLeft,
                    color: Colors.redAccent,
                        child:Text(
                          textAlign: TextAlign.left,
                          "    Cheer up!",
                          style: TextStyle(
                            //fontSize: 1.7,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(offset: Offset(-_StringSize, -_StringSize), color: Colors.black),
                                Shadow(offset: Offset(_StringSize, -_StringSize), color: Colors.black),
                                Shadow(offset: Offset(_StringSize,_StringSize), color: Colors.black),
                                Shadow(offset: Offset(-_StringSize, _StringSize), color: Colors.black),
                              ]
                          ),
                        ))

                , flex: 1),
                Expanded(child: Container(color: Colors.transparent), flex: 1),
              ],
            )
            //)

          ],
        )
      //)
    );
  }
}
