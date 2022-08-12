part of 'offline_bloc.dart';

abstract class OfflineEvent extends Equatable {
  const OfflineEvent();

  @override
  List<Object> get props => [];
}

class GetOfflineData extends OfflineEvent {}

class IniciarUsoVehiculoOffline extends OfflineEvent {
  final int vehiculoId;

  const IniciarUsoVehiculoOffline(this.vehiculoId);
}

class TerminarUsoVehiculoOffline extends OfflineEvent {
  final int vehiculoId;
  final bool deleteLog;

  const TerminarUsoVehiculoOffline(this.vehiculoId, {this.deleteLog = false});
}

class RealizarEvaluacionOffline extends OfflineEvent {
  final int evaluacionId;
  final EvaluacionTerminadaPojo evaluacionTerminada;

  const RealizarEvaluacionOffline(this.evaluacionId, this.evaluacionTerminada);
}

class UpdateOfflineData extends OfflineEvent {
  final Vehiculo? vehiculo;
  final LogEvaluacion? logEvaluacion;

  const UpdateOfflineData(this.vehiculo, this.logEvaluacion);
}

class SyncOfflineData extends OfflineEvent {}
