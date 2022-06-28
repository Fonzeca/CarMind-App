part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeNavigationEvent extends HomeEvent {
  final int buttonId;
  final Vehiculo? vehiculo;
  final Evaluacion? evaluacion;
  const HomeNavigationEvent(this.buttonId,{this.vehiculo, this.evaluacion});
}

class HideFab extends HomeEvent {}

class ShowFab extends HomeEvent {}

class DejarDeUsarVehiculoEvent extends HomeEvent{
  final bool showDejarDeUsarVehiculo;

  const DejarDeUsarVehiculoEvent(this.showDejarDeUsarVehiculo);
}

class LogOutEvent extends HomeEvent {}

class PopEvent extends HomeEvent {
  const PopEvent();
}
