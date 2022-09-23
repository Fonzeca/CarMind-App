import 'package:flutter_test/flutter_test.dart';

class ProfileRobot {
  const ProfileRobot(this.tester);
  final WidgetTester tester;

  Future<void> clickLogoutButton() async {
    final logoutButtonFinder = find.text("Cerrar sesion");

    await tester.ensureVisible(logoutButtonFinder);
    await tester.tap(logoutButtonFinder);

    await tester.pumpAndSettle();
  }
}
