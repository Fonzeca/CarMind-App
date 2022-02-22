part of 'realiazar_evaluacion_bloc.dart';

class RealiazarEvaluacionState extends Equatable {
  final int preguntaActual;
  final List<int> preguntasRespondidas;
  final List<int> seccionesTerminadas;
  final bool evaluacionIniciada;

  final bool mandandoEvaluacion;
  final bool evaluacionTerminada;

  const RealiazarEvaluacionState(
      {required this.evaluacionIniciada,
      required this.preguntaActual,
      required this.preguntasRespondidas,
      required this.evaluacionTerminada,
      required this.seccionesTerminadas,
      required this.mandandoEvaluacion});

  RealiazarEvaluacionState copyWith(
      {int? pPreguntaActual,
      List<int>? pPreguntasRespondidas,
      bool? pEvaluaconIniciada,
      bool? pEvaluacionTerminada,
      List<int>? pSeccionesTermiandas,
      bool? pMandandoEvaluacion}) {
    return RealiazarEvaluacionState(
        preguntaActual: pPreguntaActual ?? preguntaActual,
        preguntasRespondidas: pPreguntasRespondidas ?? preguntasRespondidas,
        evaluacionTerminada: pEvaluacionTerminada ?? evaluacionTerminada,
        evaluacionIniciada: pEvaluaconIniciada ?? evaluacionIniciada,
        seccionesTerminadas: pSeccionesTermiandas ?? seccionesTerminadas,
        mandandoEvaluacion: pMandandoEvaluacion ?? mandandoEvaluacion);
  }

  @override
  List<Object> get props => [preguntaActual, preguntasRespondidas, evaluacionIniciada, evaluacionTerminada, seccionesTerminadas, mandandoEvaluacion];
}
