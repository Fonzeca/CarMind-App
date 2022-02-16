import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'formulario_event.dart';
part 'formulario_state.dart';

class FormularioBloc extends Bloc<FormularioEvent, FormularioState> {
  FormularioBloc() : super(FormularioInitial()) {
    on<FormularioEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
