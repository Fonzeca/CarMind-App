import 'dart:io';

import 'package:integration_test/integration_test_driver_extended.dart';

Future<void> main() async {
  const String adbPath = 'C:/Users/marti/AppData/Local/Android/Sdk/platform-tools/adb.exe';
  await Process.run(adbPath, ['shell', 'pm', 'grant', 'com.mindia.carmind_app', 'android.permission.CAMERA']);
  await integrationDriver(
    onScreenshot: (name, imageBytes) async {
      final File image = File("./$name.png");
      image.writeAsBytesSync(imageBytes);
      return true;
    },
  );
}
