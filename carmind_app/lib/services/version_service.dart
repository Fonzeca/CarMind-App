import 'dart:io';

import 'package:carmind_app/services/services.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:version/version.dart';

import '../api/api.dart';
import '../constants.dart';
import '../main.dart';

class VersionService {
  static Version? _currentVersion;
  static Version? _lastVersion;
  static String? currentPlatform;

  static Future<bool> isNewVersionAvailable() async {
    if (OfflineModeService.isOffline) return false;

    if (_currentVersion == null) {
      await _getCurrentVersion();
    }

    if (_lastVersion == null) {
      await _getLastVersion();
    }

    if (_lastVersion! > _currentVersion!) return true;

    return false;
  }

  static Future<void> _getCurrentVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    _currentVersion = Version.parse(packageInfo.version);
  }

  static Future<void> _getLastVersion() async {
    final ApiClient api;
    api = ApiClient(staticDio!);

    if (Platform.isAndroid) {
      currentPlatform = androidPlatform;
    } else {
      currentPlatform = iosPlatform;
    }
    VersionView lastVersion = await api.getLastVersionByPlatform(currentPlatform!);
    _lastVersion = Version.parse(lastVersion.storeVersion);
  }

  static Future<void> showVersionAvailableAlert(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Nueva Versión Disponible', style: TextStyle(color: carMindTopBar)),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Row(
                  children: [
                    const Text('Tu versión de CarMind es la '),
                    Text(
                      _currentVersion.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Row(
                  children: [
                    const Text('La última versión es la '),
                    Text(
                      _lastVersion.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const Text(''),
                const Text('¿Deseas actualizar la aplicación ahora?'),
              ],
            ),
          ),
          actionsAlignment: MainAxisAlignment.spaceAround,
          actions: <Widget>[
            TextButton(
              child: Text('Ignorar', style: TextStyle(color: Colors.red.withAlpha(200))),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                'Actualizar',
                style: TextStyle(color: carMindAccent2Color),
              ),
              onPressed: () async => await launchUrl(Uri.parse(appStoreLinks[currentPlatform]!), mode: LaunchMode.externalApplication),
            ),
          ],
        );
      },
    );
  }
}
