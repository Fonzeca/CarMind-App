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
  final List<RouteDraw>? routeDraw;
  const HomeNavigationEvent(this.buttonId, {this.vehiculo, this.evaluacion, this.routeDraw});
}

class HideFab extends HomeEvent {}

class ShowFab extends HomeEvent {}

class ShowDejarDeUsarVehiculoEvent extends HomeEvent {
  final bool showDejarDeUsarVehiculo;

  const ShowDejarDeUsarVehiculoEvent(this.showDejarDeUsarVehiculo);
}

class LogOutEvent extends HomeEvent {}

class PopEvent extends HomeEvent {
  const PopEvent();
}
