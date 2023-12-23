import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:i15_app/screen/home/widgets/nextlock/lockscreen2.dart';
import '../../../../globals.dart' as globals;
import 'dart:convert';

int openCount = 0; // 전역 변수로 선언

class Review2 extends StatefulWidget {

  @override
  _ReviewState createState() => _ReviewState();
}

class _ReviewState extends State<Review2> {
  // openCount 관련 코드를 제거합니다.
  String currentImage = '';
  String currentCaption = '';

  @override
  void initState() {
    super.initState();
    pickRandomImageAndCaption();
  }

  void pickRandomImageAndCaption() async {

    final String response = await rootBundle.loadString('asset/Quiz_image_json/${globals.selectedFileName}.json');
    final data = json.decode(response);

    setState(() {
      currentImage = '${globals.selectedFileName}.jpg';
      currentCaption = data['caption'];
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFaedefc),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 60),
            Container(
              width: 340,
              height: 320,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                border: Border.all(color: const Color(0x33ffffff), width: 2),
                color: const Color(0xfffff6f6),
              ),
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: SizedBox(
                      width: 320,
                      height: 240,
                      child: Image.asset(
                        'asset/Quiz_image/$currentImage',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),  // height 10 으로 변경 진영
                      Text(
                        currentCaption, // 수정된 부분: 랜덤 캡션 표시
                        style: TextStyle(
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w700,
                          fontFamily: "Poppins",
                          fontStyle: FontStyle.normal,
                          fontSize: 17.0,   // 23 -> 15로 변경 진영
                        ),
                      ),
                ],
              ),
            ),
            SizedBox(height: 110),
            Container(
              width: 330,
              height: 70, // 이전 색상과 모양으로 맞춘 Container
              decoration: BoxDecoration(
                color: globals.isThridCorrect ? Color(0xFF81c784) : Color(0xFFf28b82), // 이전에 사용한 빨간색
                borderRadius: BorderRadius.circular(20), // 둥근 모서리
              ),
              alignment: Alignment.center, // Container 내부의 모든 위젯을 중앙에 위치시킵니다.
              child: Text(
                globals.isThridCorrect ? '정답 : "${globals.selectedAnswer3}"' : '오답 : "${globals.selectedAnswer3}"',
                style: TextStyle(
                  color: Color(0xfffff6f6),
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins",
                  fontStyle: FontStyle.normal,
                  fontSize: 22.0,
                ),
                textAlign: TextAlign.center, // Text 위젯의 텍스트를 중앙 정렬합니다.
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: 330,
              height: 65, // 이전 색상과 모양으로 맞춘 Container
              decoration: BoxDecoration(
                color: globals.isFourCorrect ? Color(0xFF81c784) : Color(0xFFf28b82), // 이전에 사용한 초록색
                borderRadius: BorderRadius.circular(20), // 둥근 모서리
              ),
              alignment: Alignment.center, // Container 내부의 모든 위젯을 중앙에 위치시킵니다.
              child: Text(
                globals.isFourCorrect ? '정답 : "${globals.selectedAnswer4}"' : '오답 : "${globals.selectedAnswer4}"',
                style: TextStyle(
                  color: Color(0xfffff6f6),
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins",
                  fontStyle: FontStyle.normal,
                  fontSize: 22.0,
                ),
                textAlign: TextAlign.center, // Text 위젯의 텍스트를 중앙 정렬합니다.
              ),
            ),
            SizedBox(height: 110),
            SizedBox(
              width: 330,
              height: 65,
              child: ElevatedButton(
                onPressed: () {
                  if (openCount >= 0) {
                    SystemNavigator.pop(); // openCount가 0이상('다음'버튼 1회 터치 이상)이면 앱을 종료합니다.
                  } else {
                    // LockScreen2으로 이동합니다.
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LockScreen2()),
                    );
                  }
                  openCount++;
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(20)), // 버튼의 둥근 모서리
                        side: BorderSide(
                            color: const Color(0xffffffff),
                            width: 1), // 테두리 스타일
                      ),
                  primary: Color.fromARGB(248, 248, 197, 122),
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Icon(
                      Icons.arrow_forward,
                      size: 21.333,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}