import 'package:flutter/material.dart';


class LottoStartButton extends StatefulWidget {
  const LottoStartButton({super.key});

  @override
  _StartButtonState createState() => _StartButtonState();
}

class _StartButtonState extends State<LottoStartButton> {
  bool checkbox1 = false;
  bool checkbox2 = false;
  bool checkbox3 = false;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child : ClipPath(
          clipper: ClippedCornerClipper(),
          child: Container(
              padding : const EdgeInsets.only(
                left: 0.0,  // 왼쪽 여백 20
                top: 0.0,   // 위쪽 여백 20
                right: 15.0, // 오른쪽 여백 20
                bottom: 0.0, // 하단 여백 50 추가하여 70으로 설정
              ),
              color: const Color.fromRGBO(243 , 243, 243, .6),
              child: Row(
                children: [
                  Container(
                    padding : const EdgeInsets.only(
                      left: 0.0,  // 왼쪽 여백 20
                      top: 0.0,   // 위쪽 여백 20
                      right: 10.0, // 오른쪽 여백 20
                      bottom: 0.0, // 하단 여백 50 추가하여 70으로 설정
                    ),
                    //color: Color.fromRGBO(243 , 243, 243, 1),
                    child : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              //alignment: Alignment.centerLeft,
                              child :Checkbox(
                                value: checkbox1, // 현재 체크박스의 상태
                                onChanged: (bool? value) {
                                  setState(() {
                                    checkbox1 = value!; // 상태 변경 시 setState를 통해 업데이트
                                  });
                                },
                              ),
                            ),
                            const Text('지문'),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                child : Checkbox(
                                  value: checkbox2, // 현재 체크박스의 상태
                                  onChanged: (bool? value) {
                                    setState(() {
                                      checkbox2 = value!; // 상태 변경 시 setState를 통해 업데이트
                                    });
                                  },
                                )
                            ),
                            const Text('현재 번호 기반'),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              child : Checkbox(
                                value: checkbox3, // 현재 체크박스의 상태
                                onChanged: (bool? value) {
                                  setState(() {
                                    checkbox3 = value!; // 상태 변경 시 setState를 통해 업데이트
                                  });
                                },
                              ),
                            ),
                            const Text('인공 지능'),
                          ],
                        ),
                      ],

                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                      child : Expanded(
                          child: ElevatedButton(
                            //fingerprint_icon
                              onPressed: (){

                              },

                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                                  minimumSize: const Size(
                                    100 ,  120,
                                  ), // 부모의 크기를 채우도록 설정
                                  padding: const EdgeInsets.all(7.7777777), // 여백 제거
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10.0),    // 왼쪽 위 모서리 둥글기
                                        topRight: Radius.circular(0.0),    // 오른쪽 위 모서리 둥글기
                                        bottomLeft: Radius.circular(0.0), // 왼쪽 아래 모서리 둥글기
                                        bottomRight: Radius.circular(10.0),// 오른쪽 아래 모서리 둥글기
                                      )
                                  )

                              ),

                              child: Opacity(
                                opacity: 0.1, // 이미지의 불투명도 설정 (0.0 ~ 1.0)
                                child: Image.asset(
                                  'assets/images/fingerprint_icon.png',
                                  fit: BoxFit.cover, // 이미지를 버튼 전체에 맞춤
                                ),
                              )

                          )
                      )
                  )
                ],
              )
          ),
        )

    );
  }
}
/// 모양을 만들기 위한 클레스
class ClippedCornerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, 0); // 왼쪽 위 모서리
    path.lineTo(size.width - 20, 0); // 오른쪽 위 모서리로 이동
    path.lineTo(size.width, 20); // 오른쪽 위 모서리를 대각선으로 잘라내기
    path.lineTo(size.width, size.height); // 오른쪽 아래 모서리
    path.lineTo(0, size.height); // 왼쪽 아래 모서리
    path.close(); // 경로를 닫아서 완성

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
