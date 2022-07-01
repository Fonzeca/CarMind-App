part of 'home_bloc.dart';

class HomeState extends Equatable {
  final int selectedPageView;
  final int selectedNavButton;
  final bool showFab;
  final bool showDejarDeUsarVehiculo;
  final Vehiculo? vehiculo;
  final Evaluacion? evaluacion;

  const HomeState(this.selectedPageView, this.selectedNavButton, this.showFab, this.showDejarDeUsarVehiculo, this.vehiculo, this.evaluacion);

  HomeState copyWith({int? selectedPageView, int? selectedNavButton, List<dynamic>? data, bool? showFab, bool? showDejarDeUsarVehiculo, Vehiculo? vehiculo, Evaluacion? evaluacion}) {
    return HomeState(
      selectedPageView ?? this.selectedPageView,
      selectedNavButton ?? this.selectedNavButton,
      showFab ?? this.showFab,
      showDejarDeUsarVehiculo ?? this.showDejarDeUsarVehiculo,
      vehiculo ?? this.vehiculo,
      evaluacion ?? this.evaluacion
    );
  }

  @override
  List<Object> get props => [selectedPageView, selectedNavButton, showFab, showDejarDeUsarVehiculo, vehiculo ?? Vehiculo(), evaluacion ?? Evaluacion()];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'selectedPageView': selectedPageView});
    result.addAll({'selectedNavButton': selectedNavButton});
    result.addAll({'showFab': showFab});
    result.addAll({'showDejarDeUsarVehiculo': showDejarDeUsarVehiculo});
    result.addAll({'vehiculo': vehiculo});
    result.addAll({'evaluacion': evaluacion});
  
    return result;
  }

  factory HomeState.fromMap(Map<String, dynamic> map) {
    return HomeState(
      map['selectedPageView']?.toInt() ?? 0,
      map['selectedNavButton']?.toInt() ?? 0,
      map['showFab'] ?? false,
      map['showDejarDeUsarVehiculo'] ?? false,
      Vehiculo.fromJson(map['vehiculo']),
      Evaluacion.fromJson(map['evaluacion'])
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeState.fromJson(String source) => HomeState.fromMap(json.decode(source));
}

class HomeInitial extends HomeState {
  const HomeInitial() : super(0, 0, true, false, null, null);
}

class HomeLogoutState extends HomeState {
  const HomeLogoutState() : super(0, 0, true, false, null, null);
}
