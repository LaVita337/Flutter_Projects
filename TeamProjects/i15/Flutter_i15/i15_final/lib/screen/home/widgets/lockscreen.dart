import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';
import 'Quiz_question.dart';
export 'lockscreen.dart';
import '../../../globals.dart' as globals;


class LockScreen extends StatefulWidget {
  @override
  _LockScreenState createState() => _LockScreenState();
}


class _LockScreenState extends State<LockScreen> {
  String currentImage = '';
  String currentCaption = '';
  QuizQuestion? currentQuestion;
  List<String> answerOptions = [];
  String questionText = '';

  // 이 배열은 미리 정의된 JSON 파일 이름 목록을 나타냅니다.
  // 실제 앱에서는 이 목록을 서버에서 받아오거나, 앱 빌드 과정에서 생성할 수 있습니다.
  final jsonFileNames = [
    'image1','image2','image3','image4','image5','image6','image7',
    'image8','image9','image10','image11','image12','image13','image14',
    'image15','image16','image17','image18','image19','image20','image21',
    'image22', 'image23','image24','image25'
    
  ];

  @override
  void initState() {
    super.initState();
    pickRandomImageAndCaption();
    loadRandomQuestion();
  }

  void pickRandomImageAndCaption() async {
    final random = Random();
    final index = random.nextInt(jsonFileNames.length);
    globals.selectedFileName = jsonFileNames[index];

    final String response = await rootBundle.loadString('asset/Quiz_image_json/${globals.selectedFileName}.json');
    final data = json.decode(response);

    setState(() {
      currentImage = '${globals.selectedFileName}.jpg';
      currentCaption = data['caption'];
    });
  }

  void loadRandomQuestion() async {
  
    final String response = await rootBundle.loadString('asset/Quiz_json/${globals.selectedFileName}.json');
    final data = json.decode(response);

    // 'Question1'의 데이터를 사용
    final questionData = data['question1'];
    
    setState(() {
      currentQuestion = QuizQuestion.fromJson(questionData);
      answerOptions = [
  currentQuestion?.correctAnswer,
  currentQuestion?.incorrectAnswer
].where((answer) => answer != null).cast<String>().toList()..shuffle();
  questionText = '여기서 "${currentQuestion?.keyWord}"은(는) 어느 단어로 바꿀 수 있을까요?';
  globals.selectedAnswer = answerOptions[0];
  globals.selectedAnswer2 = answerOptions[1];

  globals.isfirstCorrect = answerOptions.isNotEmpty && 
                      answerOptions[0] == currentQuestion?.correctAnswer;
  globals.isSecondOptionCorrect = answerOptions.length > 1 && 
                                  answerOptions[1] == currentQuestion?.correctAnswer;

    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFaedefc),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:[
              SizedBox(height: 60), // 이미지 컨테이너 박스 마진 값
              if (currentImage.isNotEmpty) ...[
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
                            'asset/Quiz_image/$currentImage', // 수정된 부분: 랜덤 이미지 표시
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),  // height 10 -> 15 으로 변경 이미지 캡션 마진 값
                      Text(
                        currentCaption, // 수정된 부분: 랜덤 캡션 표시
                        style: TextStyle(
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w700,
                          fontFamily: "Poppins",
                          fontStyle: FontStyle.normal,
                          fontSize: 17.0,   // 폰트사이즈 15 -> 17로 변경
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20), // 랜덤 캡션 위쪽 박스 값
                SizedBox(
                  width: 330,
                  height: 70,
                  child: Text(
                    questionText, // 질문 변수
                    style: const TextStyle(
                      color: Color(0xffffffff),
                      fontWeight: FontWeight.w700,
                      fontFamily: "Poppins",
                      fontStyle: FontStyle.normal,
                      fontSize: 22.0,                 // 폰트사이즈 20으로 변경
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 130), // 회색 버튼 1 위쪽 박스 값
                SizedBox(
                  width: 330,
                  height: 70,
                // 다음은 버튼들입니다. 이 부분은 원래 코드와 같습니다.
                child: ElevatedButton(
                  onPressed: () {
                    if (globals.isfirstCorrect) {
      // 정답일 경우 Answer 페이지로 이동
      Navigator.pushNamed(context, '/answer');
      
    } else {
      // 오답일 경우 Wrong 페이지로 이동
      Navigator.pushNamed(context, '/wrong');
    } 
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,                       // red-> grey
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15), // 가로 및 세로 여백을 조절하여 버튼 크기 조절
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: Text(answerOptions[0], style: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold,)), //글씨 색 굵기 변경
                ),
              ),
                SizedBox(height: 30), // 회색 버튼 사이 박스 값
                SizedBox(
                  width: 330,
                  height: 70,       
                child: ElevatedButton(
                  onPressed: () {
                    if (globals.isSecondOptionCorrect) {
      // 정답일 경우 Answer 페이지로 이동
      Navigator.pushNamed(context, '/answer');
      
    } else {
      // 오답일 경우 Wrong 페이지로 이동
      Navigator.pushNamed(context, '/wrong');
    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,               // blue-> grey
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15), // 가로 및 세로 여백을 조절하여 버튼 크기 조절
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: Text(answerOptions[1], style: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold,)), //글씨 색 굵기 변경
                ),
              ),
                SizedBox(height: 10),
              ] else ...[
                CircularProgressIndicator(),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
