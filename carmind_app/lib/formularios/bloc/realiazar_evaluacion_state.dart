part of 'realiazar_evaluacion_bloc.dart';

class RealiazarEvaluacionState extends Equatable {
  final int preguntaActual;
  final List<int> preguntasRespondidas;
  final bool evaluacionIniciada;

  final bool mandandoEvaluacion;
  final bool evaluacionTerminada;

  const RealiazarEvaluacionState(
      {required this.evaluacionIniciada,
      required this.preguntaActual,
      required this.preguntasRespondidas,
      required this.evaluacionTerminada,
      required this.mandandoEvaluacion});

  RealiazarEvaluacionState copyWith(
      {int? pPreguntaActual, List<int>? pPreguntasRespondidas, bool? pEvaluaconIniciada, bool? pEvaluacionTerminada, bool? pMandandoEvaluacion}) {
    return RealiazarEvaluacionState(
        preguntaActual: pPreguntaActual ?? preguntaActual,
        preguntasRespondidas: pPreguntasRespondidas ?? preguntasRespondidas,
        evaluacionTerminada: pEvaluacionTerminada ?? evaluacionTerminada,
        evaluacionIniciada: pEvaluaconIniciada ?? evaluacionIniciada,
        mandandoEvaluacion: pMandandoEvaluacion ?? mandandoEvaluacion);
  }

  @override
  List<Object> get props => [preguntaActual, preguntasRespondidas, evaluacionIniciada, evaluacionTerminada, mandandoEvaluacion];
}
