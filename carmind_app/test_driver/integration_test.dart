import 'dart:io';

import 'package:integration_test/integration_test_driver_extended.dart';

Future<void> main() async {
  await integrationDriver(
    onScreenshot: (name, imageBytes) async {
      final File image = File("./$name.png");
      image.writeAsBytesSync(imageBytes);
      return true;
    },
  );
}
