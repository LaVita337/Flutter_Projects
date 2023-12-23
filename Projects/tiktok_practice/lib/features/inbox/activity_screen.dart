import 'package:TikTok/constants/gaps.dart';
import 'package:TikTok/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  final List<String> _notifications =
      List.generate(10, (index) => "${index}h ago");

  late final AnimationController _animationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 200));

  late final Animation<double> _animation =
      Tween(begin: 0.0, end: 0.5).animate(_animationController);

  void _onTitleTap() {
    if (_animationController.isCompleted) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }

  void _onDissmissed(String notification) {
    _notifications.remove(notification);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: _onTitleTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("All activity"),
              Gaps.h6,
              RotationTransition(
                  turns: _animation,
                  child: const FaIcon(FontAwesomeIcons.chevronDown, size: 12)),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          Gaps.v14,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizes.size20),
            child: Text(
              "New",
              style: TextStyle(fontSize: Sizes.size14, color: Colors.grey),
            ),
          ),
          Gaps.v14,
          for (var notification in _notifications)
            Dismissible(
              key: Key(notification),
              onDismissed: (direction) => _onDissmissed(notification),
              background: Container(
                alignment: Alignment.centerLeft,
                color: Colors.green.shade400,
                child: const Padding(
                  padding: EdgeInsets.only(left: Sizes.size16),
                  child: FaIcon(
                    FontAwesomeIcons.checkDouble,
                    color: Colors.white,
                  ),
                ),
              ),
              secondaryBackground: Container(
                alignment: Alignment.centerRight,
                color: Colors.red.shade400,
                child: const Padding(
                  padding: EdgeInsets.only(right: Sizes.size16),
                  child: FaIcon(
                    FontAwesomeIcons.trashCan,
                    color: Colors.white,
                  ),
                ),
              ),
              child: ListTile(
                minVerticalPadding: Sizes.size16,
                leading: Container(
                  width: Sizes.size52,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: FaIcon(
                      FontAwesomeIcons.bell,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
                title: RichText(
                  text: TextSpan(
                    text: "Account updates:",
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.black),
                    children: [
                      const TextSpan(
                        text: " New features are coming soon!",
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                      TextSpan(
                        text: " $notification",
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                trailing: const FaIcon(FontAwesomeIcons.chevronRight, size: 16),
              ),
            ),
        ],
      ),
    );
  }
}
