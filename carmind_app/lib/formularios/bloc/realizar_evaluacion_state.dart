part of 'realizar_evaluacion_bloc.dart';

class RealizarEvaluacionState extends Equatable {
  final int preguntaActual;
  final List<int> preguntasRespondidas;
  final bool evaluacionIniciada;
  final bool mandandoEvaluacion;
  final bool evaluacionTerminada;
  final bool isErrorOnEvaluacionTerminada;
  final bool isFieldEmptyError;
  final bool isFieldNotNumberError;

  const RealizarEvaluacionState(
      {required this.evaluacionIniciada,
      required this.preguntaActual,
      required this.preguntasRespondidas,
      required this.evaluacionTerminada,
      required this.isErrorOnEvaluacionTerminada,
      required this.mandandoEvaluacion,
      required this.isFieldEmptyError,
      required this.isFieldNotNumberError
      });

  RealizarEvaluacionState copyWith(
      {int? pPreguntaActual, List<int>? pPreguntasRespondidas, bool? pEvaluaconIniciada, bool? pEvaluacionTerminada, bool? pIsErrorOnEvaluacionTerminada,bool? pMandandoEvaluacion, bool? isFieldEmptyError, bool? isFieldNotNumberError}) {
    return RealizarEvaluacionState(
        preguntaActual: pPreguntaActual ?? preguntaActual,
        preguntasRespondidas: pPreguntasRespondidas ?? preguntasRespondidas,
        evaluacionTerminada: pEvaluacionTerminada ?? evaluacionTerminada,
        isErrorOnEvaluacionTerminada: pIsErrorOnEvaluacionTerminada ?? isErrorOnEvaluacionTerminada,
        evaluacionIniciada: pEvaluaconIniciada ?? evaluacionIniciada,
        mandandoEvaluacion: pMandandoEvaluacion ?? mandandoEvaluacion,
        isFieldEmptyError: isFieldEmptyError ?? this.isFieldEmptyError,
        isFieldNotNumberError: isFieldNotNumberError ?? this.isFieldNotNumberError
        );
  }

  @override
  List<Object> get props => [preguntaActual, preguntasRespondidas, evaluacionIniciada, isErrorOnEvaluacionTerminada,evaluacionTerminada, mandandoEvaluacion, isFieldEmptyError, isFieldNotNumberError];
}
