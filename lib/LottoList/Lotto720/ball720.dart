
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ball720 extends StatefulWidget {
  @override
  ball_State createState() => ball_State();


}
class ball_State extends State<ball720> {
  double ballsize = 7.7;
  double ballopacity = 0.82;
  String ballIcon = "assets/images/ball_icon.png";

  String? ballNum1Path;
  String? ballNum2Path;
  String? ballNum3Path;
  String? ballNum4Path;
  String? ballNum5Path;
  String? ballNum6Path;
  String? ballNumBONUSPath;




  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                    flex: 10,
                    child : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: (){

                              },
                              icon: Image.asset(
                                'assets/images/ball_icon.png',
                                //fit: BoxFit.contain, // 이미지가 버튼 내에 잘 맞도록 조정
                              )
                          ),
                          Text('보너스 확인')
                        ]
                    )
                ),
                SizedBox(width: 10),
                Flexible(
                  flex: 9,
                  child : Column(
                    children: [
                      Flexible(
                          child : Image.asset('assets/images/ball_icon.png')
                      ),
                      Flexible(
                          child : Image.asset('assets/images/ball_icon.png')
                      ),
                      Flexible(
                          child : Image.asset('assets/images/ball_icon.png')
                      ),
                    ],

                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                    flex: 9,
                    child : Column(
                      children: [
                        Flexible(
                            child : Image.asset('assets/images/ball_icon.png')
                        ),
                        Flexible(
                            child : Image.asset('assets/images/ball_icon.png')
                        ),
                        Flexible(
                            child : Image.asset('assets/images/ball_icon.png')
                        ),
                      ],
                    )
                )

              ],
            )
        )

    );
  }
}
