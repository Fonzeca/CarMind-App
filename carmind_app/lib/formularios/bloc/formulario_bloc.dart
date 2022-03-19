import 'package:bloc/bloc.dart';
import 'package:carmind_app/api/api_client.dart';
import 'package:carmind_app/api/pojo/evaluacion/log_evaluacion.dart';
import 'package:carmind_app/main.dart';
import 'package:equatable/equatable.dart';

part 'formulario_event.dart';
part 'formulario_state.dart';

class FormularioBloc extends Bloc<FormularioEvent, FormularioState> {
  late ApiClient api;

  FormularioBloc() : super(const FormularioState(logs: [], loading: true)) {
    api = ApiClient(staticDio!);
    on<FormularioBuscarDataEvent>((event, emit) async {
      emit(state.copyWith(loading: true));

      List<LogEvaluacion> logs = await api.getLogEvaluacionesByLoggedUser();

      emit(state.copyWith(loading: false, logs: logs));
    });
  }
}
