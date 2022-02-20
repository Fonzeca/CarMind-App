part of 'formulario_bloc.dart';

abstract class FormularioState extends Equatable {
  const FormularioState();
  
  @override
  List<Object> get props => [];
}

class FormularioDataLoadedState extends FormularioState {}

class FormularioLoadingState extends FormularioState{}


