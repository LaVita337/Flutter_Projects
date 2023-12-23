import 'package:AIBudget/constants/gaps.dart';
import 'package:AIBudget/constants/sizes.dart';
import 'package:AIBudget/features/main_navigation/main_navigation_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(_createRoute());
    });
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const MainScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // 여기서는 FadeTransition을 사용하였지만, 다른 애니메이션 효과로 변경하실 수 있습니다.
        return FadeTransition(opacity: animation, child: child);
      },
      transitionDuration:
          const Duration(milliseconds: 300), // 애니메이션 지속 시간을 1초로 설정
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Sizes.size24),
        child: SafeArea(
          child: PageFirst(),
        ),
      ),
    );
  }
}

class PageFirst extends StatelessWidget {
  const PageFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'LOGO',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w800),
          ),
          Gaps.v20,
          Text(
            'Lorem Ipsum is simply dummy text',
            style: TextStyle(
              fontSize: Sizes.size16,
            ),
          ),
        ],
      ),
    );
  }
}
