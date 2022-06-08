part of 'vehiculo_bloc.dart';

abstract class VehiculoEvent extends Equatable {
  const VehiculoEvent();

  @override
  List<Object> get props => [];
}

class GetCurrent extends VehiculoEvent {
  final BuildContext context;

  const GetCurrent(this.context);
}

class TapEvaluacion extends VehiculoEvent {
  final int id;
  BuildContext context;

  TapEvaluacion(this.id, this.context);
}

class DejarUsar extends VehiculoEvent {
  final BuildContext context;

  const DejarUsar(this.context);
}
