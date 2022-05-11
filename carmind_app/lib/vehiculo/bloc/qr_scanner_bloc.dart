import 'package:carmind_app/api/api_client.dart';
import 'package:carmind_app/api/pojo/vehiculo/log_uso.dart';
import 'package:carmind_app/home/bloc/home_bloc.dart';
import 'package:carmind_app/main.dart';
import 'package:carmind_app/vehiculo/bloc/vehiculo_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'qr_scanner_event.dart';
part 'qr_scanner_state.dart';

class QrScannerBloc extends Bloc<QrScannerEvent, QrScannerState> {
  late ApiClient api;

  QrScannerBloc() : super(QrScannerInitial()) {
    api = ApiClient(staticDio!);
    on<QrEscaneoEvent>((event, emit) async {
      emit(QrCargando());
      EasyLoading.show();

      var result = event.result;
      int idVehiculo = 0;

      //CarMind-vehiculo=71-CarMind
      var reg = RegExp(r'^CarMind-vehiculo=(\d*)-CarMind$');
      String s = result.code!;
      if (reg.hasMatch(s)) {
        var match = reg.firstMatch(s);

        idVehiculo = int.parse(match!.group(1)!);
      } else {
        emit(QrScannerInitial());
        EasyLoading.showError("Qr invalido");
        Navigator.of(event.context).pop();
        return;
      }

      var sh = await SharedPreferences.getInstance();
      if (sh.getBool("offline") != null && sh.getBool("offline")!) {
        var box = Hive.box<LogUso>("logUso");
        var log = LogUso()
          ..enUso = true
          ..vehiculoId = idVehiculo
          ..fecha = DateFormat("dd/MM/yyyy HH:mm:ss").format(DateTime.now());
        box.add(log);
      } else {
        try {
          await api.iniciarUso(idVehiculo);
        } catch (e) {
          Navigator.of(event.context).pop();
          emit(QrScannerInitial());
          return;
        }
      }
      emit(QrScannerInitial());
      EasyLoading.dismiss();

      BlocProvider.of<HomeBloc>(event.context).add(HomeNavigationEvent(1));
      BlocProvider.of<VehiculoBloc>(event.context).add(GetCurrent());

      Navigator.of(event.context).pop();
    });
  }
}
