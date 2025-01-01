import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mixin DataStatsDialog{
  void showCustomBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true, // 키보드 대응 및 높이 조절
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.0), // 상단 모서리 둥글게
          ),
        ),
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery
                  .of(context)
                  .viewInsets
                  .bottom, // 키보드 오버랩 방지
            ),
            child: Container(
              padding: EdgeInsets.all(20.0),
              height: 577, // BottomSheet 높이 설정
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '통계',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // BottomSheet 닫기
                          },
                          child: Text('X'),
                          
                        ),

                        ]
                  ),
                  // 제목

                  SizedBox(height: 20),
                  // 입력 필드
                  TextField(
                    decoration: InputDecoration(
                      labelText: '입력 필드',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  // 닫기 버튼

                ],
              ),
            ),
          );
        }
    );
  }
}
