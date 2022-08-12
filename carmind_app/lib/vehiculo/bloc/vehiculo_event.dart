part of 'vehiculo_bloc.dart';

abstract class VehiculoEvent extends Equatable {
  const VehiculoEvent();

  @override
  List<Object> get props => [];
}

class GetCurrent extends VehiculoEvent {
  final BuildContext context;
  final bool forceWaiting;

  const GetCurrent(this.context, {this.forceWaiting = false});
}

class TapEvaluacion extends VehiculoEvent {
  final int id;
  final BuildContext context;

  const TapEvaluacion(this.id, this.context);
}

class DejarUsar extends VehiculoEvent {
  final BuildContext context;

  const DejarUsar(this.context);
}
