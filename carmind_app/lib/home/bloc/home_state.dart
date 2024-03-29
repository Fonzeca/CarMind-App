part of 'home_bloc.dart';

class HomeState extends Equatable {
  final int selectedPageView;
  final int selectedNavButton;
  final bool showFab;
  final bool showDejarDeUsarVehiculo;
  final Vehiculo? vehiculo;
  final Evaluacion? evaluacion;
  final List<RouteDraw> routeInfoToDraw;

  const HomeState(this.selectedPageView, this.selectedNavButton, this.showFab, this.showDejarDeUsarVehiculo, this.vehiculo, this.evaluacion,
      this.routeInfoToDraw);

  HomeState copyWith(
      {int? selectedPageView,
      int? selectedNavButton,
      List<dynamic>? data,
      bool? showFab,
      bool? showDejarDeUsarVehiculo,
      Vehiculo? vehiculo,
      Evaluacion? evaluacion,
      List<RouteDraw>? routeInfoToDraw}) {
    return HomeState(
      selectedPageView ?? this.selectedPageView,
      selectedNavButton ?? this.selectedNavButton,
      showFab ?? this.showFab,
      showDejarDeUsarVehiculo ?? this.showDejarDeUsarVehiculo,
      vehiculo ?? this.vehiculo,
      evaluacion ?? this.evaluacion,
      routeInfoToDraw ?? this.routeInfoToDraw,
    );
  }

  @override
  List<Object> get props =>
      [selectedPageView, selectedNavButton, showFab, showDejarDeUsarVehiculo, vehiculo ?? Vehiculo(), evaluacion ?? Evaluacion(), routeInfoToDraw];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'selectedPageView': selectedPageView});
    result.addAll({'selectedNavButton': selectedNavButton});
    result.addAll({'showFab': showFab});
    result.addAll({'showDejarDeUsarVehiculo': showDejarDeUsarVehiculo});
    result.addAll({'vehiculo': vehiculo});
    result.addAll({'evaluacion': evaluacion});
    result.addAll({'routeInfoToDraw': routeInfoToDraw});

    return result;
  }

  factory HomeState.fromMap(Map<String, dynamic> map) {
    return HomeState(
        0,
        0,
        map['showFab'] ?? false,
        map['showDejarDeUsarVehiculo'] ?? false,
        Vehiculo.fromJson(map['vehiculo']),
        Evaluacion.fromJson(map['evaluacion']),
        (map['routeInfoToDraw'] as List<dynamic>).map((e) => RouteDraw.fromJson(e as Map<String, dynamic>)).toList());
  }

  String toJson() => json.encode(toMap());

  factory HomeState.fromJson(String source) => HomeState.fromMap(json.decode(source));
}

class HomeInitial extends HomeState {
  HomeInitial() : super(0, 0, true, false, null, null, []);
}

class HomeLogoutState extends HomeState {
  HomeLogoutState() : super(0, 0, true, false, null, null, []);
}
