part of 'offline_bloc.dart';

abstract class OfflineEvent extends Equatable {
  const OfflineEvent();

  @override
  List<Object> get props => [];
}

class GetOfflineData extends OfflineEvent {}

class IniciarUsoVehiculoOffline extends OfflineEvent {
  final int id;

  const IniciarUsoVehiculoOffline(this.id);
}

class TerminarUsoVehiculoOffline extends OfflineEvent {
  final int id;

  const TerminarUsoVehiculoOffline(this.id);
}

class SetOnline extends OfflineEvent {}

class SyncEvent extends OfflineEvent {}
