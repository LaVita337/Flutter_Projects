// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pomodorostopwatch/main.dart';

void main() {
  testWidgets('PomodoroTimer basic test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(PomodoroApp());

    // Verify that our timer starts at 25:00.
    expect(find.text('25:00'), findsOneWidget);

    // Tap the start button and wait for a short duration.
    await tester.tap(find.byIcon(Icons.play_arrow));
    await tester.pump(Duration(seconds: 2));

    // Verify that our timer has decremented.
    expect(find.text('24:58'), findsOneWidget);
  });
}
