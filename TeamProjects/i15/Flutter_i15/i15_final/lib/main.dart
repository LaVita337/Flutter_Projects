import 'package:flutter/material.dart';
import 'package:i15_app/screen/home/widgets/review.dart';
import 'package:i15_app/screen/home/widgets/review2.dart';
import 'package:i15_app/screen/home/widgets/answer/answer.dart';
import 'package:i15_app/screen/home/widgets/answer/answer2.dart';
import 'package:i15_app/screen/home/widgets/lockscreen.dart';
import 'package:i15_app/screen/home/widgets/answer/wrong.dart';
import 'package:i15_app/screen/home/widgets/answer/wrong2.dart';
import 'package:i15_app/screen/home/widgets/nextlock/lockscreen2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // MethodChannel 초기화
  static const platform = MethodChannel('com.example.i15_app/screen');

  @override
  Widget build(BuildContext context) {
    // MethodChannel 핸들러 설정
    platform.setMethodCallHandler((call) async {
      if (call.method == "showLockScreen") {
        Navigator.of(context).pushNamed('/lockscreen');
      }
    });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'i15',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Georgia',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/lockscreen', // 초기 라우트를 '/lockscreen'으로 설정
      routes: {
        '/lockscreen': (context) => LockScreen(), // 잠금 화면을 '/lockscreen' 경로에 매핑
        '/lockscreen2': (context) => LockScreen2(), // 다음 문제를 lockScreen2에 매핑
        '/home': (context) => const HomePage(), // 메인 화면을 '/home' 경로에 매핑
        '/answer': (context) => Answer(), // 정답화면으로 이동
        '/answer2': (context) => Answer2(), // 정답화면2으로 이동
        '/wrong': (context) => Wrong(), // 오답화면으로 이동
        '/wrong2': (context) => Wrong2(), // 오답화면2으로 이동
        '/review': (context) => Review(), // 리뷰화면으로 이동
        '/review2': (context) => Review2(), // 리뷰화면으로 이동
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('메인 화면'),
      ),
      body: const Center(
        child: Text('앱의 메인 화면'),
      ),
    );
  }
}
