
part of 'realizar_evaluacion_bloc.dart';

class RealizarEvaluacionState extends Equatable {
  final int preguntaActual;
  final List<int> preguntasRespondidas;
  final bool evaluacionIniciada;
  final bool mandandoEvaluacion;
  final bool evaluacionTerminada;
  final bool isFieldEmptyError;
  final bool isFieldNotNumberError;
  final EvaluacionTerminadaPojo? evaluacion;
  final XFile? restoredData;

  const RealizarEvaluacionState(
      {required this.evaluacionIniciada,
      required this.preguntaActual,
      required this.preguntasRespondidas,
      required this.evaluacionTerminada,
      required this.mandandoEvaluacion,
      required this.isFieldEmptyError,
      required this.isFieldNotNumberError,
      this.evaluacion,
      this.restoredData
      });

  RealizarEvaluacionState copyWith(
      {int? pPreguntaActual, List<int>? pPreguntasRespondidas, bool? pEvaluaconIniciada, bool? pEvaluacionTerminada, bool? p,bool? pMandandoEvaluacion, bool? isFieldEmptyError, bool? isFieldNotNumberError,EvaluacionTerminadaPojo? evaluacion, XFile? restoredData, bool? resetCache}) {
    return RealizarEvaluacionState(
        preguntaActual: pPreguntaActual ?? preguntaActual,
        preguntasRespondidas: pPreguntasRespondidas ?? preguntasRespondidas,
        evaluacionTerminada: pEvaluacionTerminada ?? evaluacionTerminada,
        evaluacionIniciada: pEvaluaconIniciada ?? evaluacionIniciada,
        mandandoEvaluacion: pMandandoEvaluacion ?? mandandoEvaluacion,
        isFieldEmptyError: isFieldEmptyError ?? this.isFieldEmptyError,
        isFieldNotNumberError: isFieldNotNumberError ?? this.isFieldNotNumberError,
        evaluacion: (resetCache != null && resetCache ) ? null : (evaluacion ?? this.evaluacion) ,
        restoredData: (resetCache != null && resetCache ) ? null : (restoredData ?? this.restoredData),
        );
  }

  @override
  List<Object?> get props => [preguntaActual, preguntasRespondidas, evaluacionIniciada,evaluacionTerminada, mandandoEvaluacion, isFieldEmptyError, isFieldNotNumberError, evaluacion, restoredData];
  

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'preguntaActual': preguntaActual});
    result.addAll({'preguntasRespondidas': preguntasRespondidas});
    result.addAll({'evaluacionIniciada': evaluacionIniciada});
    result.addAll({'mandandoEvaluacion': mandandoEvaluacion});
    result.addAll({'evaluacionTerminada': evaluacionTerminada});
    result.addAll({'isFieldEmptyError': isFieldEmptyError});
    result.addAll({'isFieldNotNumberError': isFieldNotNumberError});
    result.addAll({'evaluacion': evaluacion});
  
    return result;
  }

  factory RealizarEvaluacionState.fromMap(Map<String, dynamic> map) {
    return RealizarEvaluacionState(
      preguntaActual: map['preguntaActual']?.toInt() ?? 0,
      preguntasRespondidas : List<int>.from(map['preguntasRespondidas']),
      evaluacionIniciada: map['evaluacionIniciada'] ?? false,
      mandandoEvaluacion: map['mandandoEvaluacion'] ?? false,
      evaluacionTerminada: map['evaluacionTerminada'] ?? false,
      isFieldEmptyError: map['isFieldEmptyError'] ?? false,
      isFieldNotNumberError: map['isFieldNotNumberError'] ?? false,
      evaluacion: EvaluacionTerminadaPojo.fromJson(map['evaluacion'])
    );
  }

  String toJson() => json.encode(toMap());

  factory RealizarEvaluacionState.fromJson(String source) => RealizarEvaluacionState.fromMap(json.decode(source));
}
