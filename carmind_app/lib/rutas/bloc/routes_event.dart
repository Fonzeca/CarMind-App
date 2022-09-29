part of 'routes_bloc.dart';

abstract class RoutesEvent extends Equatable {
  const RoutesEvent();

  @override
  List<Object> get props => [];
}

class OpenPanelEvent extends RoutesEvent {
  final bool showPanelHeader;

  const OpenPanelEvent({required this.showPanelHeader});
}

class GetAllVehicles extends RoutesEvent {}

class GetVehiclesPositions extends RoutesEvent {
  const GetVehiclesPositions();
}

class UpdateVehiclesPositions extends RoutesEvent {
  final TickerProvider ticker;

  const UpdateVehiclesPositions({required this.ticker});
}

class GetVehicleRoutes extends RoutesEvent {
  final String imei;
  final String from;
  final String to;
  final Completer<GoogleMapController> mapController;

  const GetVehicleRoutes({
    required this.imei,
    required this.from,
    required this.to,
    required this.mapController,
  });
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

class SelectStopEvent extends RoutesEvent {
  final double lat;
  final double lng;
  final int selectedStopIndex;

  const SelectStopEvent({required this.lat, required this.lng, required this.selectedStopIndex});
}
