import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class OnBoardingRobot {
  const OnBoardingRobot(this.tester);
  final WidgetTester tester;

  Future<void> closeTutorial() async {
    final closeTutorialFinder = find.byKey(const Key("closeTutorialButton"));

    await tester.ensureVisible(closeTutorialFinder);
    await tester.tap(closeTutorialFinder);

    await tester.pumpAndSettle();
  }
}
