
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';


class FormuarioContent extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
        child: ElevatedButton(
          child: const Text("QR Scanner"),
          onPressed: () async {
            String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                                                    "#ff6666", 
                                                    "Cancelar", 
                                                    false, 
                                                    ScanMode.QR);
                                                    
            log(barcodeScanRes);
          },

        ),
      ),
    );
  }

}
