part of 'offline_bloc.dart';

abstract class OfflineEvent extends Equatable {
  const OfflineEvent();

  @override
  List<Object> get props => [];
}

class GetOfflineData extends OfflineEvent {
  final BuildContext context;

  const GetOfflineData(this.context);
}

class IniciarUsoVehiculoOffline extends OfflineEvent {
  final BuildContext context;
  final int vehiculoId;

  const IniciarUsoVehiculoOffline(this.context, this.vehiculoId);
}

class TerminarUsoVehiculoOffline extends OfflineEvent {
  final BuildContext context;
  final int vehiculoId;
  final bool deleteLog;

  const TerminarUsoVehiculoOffline(this.context, this.vehiculoId, {this.deleteLog = false});
}

class RealizarEvaluacionOffline extends OfflineEvent {
  final int evaluacionId;
  final EvaluacionTerminadaPojo evaluacionTerminada;
  final BuildContext context;

  const RealizarEvaluacionOffline(this.evaluacionId, this.evaluacionTerminada, this.context);
}

class UpdateOfflineData extends OfflineEvent {
  final Vehiculo? vehiculo;
  final LogEvaluacion? logEvaluacion;

  const UpdateOfflineData(this.vehiculo, this.logEvaluacion);
}

class SyncOfflineData extends OfflineEvent {
  final bool getDatosOffline;
  final BuildContext? context;

  const SyncOfflineData({this.getDatosOffline = false, this.context});
}

class UpdateVehiculos extends OfflineEvent {
  final Vehiculo vehiculo;

  const UpdateVehiculos(this.vehiculo);
}

class UpdateLogsForms extends OfflineEvent {
  final List<LogEvaluacion> logEvaluaciones;

  const UpdateLogsForms(this.logEvaluaciones);
}
