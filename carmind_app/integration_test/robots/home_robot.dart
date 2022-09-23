import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class HomeRobot {
  const HomeRobot(this.tester);
  final WidgetTester tester;

  Future<void> clickVehicleNavButton() async {
    final vehicleNavButtonFinder = find.text("Vehículos");

    await tester.tap(vehicleNavButtonFinder);

    await tester.pumpAndSettle();
  }

    Future<void> clickProfileNavButton() async {
    final profileNavButtonFinder = find.text("Perfil");

    await tester.tap(profileNavButtonFinder);

    await tester.pumpAndSettle();
  }

  Future<void> clickQRAndUseVehicleButton() async {
    final qrButtonFinder = find.byKey(const Key("QRButton"));

    await tester.ensureVisible(qrButtonFinder);
    await tester.tap(qrButtonFinder);

    await tester.pumpAndSettle();

    final scanButtonFinder = find.byKey(const Key("ScanVehicleButton"));

    await tester.ensureVisible(scanButtonFinder);
    await tester.tap(scanButtonFinder);

    await tester.pumpAndSettle();

    await tester.pumpAndSettle();
  }

  Future<void> clickQRAndUnUseVehicleButton() async {
    await tester.pumpAndSettle();
    final qrButtonFinder = find.byKey(const Key("QRButton"));

    await tester.ensureVisible(qrButtonFinder);
    await tester.tap(qrButtonFinder);

    await tester.pumpAndSettle();

    final scanButtonFinder = find.byKey(const Key("UnUseVehicleButton"));

    await tester.ensureVisible(scanButtonFinder);
    await tester.tap(scanButtonFinder);

    await tester.pumpAndSettle();
  }
}
