import 'package:flutter/material.dart';



/// 번호 선택 downButton이랑 관련된 UI
class Idselector extends StatefulWidget {

  List<String> _lottoNumber  = ['1'];
  String _MylastNumber = '1';
  int lastNumber = 1;

  /// 파라미터로 받은 메소드
  final ValueChanged<String> changeItem;
  /// 파라미터로 받은 메소드
  final Function(String startNum,String endNum/*,bool LottoType*/) getSelectedRange;

  //bool LottoType = true;
  Idselector(
      //this.LottoType,
  this.getSelectedRange,
      this._lottoNumber,
      this._MylastNumber,
      this.changeItem,
      this.lastNumber, {super.key}
      );

  @override
  ball_Id_Selector createState() => ball_Id_Selector();
}
class ball_Id_Selector extends State<Idselector> {

  String userInputNumber = "";

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child:Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox (
                  width: 77,
                  height: 30,
                  //color: Color.fromRGBO(64, 64, 64, .37),
                  child : Card(
                    color: Colors.transparent, // 투명한 배경색
                    elevation: 0,
                    child : TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        //labelText: '이름 입력',
                        hintText: '모두 선택',
                        //border: OutlineInputBorder(),
                        hintStyle: TextStyle(

                          color: Colors.black54, // 힌트 텍스트의 색상을 회색으로 설정
                        ),
                      ),
                      onChanged: (text) {
                        if (text.isNotEmpty) {
                          int myInputNumber = int.parse(text);
                          if (0 < myInputNumber) {
                            if (myInputNumber > widget.lastNumber) {
                              text = widget.lastNumber.toString();
                            }
                            userInputNumber = text;
                            setState(() {
                              widget._MylastNumber = text;

                            });
                            widget.changeItem(text);
                            widget.getSelectedRange(text,text/*,widget.LottoType*/);
                          }
                        }else if(text.isEmpty){
                          widget.getSelectedRange("-1","-1"/*,widget.LottoType*/);
                          //print("empty여야 하는데...............................................................");
                        }
                      },
                      style: const TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  )
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 5.0,  // 왼쪽 여백 20
                  top: 0.0,   // 위쪽 여백 20
                  right: 5.0, // 오른쪽 여백 20
                  bottom: 0.0, // 하단 여백 50 추가하여 70으로 설정
                ),
                child : const Text(
                    '~',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black26,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold
                    )

                ),
              ),
              SizedBox(
                  //width: 100,
                  height: 30,
                  //color: Color.fromRGBO(64, 64, 64, .37),
                  child : Card(
                      color: Colors.transparent, // 투명한 배경색
                      elevation: 0,
                      child : DropdownButton<String>(
                        value: widget._MylastNumber,
                        hint: const Text(
                          '숫자 선택',
                          style: TextStyle(color: Colors.white, fontSize: 16), // 힌트 텍스트 스타일
                        ),
                        items: widget._lottoNumber.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              '$value 회',
                              style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                              ), // 힌트 텍스트 스타일
                            ),
                          );
                        }).toList(),
                        onChanged: (String? value) { // list에서 지정해둔 value가 그대로 콜백메소드 value로 파라미터 처ㄹ
                          if(value != null){
                            setState(() {
                              widget._MylastNumber = value;

                            });
                            widget.changeItem(value);
                            widget.getSelectedRange("",value/*,widget.LottoType*/);
                          }
                        },

                      )
                  )
              )
            ]
        )
    );
  }
}