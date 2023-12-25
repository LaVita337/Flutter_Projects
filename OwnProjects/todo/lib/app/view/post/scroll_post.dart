import 'package:flutter/material.dart';
import 'package:todo/app/view/post/widgets/bottom_bar.dart';

import 'currentScreen.dart';

Widget scrollPost() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Expanded(child: currentScreen()),
      BottomBar(),
    ],
  );
}
