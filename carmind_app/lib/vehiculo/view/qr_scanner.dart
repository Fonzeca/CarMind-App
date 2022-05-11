import 'dart:io';

import 'package:carmind_app/main.dart';
import 'package:carmind_app/vehiculo/bloc/qr_scanner_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrVehiculoScanner extends StatefulWidget {
  QrVehiculoScanner({Key? key}) : super(key: key);

  @override
  State<QrVehiculoScanner> createState() => _QrVehiculoScannerState();
}

class _QrVehiculoScannerState extends State<QrVehiculoScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;

  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(30),
            child: AppBar(
              centerTitle: true,
              title: const Text(
                "Código QR del vehículo",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              backgroundColor: carMindTopBar,
              leading: Material(
                color: Colors.transparent,
                child: InkWell(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(
                      Icons.close,
                    ),
                  ),
                ),
              ),
            ),
          ),
          body: Column(
            children: <Widget>[
              Container(
                height: 1,
                width: double.infinity,
                color: const Color(0xFF815FFF),
              ),
              Container(
                height: 29,
                width: double.infinity,
                color: carMindTopBar,
                alignment: AlignmentDirectional.center,
                child: const Text(
                  "Escaneá",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
                ),
              ),
              Expanded(
                flex: 5,
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                ),
              ),
            ],
          ),
        ),
        BlocBuilder<QrScannerBloc, QrScannerState>(
          builder: (context, state) {
            if (state is! QrCargando) {
              return const SizedBox();
            }
            return Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black54,
              child: const SizedBox(),
            );
          },
        )
      ],
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        controller.pauseCamera();
        BlocProvider.of<QrScannerBloc>(context).add(QrEscaneoEvent(result!, context));
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
