import 'package:carmind_app/api/api.dart';
import 'package:carmind_app/main.dart';
import 'package:carmind_app/profile/profile.dart';
import 'package:carmind_app/services/offline_mode_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../constants.dart';
import '../../services/services.dart';

part 'formulario_event.dart';
part 'formulario_state.dart';

class FormularioBloc extends Bloc<FormularioEvent, FormularioState> {
  late ApiClient api;
  DateTime? lastTimeFetched;
  List<LogEvaluacion>? logs;
  bool needToUpdate = false;

  FormularioBloc() : super(const FormularioState(logs: [], loading: true)) {
    api = ApiClient(staticDio!);
    on<FormularioBuscarDataEvent>((event, emit) async {
      emit(state.copyWith(loading: true));
      lastTimeFetched ??= DateTime.now();

      if (logs != null && (DateTime.now().difference(lastTimeFetched!).inMinutes < 3 && !event.forceWaiting)) {
        emit(state.copyWith(loading: false));
        return;
      }

      if (OfflineModeService.isOffline(context: event.context)) {
        logs = BlocProvider.of<OfflineBloc>(event.context).state.logEvaluaciones;
      } else {
        try {
          logs = await api.getLogEvaluacionesByLoggedUser('50');
        } catch (e) {
          if (OfflineModeService.isOffline(context: event.context)) {
            add(FormularioBuscarDataEvent(event.context, forceWaiting: event.forceWaiting));
            return;
          }
        }
      }

      lastTimeFetched = DateTime.now();
      var format = DateFormat(dateTimeFormat);
      logs ??= [];
      logs!.sort((a, b) => format.parse(b.fecha!).compareTo(format.parse(a.fecha!)));
      emit(state.copyWith(loading: false, logs: logs, updateLogs: true));
    });
  }
}
