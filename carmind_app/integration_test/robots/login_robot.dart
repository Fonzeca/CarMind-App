import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

class LoginRobot {
  const LoginRobot(this.tester);
  final WidgetTester tester;

  Future<void> writeEmail() async {
    final emailTextFieldFinder = find.byKey(const Key("EmailTextFormField"));

    await tester.ensureVisible(emailTextFieldFinder);
    await tester.enterText(emailTextFieldFinder, "martinpelli@outlook.com");

    await tester.pumpAndSettle();
  }

  Future<void> writePassword() async {
    final passTextFieldFinder = find.byKey(const Key("PassTextFormField"));

    await tester.ensureVisible(passTextFieldFinder);
    await tester.enterText(passTextFieldFinder, "123456");

    await tester.pumpAndSettle();
  }

  Future<void> clickLoginButton() async {
    final loginButtonFinder = find.byType(ElevatedButton);

    await tester.ensureVisible(loginButtonFinder);
    await tester.tap(loginButtonFinder);

    await tester.pumpAndSettle();
  }
}
