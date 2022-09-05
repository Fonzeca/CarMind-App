import 'package:bloc/bloc.dart';
import 'package:carmind_app/api/api.dart';
import 'package:carmind_app/main.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

import '../../constants.dart';

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

      var format = DateFormat(dateTimeFormat);

      lastTimeFetched ??= DateTime.now();
      if (logs == null || (DateTime.now().difference(lastTimeFetched!).inMinutes > 5 || event.forceWaiting)) {
        logs = await api.getLogEvaluacionesByLoggedUser('50');
        lastTimeFetched = DateTime.now();
      }
      emit(state.copyWith(loading: false, logs: logs));

      logs!.sort((a, b) => format.parse(b.fecha!).compareTo(format.parse(a.fecha!)));
    });
  }
}
