import 'package:AIBudget/features/main_navigation/main_navigation_screen.dart';
import 'package:AIBudget/features/main_navigation/widgets/card_Box.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class StackDialog extends StatefulWidget {
  final double initialIndex;
  final PageController controller;

  const StackDialog({
    super.key,
    required this.controller,
    this.initialIndex = 0.0,
  });

  @override
  _StackDialogState createState() => _StackDialogState();
}

class _StackDialogState extends State<StackDialog>
    with TickerProviderStateMixin {
  bool dialogShowContainer = false;
  late AnimationController dialogFadeController;
  late double _currentIndex;

  void _dialogOnClosePressed() {
    print("Close button pressed!");
    dialogFadeController.reverse().then((value) {
      setState(() {
        dialogShowContainer = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    dialogFadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    dialogFadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        height: 600, // 원하는 높이를 설정하세요.
        width: 400, // 원하는 너비를 설정하세요.
        child: Stack(
          children: [
            SizedBox(
              height: 600,
              child: PageView.builder(
                controller: widget.controller,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: CardBox(
                      height: 800,
                      onTap: () {
                        setState(() {
                          dialogShowContainer = true;
                          dialogFadeController.forward();
                        });
                      },
                    ),
                  );
                },
                onPageChanged: (int index) {
                  setState(() {
                    _currentIndex = index.toDouble();
                    dialogShowContainer = false;
                    dialogFadeController.reverse();
                  });
                },
              ),
            ),
            if (dialogShowContainer)
              Positioned(
                top: 450,
                left: 25,
                child: FadeTransition(
                  opacity: dialogFadeController,
                  child: Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 5),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Text(
                              "Lorem Ipsum is simply dummy text.",
                              style: TextStyle(fontSize: 14),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                          CircleAvatar(
                            child: IconButton(
                              onPressed: _dialogOnClosePressed,
                              color: Colors.black,
                              icon: const Icon(Icons.close),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: DotsIndicator(
                decorator: DotsDecorator(
                  activeColor: kbYellow,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide.none,
                  ),
                ),
                dotsCount: 4,
                position: _currentIndex,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
