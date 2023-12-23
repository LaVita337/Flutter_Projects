library globals;

String selectedFileName = ''; // 랜덤 생성 된 이미지 파일명 변수 

String selectedAnswer = ''; // question1 정답 or 오답 저장 변수

String selectedAnswer2 = ''; // question1 정답 or 오답 저장 변수

String selectedAnswer3 = ''; // question2 정답 or 오답 저장 변수

String selectedAnswer4 = ''; // question2 정답 or 오답 저장 변수

bool isfirstCorrect = false; // question1 answerOptions[0]이 정답인지 오답인지 가리는 변수

bool isSecondOptionCorrect = false;  // question1 answerOptions[1]이 정답인지 오답인지 가리는 변수

bool isThridCorrect = false; // question2 answerOptions[0]이 정답인지 오답인지 가리는 변수

bool isFourCorrect = false; // question2 answerOptions[1]이 정답인지 오답인지 가리는 변수


String apiResponse = '';  // GPT-3.5 API 프롬프트 결과 저장 변수 