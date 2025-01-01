import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class Balldatastats extends StatefulWidget {

  //Context myContext;
  /**파라미터로 받은 메소드*/
  final ValueChanged<BuildContext> BallDataDialog;
  String _lottoNumber;
  String _lastNumber;

  Balldatastats(
      //this.myContext,
      this.BallDataDialog,
      this._lottoNumber,
      this._lastNumber
      );
  @override
  StatisticsCalculator createState() => StatisticsCalculator();
}
class StatisticsCalculator extends State<Balldatastats> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child:Align(
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
            //color: Colors.transparent,
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
                      print('${widget._lottoNumber}-------------------------${widget._lastNumber}');
                      widget.BallDataDialog(context);
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
    );
  }
}