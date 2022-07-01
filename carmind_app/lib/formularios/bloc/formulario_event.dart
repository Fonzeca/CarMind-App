part of 'formulario_bloc.dart';

abstract class FormularioEvent extends Equatable {
  const FormularioEvent();

  @override
  List<Object> get props => [];
}

class FormularioBuscarDataEvent extends FormularioEvent {
  final bool forceWaiting;

  const FormularioBuscarDataEvent({this.forceWaiting = false});
}
