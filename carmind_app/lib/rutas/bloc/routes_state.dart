part of 'routes_bloc.dart';

class RoutesState extends Equatable {
  final Map<MarkerId, Marker> routeMarkers;
  final Map<PolylineId, Polyline> polylines;
  final VehicleInfoMap vehicle;
  final String? dateFrom;
  final String? dateTo;
  final bool showPanelHeader;
  final bool areRoutesLoading;

  const RoutesState({
    required this.routeMarkers,
    required this.polylines,
    required this.vehicle,
    required this.dateFrom,
    required this.dateTo,
    required this.showPanelHeader,
    required this.areRoutesLoading,
  });

  RoutesState copyWith({
    Map<MarkerId, Marker>? vehicleMarkers,
    Map<MarkerId, Marker>? routeMarkers,
    Map<PolylineId, Polyline>? polylines,
    List<RouteInfo>? routes,
    VehicleInfoMap? vehicle,
    String? dateFrom,
    String? dateTo,
    bool? showPanelHeader,
    bool? areRoutesLoading,
  }) {
    return RoutesState(
        routeMarkers: routeMarkers ?? this.routeMarkers,
        polylines: polylines ?? this.polylines,
        vehicle: vehicle ?? this.vehicle,
        dateFrom: (dateFrom != null && dateFrom.isEmpty) ? null : (dateFrom ?? this.dateFrom),
        dateTo: (dateTo != null && dateTo.isEmpty) ? null : (dateTo ?? this.dateTo),
        showPanelHeader: showPanelHeader ?? this.showPanelHeader,
        areRoutesLoading: areRoutesLoading ?? this.areRoutesLoading);
  }

  @override
  List<Object?> get props => [routeMarkers, polylines, vehicle, dateFrom, dateTo, showPanelHeader, areRoutesLoading];
}

class MapStateInitial extends RoutesState {
  MapStateInitial()
      : super(
            routeMarkers: {},
            polylines: {},
            vehicle: VehicleInfoMap(),
            dateFrom: null,
            dateTo: null,
            showPanelHeader: false,
            areRoutesLoading: false);
}
