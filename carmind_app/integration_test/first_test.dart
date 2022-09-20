import 'dart:async';

import 'package:carmind_app/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mocktail/mocktail.dart';

void main() async {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('failing test example', (WidgetTester widgetTester) async {
    expect(2 + 2, equals(4));
  });
  testWidgets('screenshot', (WidgetTester widgetTester) async {
    await app.main();

    await binding.convertFlutterSurfaceToImage();

    await widgetTester.pumpAndSettle();
    await binding.takeScreenshot('screenshotName');
  });
}

class MockStorage extends Mock implements Storage {}

FutureOr<T> mockHydratedStorage<T>(
  T Function() body, {
  Storage? storage,
}) {
  return HydratedBlocOverrides.runZoned<T>(
    body,
    storage: storage ?? _buildMockStorage(),
  );
}

Storage _buildMockStorage() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final storage = MockStorage();
  when(() => storage.write(any(), any<dynamic>())).thenAnswer((_) async {});
  return storage;
}
