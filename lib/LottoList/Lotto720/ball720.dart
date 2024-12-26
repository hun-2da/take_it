import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:take_it/LottoList/lottoBallImagePath.dart';

class ball720 extends StatefulWidget {

  int ball720Num1 = -1;
  int ball720Num2 = -1;
  int ball720Num3 = -1;
  int ball720Num4 = -1;
  int ball720Num5 = -1;
  int ball720Num6 = -1;
  int ball720GroupNum = -1;
  List<int> ball720BonusNumList;

  ball720(
      this.ball720Num1,
      this.ball720Num2,
      this.ball720Num3,
      this.ball720Num4,
      this.ball720Num5,
      this.ball720Num6,
      this.ball720GroupNum,
      this.ball720BonusNumList
      );

  @override
  ball_State createState() => ball_State();
}

class ball_State extends State<ball720> {
  double ballsize = 7.7;
  double ballopacity = 1;
  String ballIcon = "assets/images/ball_icon.png";

  bool IS_NORMAL = true;

  // 리스트로 경로 관리
  List<String?> ballNum1Paths = List.filled(6, null);
  List<String?> ballNum2Paths = List.filled(6, null);

  String? ballNumGroupNumPath;
  List<String?> ballImagePaths = List.filled(6, "assets/images/ball_icon.png");

  @override
  void initState() {
    super.initState();
    updateBallPaths();
  }

  @override
  void didUpdateWidget(covariant ball720 oldWidget) {
    super.didUpdateWidget(oldWidget);
    updateBallPaths();
  }

  /** 상태 클래스는 부모 위젯(StatefulWidget) 데이터를 직접 접근할 수 없기 때문에, widget. 키워드를 통해 접근합니다.*/
  void updateBallPaths() {
    setState(() {
      // 첫 번째 번호 그룹 처리
      List<int> mainNumbers = [
        widget.ball720Num1,
        widget.ball720Num2,
        widget.ball720Num3,
        widget.ball720Num4,
        widget.ball720Num5,
        widget.ball720Num6
      ];

      List<int> colors = [
        lottoImagePath.r,
        lottoImagePath.o,
        lottoImagePath.y,
        lottoImagePath.b,
        lottoImagePath.p,
        lottoImagePath.g,
      ];

      for (int i = 0; i < mainNumbers.length; i++) {
        ballNum1Paths[i] = mainNumbers[i] == -1
            ? ballIcon
            : lottoImagePath.ball720imagePath(colors[i], mainNumbers[i]);
      }
      //print(mainNumbers);

      // 보너스 번호 그룹 처리

      for (int i = 0; i < widget.ball720BonusNumList.length; i++) {
        ballNum2Paths[i] =
        widget.ball720BonusNumList[i] == -1
            ? ballIcon
            : lottoImagePath.ball720imagePath(
            colors[i], widget.ball720BonusNumList[i]);
      }

      // 그룹 번호 처리
      ballNumGroupNumPath = widget.ball720GroupNum == -1
          ? ballIcon
          : lottoImagePath.ball720imagePath(lottoImagePath.w, widget.ball720GroupNum);

      // 초기 이미지 경로 설정
      ballImagePaths = List.from(ballNum1Paths);
    });
  }

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
                                _changeToPrizeAndBonus();
                              },
                              icon: Image.asset(
                                '$ballNumGroupNumPath',
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
                    children: List.generate(3, (index) => Flexible(
                        child : Image.asset('${ballImagePaths[index] ?? "assets/images/ball_icon.png"}')
                    )),
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                    flex: 9,
                    child : Column(
                      children: List.generate(3, (index) => Flexible(
                          child : Image.asset('${ballImagePaths[index + 3] ?? "assets/images/ball_icon.png"}')
                      )),
                    )
                )
              ],
            )
        )
    );
  }

  void _changeToPrizeAndBonus() {
    setState(() {
      if(IS_NORMAL){
        ballImagePaths = List.from(ballNum2Paths);
      }else{
        ballImagePaths = List.from(ballNum1Paths);
      }
      IS_NORMAL = !IS_NORMAL;
    });
  }
}
