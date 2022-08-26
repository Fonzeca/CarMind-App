part of 'map_bloc.dart';

class MapState extends Equatable {
  final MapType mapType;
  final Map<MarkerId, Marker> markers;
  final Map<PolylineId, Polyline> polylines;

  const MapState({required this.mapType, required this.markers, required this.polylines});

  MapState copyWith({MapType? mapType, Map<MarkerId, Marker>? markers, Map<PolylineId, Polyline>? polylines}) {
    return MapState(mapType: mapType ?? this.mapType, polylines: polylines ?? this.polylines, markers: markers ?? this.markers);
  }

  @override
  List<Object?> get props => [mapType, polylines, markers];
}

class MapStateInitial extends MapState {
  MapStateInitial() : super(mapType: MapType.normal, markers: {}, polylines: {});
}
