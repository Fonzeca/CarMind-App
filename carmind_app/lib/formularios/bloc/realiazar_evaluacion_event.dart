part of 'realiazar_evaluacion_bloc.dart';

abstract class RealiazarEvaluacionEvent extends Equatable {
  const RealiazarEvaluacionEvent();

  @override
  List<Object> get props => [];
}

class IniciarEvaluacionEvent extends RealiazarEvaluacionEvent {
  final Evaluacion evaluacion;
  final Vehiculo vehiculo;

  const IniciarEvaluacionEvent(this.evaluacion, this.vehiculo);

  @override
  List<Object> get props => [evaluacion];
}

class FinalizarPreguntaEvent extends RealiazarEvaluacionEvent {
  final int preguntaId;
  final RespuestaPojo respuesta;

  const FinalizarPreguntaEvent(this.preguntaId, this.respuesta);

  @override
  List<Object> get props => [preguntaId, respuesta];
}

class FinalizarEvaluacionEvent extends RealiazarEvaluacionEvent {
  const FinalizarEvaluacionEvent();

  @override
  List<Object> get props => [];
}
