import 'package:carmind_app/api/api_client.dart';
import 'package:carmind_app/home/bloc/home_bloc.dart';
import 'package:carmind_app/main.dart';
import 'package:carmind_app/vehiculo/bloc/vehiculo_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

part 'qr_scanner_event.dart';
part 'qr_scanner_state.dart';

class QrScannerBloc extends Bloc<QrScannerEvent, QrScannerState> {
  late ApiClient api;

  QrScannerBloc() : super(QrScannerInitial()) {
    api = ApiClient(staticDio!);
    on<QrEscaneoEvent>((event, emit) async {
      emit(QrCargando());

      var result = event.result;

      //CarMind-vehiculo=71-CarMind
      var reg = RegExp(r'^CarMind-vehiculo=(\d*)-CarMind$');
      String s = result.code!;
      var match = reg.firstMatch(s);

      int idVehiculo = int.parse(match!.group(1)!);

      await api.iniciarUso(idVehiculo);

      BlocProvider.of<HomeBloc>(event.context).add(HomeNavigationEvent(1));
      BlocProvider.of<VehiculoBloc>(event.context).add(GetCurrent());

      Navigator.of(event.context).pop();
      emit(QrScannerInitial());
    });
  }
}
