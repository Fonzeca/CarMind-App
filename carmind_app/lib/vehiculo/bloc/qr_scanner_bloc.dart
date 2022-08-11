import 'package:carmind_app/profile/bloc/offline_bloc.dart';
import 'package:carmind_app/services/services.dart';
import 'package:carmind_app/vehiculo/vehiculo.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../api/api.dart';
import '../../home/home.dart';
import '../../main.dart';

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
      if (reg.hasMatch(result)) {
        var match = reg.firstMatch(result);

        idVehiculo = int.parse(match!.group(1)!);
      } else {
        emit(QrScannerInitial());
        EasyLoading.showError("Qr invalido");
        return;
      }

      if (OfflineModeService.isOffline) {
        BlocProvider.of<OfflineBloc>(event.context).add(IniciarUsoVehiculoOffline(idVehiculo));
      } else {
        try {
          await api.iniciarUso(idVehiculo);
          BlocProvider.of<OfflineBloc>(event.context).add(IniciarUsoVehiculoOffline(idVehiculo));
        } catch (e) {
          emit(QrScannerInitial());
          FirebaseCrashlytics.instance
              .recordError('Detalles: ${e.toString()}', StackTrace.current, reason: 'Error al intentar iniciar uso de un vehiculo');
          return;
        }
      }
      emit(QrScannerInitial());
      EasyLoading.dismiss();

      BlocProvider.of<HomeBloc>(event.context).add(const HomeNavigationEvent(1));
      BlocProvider.of<VehiculoBloc>(event.context).vehiculo = null;
      BlocProvider.of<VehiculoBloc>(event.context).add(GetCurrent(event.context));
      final bool showDejarDeUsarVehiculo = BlocProvider.of<VehiculoBloc>(event.context).vehiculo != null;
      BlocProvider.of<HomeBloc>(event.context).add(ShowDejarDeUsarVehiculoEvent(showDejarDeUsarVehiculo));
    });
  }
}
