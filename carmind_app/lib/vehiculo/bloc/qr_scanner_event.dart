part of 'qr_scanner_bloc.dart';

abstract class QrScannerEvent extends Equatable {
  const QrScannerEvent();

  @override
  List<Object> get props => [];
}

class QrEscaneoEvent extends QrScannerEvent {
  final Barcode result;
  BuildContext context;

  QrEscaneoEvent(this.result, this.context);
}
