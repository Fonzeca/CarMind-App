import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart';

import 'package:carmind_app/main.dart' as app;
import 'package:integration_test/integration_test.dart';

import 'robots/forms_robot.dart';
import 'robots/home_robot.dart';
import 'robots/login_robot.dart';
import 'robots/on_boarding_robot.dart';
import 'robots/profile_robot.dart';
import 'robots/vehicle_robot.dart';

void main() async {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  const MethodChannel channel = MethodChannel('plugins.flutter.io/flutter_barcode_scanner');

  channel.setMockMethodCallHandler((MethodCall methodCall) async {
    if (methodCall.method == 'scanBarcode') {
      return "CarMind-vehiculo=658-CarMind";
    } else {
      return "";
    }
  });

  LoginRobot loginRobot;
  OnBoardingRobot onBoardingRobot;
  HomeRobot homeRobot;
  FormsRobot formsRobot;
  VehicleRobot vehicleRobot;
  ProfileRobot profileRobot;

  group('e2e test', () {
    testWidgets('Whole App', (WidgetTester tester) async {
      app.main();

      loginRobot = LoginRobot(tester);
      onBoardingRobot = OnBoardingRobot(tester);
      formsRobot = FormsRobot(tester);
      vehicleRobot = VehicleRobot(tester);
      homeRobot = HomeRobot(tester);
      profileRobot = ProfileRobot(tester);

      await tester.pumpAndSettle(const Duration(seconds: 5));

      await loginRobot.writeEmail();
      await loginRobot.writePassword();
      await loginRobot.clickLoginButton();

      await onBoardingRobot.closeTutorial();

      await formsRobot.findTitle();

      await homeRobot.clickVehicleNavButton();

      await vehicleRobot.findVehicleTitle();
      await vehicleRobot.checkIfIsDrivingVehicle();

      await homeRobot.clickQRAndUseVehicleButton();
      await homeRobot.clickQRAndUnUseVehicleButton();
      await homeRobot.clickProfileNavButton();

      await profileRobot.clickLogoutButton();
    });
  });

  testWidgets('screenshot', (WidgetTester widgetTester) async {
    await app.main();
  });
}

extension MethodChannelMock on MethodChannel {
  Future<void> invokeMockMethod(String method, dynamic arguments) async {
    const codec = StandardMethodCodec();
    final data = codec.encodeMethodCall(MethodCall(method, arguments));

    return ServicesBinding.instance.defaultBinaryMessenger.handlePlatformMessage(
      name,
      data,
      (ByteData? data) {},
    );
  }
}
