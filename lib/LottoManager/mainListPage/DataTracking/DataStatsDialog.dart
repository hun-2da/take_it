import 'package:flutter/material.dart';

import 'CustomDialogComponents/LottoStatisticsChart645.dart';
import 'CustomDialogComponents/LottoStatisticsChart720.dart';


mixin DataStatsDialog{
  String startNum  = '1';
  String endNum = '1';

  /// true 이면 645 false 이면 720
  bool LottoType = true;



  void showCustomBottomSheet(BuildContext context) {
    showModalBottomSheet(
        //backgroundColor: Color.fromRGBO(242, 226, 220, 0.93),
        backgroundColor: Color.fromRGBO(255, 255, 255, 0.87777777),
        //backgroundColor: Color.fromRGBO(255, 255, 255, 0.93),
        context: context,
        isScrollControlled: true, // 키보드 대응 및 높이 조절
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(7), // 상단 모서리 둥글게
          ),
        ),
        builder: (BuildContext context) {
          // FractionallySizedBox로 화면의 70% 높이만 차지
          return FractionallySizedBox(
              heightFactor: 0.7, // 화면 높이의 70% 사용
              child: SingleChildScrollView(
                // 필요한 위젯들을 배치
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),


                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //const SizedBox(height: 4),
                          SizedBox(
                            width: double.infinity, // 최대 크기로 확장
                            child: Align(
                                alignment: Alignment.centerRight,
                                //padding: EdgeInsets.only(top: 50,bottom: 50),

                                child: Padding(
                                    padding: EdgeInsets.only(right: 7),
                                    child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(); // BottomSheet 닫기
                                        },
                                        style: ElevatedButton.styleFrom(
                                          // 버튼 고유의 배경/그림자 제거하여 DecoratedBox가 보이도록
                                          elevation: 0,
                                          //backgroundColor: Colors.transparent,
                                          backgroundColor : Color.fromRGBO(255, 255, 255, 0.9),
                                          // 기본 버튼 패딩을 없애 DecoratedBox의 스타일을 정확히 보여주기
                                          padding: EdgeInsets.only(right: 7,left: 7),
                                          // 물리적 버튼 영역(탭 이벤트 감지 범위) 모서리 반경 설정
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(3),
                                                topLeft: Radius.circular(3),
                                                bottomRight: Radius.circular(13),
                                                bottomLeft: Radius.circular(13))
                                          ),
                                        ),
                                        /*child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical:0.1),
                                      child: Text(
                                        'Close',
                                        style: TextStyle(color: Colors.black, fontSize: 27),
                                      ),
                                    )*/

                                        child : Container(
                                          //width: double.infinity,
                                          margin: EdgeInsets.only(bottom: 16,top: 7),
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                              border: Border(
                                                left: BorderSide(color: Colors.indigo, width: 3),
                                                right: BorderSide(color: Colors.indigo, width: 3),
                                                top: BorderSide(color: Colors.indigo, width: 3),    // 위 테두리
                                                bottom: BorderSide(color: Colors.indigo, width: 3), // 아래 테두리
                                              ),
                                              borderRadius: BorderRadius.circular(1),
                                              color: Color.fromRGBO(255, 255, 255, 0),
                                            ),
                                            // DecoratedBox 안에 내용 배치를 위해 Padding 등 사용
                                            child: Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 15, vertical:1.5),
                                              child: Text(
                                                'CLOSE',
                                                style: TextStyle(color: Colors.black, fontSize: 20),
                                              ),
                                            ),
                                          ),

                                        )
                                    )
                                )

                              //padding: EdgeInsets.only(top: 5,bottom: 5),




                            ),
                          ),

                          // 제목

                          const SizedBox(height: 13),


                          LottoType?

                          LottoStatisticsChart645(int.parse(startNum),int.parse(endNum))
                              :
                          LottoStatisticsChart720(int.parse(startNum),int.parse(endNum)),                   // 원형 그래프


                          const SizedBox(height: 20),
                          // 닫기 버튼

                        ],
                      ),
                    ),

                  )
              )
          );
        }
    );
  }
}
