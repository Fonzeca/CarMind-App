import 'package:bloc/bloc.dart';
import 'package:carmind_app/api/api_client.dart';
import 'package:carmind_app/api/pojo/evaluacion/log_evaluacion.dart';
import 'package:carmind_app/main.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
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
      } else {
        logs = await api.getLogEvaluacionesByLoggedUser();
      }

      emit(state.copyWith(loading: false, logs: logs));
    });
  }
}
