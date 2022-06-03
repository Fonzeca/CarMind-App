part of 'realizar_evaluacion_bloc.dart';

class RealizarEvaluacionState extends Equatable {
  final int preguntaActual;
  final List<int> preguntasRespondidas;
  final bool evaluacionIniciada;

  final bool mandandoEvaluacion;
  final bool evaluacionTerminada;
  final bool errorField;

  const RealizarEvaluacionState(
      {required this.evaluacionIniciada,
      required this.preguntaActual,
      required this.preguntasRespondidas,
      required this.evaluacionTerminada,
      required this.mandandoEvaluacion,
      required this.errorField
      });

  RealizarEvaluacionState copyWith(
      {int? pPreguntaActual, List<int>? pPreguntasRespondidas, bool? pEvaluaconIniciada, bool? pEvaluacionTerminada, bool? pMandandoEvaluacion, bool? errorField}) {
    return RealizarEvaluacionState(
        preguntaActual: pPreguntaActual ?? preguntaActual,
        preguntasRespondidas: pPreguntasRespondidas ?? preguntasRespondidas,
        evaluacionTerminada: pEvaluacionTerminada ?? evaluacionTerminada,
        evaluacionIniciada: pEvaluaconIniciada ?? evaluacionIniciada,
        mandandoEvaluacion: pMandandoEvaluacion ?? mandandoEvaluacion,
        errorField: errorField ?? this.errorField);
  }

  @override
  List<Object> get props => [preguntaActual, preguntasRespondidas, evaluacionIniciada, evaluacionTerminada, mandandoEvaluacion, errorField];
}
