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
  final bool isRestoredData;

  const FinalizarPreguntaEvent(this.preguntaId, this.respuesta, {this.isRestoredData = false});

  @override
  List<Object> get props => [preguntaId, respuesta];
}

class FinalizarEvaluacionEvent extends RealizarEvaluacionEvent {
  const FinalizarEvaluacionEvent();

  @override
  List<Object> get props => [];
}
class RestoreDataEvent extends RealizarEvaluacionEvent {
  final XFile restoredData;
  final Evaluacion evaluacion;
  final Vehiculo vehiculo;

  const RestoreDataEvent(this.evaluacion, this.vehiculo, this.restoredData);
}
