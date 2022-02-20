part of 'realiazar_evaluacion_bloc.dart';

class RealiazarEvaluacionState extends Equatable {
  final int preguntaActual;
  final List<int> preguntasRespondidas;
  final bool evaluacionIniciada;
  final bool evaluacionTerminada;

  const RealiazarEvaluacionState({required this.evaluacionIniciada, required this.preguntaActual, required this.preguntasRespondidas, required this.evaluacionTerminada});

  RealiazarEvaluacionState copyWith({int? pPreguntaActual, List<int>? pPreguntasRespondidas, bool? pEvaluaconIniciada, bool? pEvaluacionTerminada}) {
    return RealiazarEvaluacionState(
      preguntaActual: pPreguntaActual ?? preguntaActual,
      preguntasRespondidas: pPreguntasRespondidas ?? preguntasRespondidas,
      evaluacionTerminada: pEvaluacionTerminada ?? evaluacionTerminada,
      evaluacionIniciada: pEvaluaconIniciada ?? evaluacionIniciada
    );
  }

  @override
  List<Object> get props => [preguntaActual, preguntasRespondidas, evaluacionIniciada, evaluacionTerminada];
}
