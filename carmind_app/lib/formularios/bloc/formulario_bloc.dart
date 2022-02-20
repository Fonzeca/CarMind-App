import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'formulario_event.dart';
part 'formulario_state.dart';

class FormularioBloc extends Bloc<FormularioEvent, FormularioState> {
  FormularioBloc() : super(FormularioLoadingState()) {
    on<FormularioBuscarDataEvent>((event, emit) {
      emit(FormularioLoadingState());
    });
    on<FormularioDataLoadedEvent>((event, emit) {
      emit(FormularioDataLoadedState());
    });
  }
}
