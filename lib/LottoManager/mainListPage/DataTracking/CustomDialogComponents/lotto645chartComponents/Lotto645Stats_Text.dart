import 'dart:ui';

import 'package:flutter/material.dart';

import '../LottoStatisticsChart720.dart';
import '../LottoStatisticsChart645.dart';

class Lotto645Stats_Text extends StatefulWidget{

  Map<int,double> MyColorStats;
  bool bonusColor;

  Lotto645Stats_Text(this.MyColorStats,this.bonusColor, {super.key});

  @override
  TextState createState() => TextState();
}
class TextState extends State<Lotto645Stats_Text> {

  //bool BonusColor = true;

  //Lotto645Stats_Text(this._colors,this._bonusColors);

  @override
  Widget build(BuildContext context) {
    print("설마 이것도 실행되는데 적용이 안되는거니?");

    return Align(
      alignment: Alignment.bottomCenter, // 좌측 정렬
      child: Text.rich(
        TextSpan(
          text: (() {
            String Text = "";
            if(/*MyColorStats != _colors*/widget.bonusColor)
              Text = "Bonus\n\n";
            return Text;
          })(),
          style: TextStyle(fontWeight: FontWeight.bold),
          // 기본 텍스트
          children: [
            TextSpan(
              text: 'Yellow : ${widget.MyColorStats[LottoStatisticsChart645.YellowNum]}%  \n',
              style: _ChartTextStyle(LottoStatisticsChart645.ball645Colors?[0] ?? Colors.white),
            ),
            TextSpan(
              text: 'Blue : ${widget.MyColorStats[LottoStatisticsChart645.BlueNum]}%  \n',
              style: _ChartTextStyle(LottoStatisticsChart645.ball645Colors?[1] ?? Colors.white),
            ),
            TextSpan(
              text: 'Red : ${widget.MyColorStats[LottoStatisticsChart645.RedNum]}%  \n',
              style: _ChartTextStyle(LottoStatisticsChart645.ball645Colors?[2] ?? Colors.white),
            ),
            TextSpan(
              text: 'Gray : ${widget.MyColorStats[LottoStatisticsChart645.GrayNum]}%  \n',
              style: _ChartTextStyle(LottoStatisticsChart645.ball645Colors?[3] ?? Colors.white),
            ),
            TextSpan(
              text: 'Green : ${widget.MyColorStats[LottoStatisticsChart645.GreenNum]}%  \n',
              style: _ChartTextStyle(LottoStatisticsChart645.ball645Colors?[4] ?? Colors.white),
            ),
          ],
        ),
        textAlign: TextAlign.center, // 텍스트 자체도 좌측 정렬
      ),
    );
  }


  /**텍스트 효과 및 색상 설정을 위한 widget*/
  TextStyle _ChartTextStyle(Color myColor){
    double size = 0.37;

    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: myColor,
      shadows: [
        Shadow(offset: Offset(-size, -size), color: Colors.black),
        Shadow(offset: Offset(size, -size), color: Colors.black),
        Shadow(offset: Offset(size,size), color: Colors.black),
        Shadow(offset: Offset(-size, size), color: Colors.black),
      ],
    );
  }
}