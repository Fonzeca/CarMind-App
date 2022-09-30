import 'package:flutter_test/flutter_test.dart';

class FormsRobot {
  const FormsRobot(this.tester);
  final WidgetTester tester;

  Future<void> findTitle() async {
    expect(find.text("Últimos formularios"), findsOneWidget);
  }
}
