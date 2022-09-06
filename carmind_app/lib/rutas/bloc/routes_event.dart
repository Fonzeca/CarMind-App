part of 'routes_bloc.dart';

abstract class RoutesEvent extends Equatable {
  const RoutesEvent();

  @override
  List<Object> get props => [];
}

class OpenPanelEvent extends RoutesEvent {}

class GetVehiclesPositions extends RoutesEvent {
  final BuildContext context;

  const GetVehiclesPositions(this.context);
}

class GetVehicleRoutes extends RoutesEvent {
  final String imei;
  final String from;
  final String to;
  final Completer<GoogleMapController> mapController;

  const GetVehicleRoutes({required this.imei, required this.from, required this.to, required this.mapController});
}

class DrawMarkersEvent extends RoutesEvent {
  final Map<MarkerId, Marker>? vehicleMarkers;
  final Map<MarkerId, Marker>? routeMarkers;

  const DrawMarkersEvent({this.vehicleMarkers, this.routeMarkers});
}

class DrawRouteEvent extends RoutesEvent {
  final Completer<GoogleMapController> mapController;
  final Map<PolylineId, Polyline> polylines;

  const DrawRouteEvent({required this.polylines, required this.mapController});
}

class SelectVehicleEvent extends RoutesEvent {
  final VehicleInfoMap vehicle;
  final BuildContext context;

  const SelectVehicleEvent(this.vehicle, this.context);
}

class UnSelectVehicle extends RoutesEvent {
  final BuildContext context;

  const UnSelectVehicle(this.context);
}

class SelectDateEvent extends RoutesEvent {
  final String? dateFrom;
  final String? dateTo;

  const SelectDateEvent({this.dateFrom, this.dateTo});
}

class MoveCameraToPointEvent extends RoutesEvent {
  final Completer<GoogleMapController> mapController;
  final double latitude;
  final double longitude;

  const MoveCameraToPointEvent({required this.mapController, required this.latitude, required this.longitude});
}

class MoveCameraToRouteEvent extends RoutesEvent {
  final Completer<GoogleMapController> mapController;
  final List<LatLng>? points;

  const MoveCameraToRouteEvent({required this.mapController, this.points});
}
