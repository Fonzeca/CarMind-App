part of 'routes_bloc.dart';

abstract class RoutesEvent extends Equatable {
  const RoutesEvent();

  @override
  List<Object> get props => [];
}

class OpenPanelEvent extends RoutesEvent {}

class GetAllVehicles extends RoutesEvent {}

class GetVehiclesPositions extends RoutesEvent {
  final StreamSink<List<Marker>> mapMarkerSink;
  final List<Marker> markers;

  const GetVehiclesPositions({required this.markers, required this.mapMarkerSink});
}

class UpdateVehiclesPositions extends RoutesEvent {
  final List<Marker> markers;
  final TickerProvider ticker;
  final StreamSink<List<Marker>> mapMarkerSink;

  const UpdateVehiclesPositions({required this.markers, required this.ticker, required this.mapMarkerSink});
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
  final LatLng? firstMarkerPosition;

  const DrawRouteEvent({required this.polylines, required this.mapController, required this.firstMarkerPosition});
}

class SelectVehicleEvent extends RoutesEvent {
  final VehicleInfoMap vehicle;

  const SelectVehicleEvent(this.vehicle);
}

class UnSelectVehicle extends RoutesEvent {
  const UnSelectVehicle();
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
  final double? latitude;
  final double? longitude;

  const MoveCameraToRouteEvent({required this.mapController, this.points, this.latitude, this.longitude});
}
