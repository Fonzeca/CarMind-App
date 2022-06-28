part of 'realizar_evaluacion_bloc.dart';

abstract class RealizarEvaluacionEvent extends Equatable {
  const RealizarEvaluacionEvent();

  @override
  List<Object> get props => [];
}

class IniciarEvaluacionEvent extends RealizarEvaluacionEvent {
  final Evaluacion evaluacion;
  final Vehiculo vehiculo;

  const IniciarEvaluacionEvent(this.evaluacion, this.vehiculo);

  @override
  List<Object> get props => [evaluacion];
}

class FinalizarPreguntaEvent extends RealizarEvaluacionEvent {
  final int preguntaId;
  final RespuestaPojo respuesta;

  const FinalizarPreguntaEvent(this.preguntaId, this.respuesta);

  @override
  List<Object> get props => [preguntaId, respuesta];
}

class FinalizarEvaluacionEvent extends RealizarEvaluacionEvent {
  const FinalizarEvaluacionEvent();

  @override
  List<Object> get props => [];
}

class ValidarTextFieldEvent extends RealizarEvaluacionEvent {
  final bool isFieldEmptyError;
  final bool isFieldNotNumberError;

  const ValidarTextFieldEvent(this.isFieldEmptyError, this.isFieldNotNumberError);

  @override
  List<Object> get props => [isFieldEmptyError, isFieldNotNumberError];
}

class RestoreDataEvent extends RealizarEvaluacionEvent {
  final XFile restoredData;
  final Evaluacion evaluacion;
  final Vehiculo vehiculo;

  const RestoreDataEvent(this.evaluacion, this.vehiculo, this.restoredData);
}
