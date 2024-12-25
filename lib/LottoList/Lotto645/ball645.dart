
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:take_it/LottoList/lottoBallImagePath.dart';

class ball645 extends StatefulWidget {
  int ball645Num1 = 0;
  int ball645Num2 = 0;
  int ball645Num3 = 0;
  int ball645Num4 = 0;
  int ball645Num5 = 0;
  int ball645Num6 = 0;
  int ball645Numbonus = 0;


  ball645(
      this.ball645Num1,
      this.ball645Num2,
      this.ball645Num3,
      this.ball645Num4,
      this.ball645Num5,
      this.ball645Num6,
      this.ball645Numbonus,
      );


  @override
  ball_State createState() => ball_State();


}
class ball_State extends State<ball645> {
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
  void initState() {
    super.initState();
    updateBallPaths();


    print('bbbbbbbbbbbbbbbbbbbbbbbbbbbb');
  }

  @override
  void didUpdateWidget(covariant ball645 oldWidget) {
    super.didUpdateWidget(oldWidget);
    updateBallPaths();
  }




  void updateBallPaths() {
    setState(() {
      ballNum1Path = widget.ball645Num1 == 0
          ? ballIcon
          : lottoImagePath.ball645imagePath(widget.ball645Num1);
      ballNum2Path = widget.ball645Num2 == 0
          ? ballIcon
          : lottoImagePath.ball645imagePath(widget.ball645Num2);
      ballNum3Path = widget.ball645Num3 == 0
          ? ballIcon
          : lottoImagePath.ball645imagePath(widget.ball645Num3);
      ballNum4Path = widget.ball645Num4 == 0
          ? ballIcon
          : lottoImagePath.ball645imagePath(widget.ball645Num4);
      ballNum5Path = widget.ball645Num5 == 0
          ? ballIcon
          : lottoImagePath.ball645imagePath(widget.ball645Num5);
      ballNum6Path = widget.ball645Num6 == 0
          ? ballIcon
          : lottoImagePath.ball645imagePath(widget.ball645Num6);
      ballNumBONUSPath = widget.ball645Numbonus == 0
          ? ballIcon
          : lottoImagePath.ball645imagePath(widget.ball645Numbonus);
    });
    print('----------------------------------$ballNum1Path');
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Container(
            child:Column(
                children: [
                  Container(
                    //color: Color.fromRGBO(64, 64, 64, .37),
                    padding: EdgeInsets.only(
                      left: 17.0,  // 왼쪽 여백 20
                      top: 0.0,   // 위쪽 여백 20
                      right: 17.0, // 오른쪽 여백 20
                      bottom: 0.0, // 하단 여백 50 추가하여 70으로 설정
                    ),
                    height: 90,
                    child : Row(
                        mainAxisAlignment:MainAxisAlignment.center,
                        children: [
                          Flexible(
                              child : Padding(
                                  padding: EdgeInsets.all(ballsize),
                                  child: Opacity(
                                      opacity: ballopacity,
                                      child: Image.asset(ballNum1Path!)
                                  )
                              )
                          ),
                          Flexible(
                              child : Padding(
                                  padding: EdgeInsets.all(ballsize),
                                  child: Opacity(
                                      opacity: ballopacity,
                                      child: Image.asset(ballNum2Path!)
                                  )
                              )
                          ),
                          Flexible(
                              child : Padding(
                                  padding: EdgeInsets.all(ballsize),
                                  child: Opacity(
                                      opacity: ballopacity,
                                      child: Image.asset(ballNum3Path!)
                                  )
                              )
                          ),
                          Flexible(
                              child : Padding(
                                  padding: EdgeInsets.all(ballsize),
                                  child: Opacity(
                                      opacity: ballopacity,
                                      child: Image.asset(ballNum4Path!)
                                  )
                              )
                          ),
                        ]
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Container(
                    //color: Color.fromRGBO(64, 64, 64, .73),
                    padding: EdgeInsets.only(
                      left: 17.0,  // 왼쪽 여백 20
                      top: 0.0,   // 위쪽 여백 20
                      right: 17.0, // 오른쪽 여백 20
                      bottom: 0.0, // 하단 여백 50 추가하여 70으로 설정
                    ),
                    height: 100,
                    child : Row(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child : Padding(
                                padding: EdgeInsets.all(ballsize),
                                child: Opacity(
                                    opacity: ballopacity,
                                    child: Image.asset(ballNum5Path!)
                                )
                            )
                        ),
                        Expanded(
                            child : Padding(
                                padding: EdgeInsets.all(ballsize),
                                child: Opacity(
                                    opacity: ballopacity,
                                    child: Image.asset(ballNum6Path!)
                                )
                            )
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(ballsize), // 원하는 여백 설정
                            child: FittedBox(
                              child: Icon(
                                Icons.add,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                            child : Padding(
                                padding: EdgeInsets.all(ballsize),
                                child: Opacity(
                                    opacity: ballopacity,
                                    child: Image.asset(ballNumBONUSPath!)
                                )
                            )

                        ),
                      ],
                    ),
                  ),
                ]
            )
        )
    );
  }
}
