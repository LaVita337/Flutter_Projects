import 'package:flutter/material.dart';

class Answer2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFaedefc),
        body: Column(
          children: [
            SizedBox(height: 68), // 여백을 주기 위해 사용
            // Content
            Center(
              child: Column(
                children: [
                  SizedBox(height: 201), // Check 부분까지의 여백
                  Stack(
                    alignment: Alignment.center, // 자식들을 중앙에 정렬
                    children: [
                      // 큰 원형 Container (바깥쪽 원)
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          color: const Color(0xffcbffa9), // 녹색 배경
                          shape: BoxShape.circle, // 원형 모양
                          boxShadow: [
                            // 그림자 효과
                            BoxShadow(
                              color: const Color(0x663610a6),
                              offset: Offset(0, 16),
                              blurRadius: 32,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                      ),
                      // 작은 원형 Container (안쪽 원)
                      Container(
                        width: 78,
                        height: 78,
                        decoration: BoxDecoration(
                          color: const Color(0xffcbffa9), // 녹색 배경
                          shape: BoxShape.circle, // 원형 모양
                        ),
                      ),
                      // 체크 아이콘
                      Icon(
                        Icons.check, // 체크 아이콘
                        size: 33.5, // 아이콘 크기
                        color: Colors.white, // 아이콘 색상은 흰색
                      ),
                    ],
                  ),
                  SizedBox(height: 20), // Check 부분과 Title 사이의 여백
                  Text(
                    "정답!",
                    style: const TextStyle(
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w700,
                      fontFamily: "Poppins",
                      fontStyle: FontStyle.normal,
                      fontSize: 28.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 300,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/review2'); // review2 페이지로 이동
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(248, 248, 197, 122), // 버튼 배경색
                      onPrimary: const Color(0xffffffff), // 버튼 전경색 (아이콘/텍스트 색상)
                      minimumSize: Size(327, 64), // 버튼의 최소 크기
                      padding: EdgeInsets.zero, // 패딩을 없앰
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(20)), // 버튼의 둥근 모서리
                        side: BorderSide(
                            color: const Color(0xffffffff),
                            width: 1), // 테두리 스타일
                      ),
                      elevation: 16, // 그림자 깊이
                      shadowColor: const Color(0x663610a6), // 그림자 색상
                    ),
                    child: Icon(
                      Icons.arrow_forward,
                      size: 21.333,
                    ),
                  ),
                  SizedBox(height: 5), // 하단 여백
                ],
              ),
            ),
          ],
        ));
  }
}