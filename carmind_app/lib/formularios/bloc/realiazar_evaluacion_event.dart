part of 'realiazar_evaluacion_bloc.dart';

abstract class RealiazarEvaluacionEvent extends Equatable {
  const RealiazarEvaluacionEvent();

  @override
  List<Object> get props => [];
}


class IniciarEvaluacionEvent extends RealiazarEvaluacionEvent{
  final Evaluacion evaluacion;

  const IniciarEvaluacionEvent(this.evaluacion);

  @override
  List<Object> get props => [evaluacion];
}

class FinalizarPreguntaEvent extends RealiazarEvaluacionEvent{
  final int preguntaId;

  const FinalizarPreguntaEvent(this.preguntaId);

  @override
  List<Object> get props => [preguntaId];
}
