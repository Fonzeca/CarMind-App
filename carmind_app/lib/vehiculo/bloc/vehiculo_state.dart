part of 'vehiculo_bloc.dart';

class VehiculoState extends Equatable {
  final Vehiculo? vehiculo;
  final bool loading;

  const VehiculoState({this.vehiculo, required this.loading});

  @override
  List<Object?> get props => [loading, vehiculo];

  VehiculoState copyWith({Vehiculo? vehiculo, bool? loading, bool updateVehicle = false}) {
    return VehiculoState(
      vehiculo: (updateVehicle) ? vehiculo : this.vehiculo,
      loading: loading ?? this.loading,
    );
  }
}
