part of 'map_bloc.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}

class ChangeMapTypeEvent extends MapEvent {
  final MapType mapType;

  const ChangeMapTypeEvent({required this.mapType});
}

class DrawMarkersEvent extends MapEvent {
  final Map<MarkerId, Marker> markers;

  const DrawMarkersEvent({required this.markers});
}

class DrawRouteEvent extends MapEvent {
  final Map<PolylineId, Polyline> polylines;
  const DrawRouteEvent({required this.polylines});
}

class UpdateCameraPositionEvent extends MapEvent {
  final double latitude;
  final double longitude;

  const UpdateCameraPositionEvent({required this.latitude, required this.longitude});
}
