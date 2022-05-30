import 'package:bloc/bloc.dart';
import 'package:carmind_app/api/api_client.dart';
import 'package:carmind_app/api/pojo/evaluacion/evaluacion.dart';
import 'package:carmind_app/api/pojo/evaluacion/log_evaluacion.dart';
import 'package:carmind_app/api/pojo/evaluacion/log_evaluacion_terminada.dart';
import 'package:carmind_app/constants.dart' as constants;
import 'package:carmind_app/main.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'formulario_event.dart';
part 'formulario_state.dart';

class FormularioBloc extends Bloc<FormularioEvent, FormularioState> {
  late ApiClient api;

  FormularioBloc() : super(const FormularioState(logs: [], loading: true)) {
    api = ApiClient(staticDio!);
    on<FormularioBuscarDataEvent>((event, emit) async {
      emit(state.copyWith(loading: true));

      List<LogEvaluacion> logs;

      var sh = await SharedPreferences.getInstance();

      if (sh.getBool("offline") != null && sh.getBool("offline")!) {
        var box = Hive.box<LogEvaluacion>("logs").values;
        logs = box.toList();

        var boxLogsOffline = Hive.box<LogEvaluacionTerminadaPojo>('evaluacionesTerminadas');
        var boxEvaluaciones = Hive.box<Evaluacion>('evaluaciones');

        logs.addAll(boxLogsOffline.values.map((e) {
          var log = LogEvaluacion();
          log.evaluacion_id = e.evaluacionId;
          log.fecha = e.fecha;
          log.nombre_evaluacion = boxEvaluaciones.get(e.evaluacionId)?.titulo;
          log.vehiculo_id = e.respuesta?.vehiculo_id;
          return log;
        }));

        var format = DateFormat(constants.dateTimeFormat);

        logs.sort((a, b) => format.parse(b.fecha!).compareTo(format.parse(a.fecha!)));
      } else {
        logs = await api.getLogEvaluacionesByLoggedUser();
      }

      emit(state.copyWith(loading: false, logs: logs));
    });
  }
}
