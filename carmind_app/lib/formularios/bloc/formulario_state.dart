part of 'formulario_bloc.dart';

class FormularioState extends Equatable {
  final List<LogEvaluacion> logs;
  final bool loading;

  const FormularioState({required this.loading, required this.logs});

  @override
  List<Object?> get props => [logs, loading];

  FormularioState copyWith({bool? loading, List<LogEvaluacion>? logs, bool updateLogs = false}) {
    return FormularioState(
      loading: loading ?? this.loading,
      logs: (updateLogs) ? logs! : this.logs,
    );
  }
}
