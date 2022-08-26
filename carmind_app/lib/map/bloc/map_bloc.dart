import 'dart:async';

import 'package:carmind_app/api/api.dart';
import 'package:carmind_app/api/pojo/map/route_stop.dart';
import 'package:carmind_app/main.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  late ApiClient api;
  final List<Map> points = [];
  final Completer<GoogleMapController> controller = Completer();

  MapBloc() : super(MapStateInitial()) {
    api = ApiClient(staticDio!);

    on<UpdateCameraPositionEvent>((event, emit) async {
      final GoogleMapController _controller = await controller.future;
      _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(event.latitude, event.longitude),
        zoom: 14.4746,
      )));
    });

    on<ChangeMapTypeEvent>((event, emit) async {
      emit(state.copyWith(mapType: event.mapType));
    });

    on<DrawMarkersEvent>((event, emit) async {
      state.markers.addAll(event.markers);
      emit(state.copyWith(markers: state.markers));
    });

    on<DrawRouteEvent>((event, emit) async {
      state.polylines.addAll(event.polylines);
      emit(state.copyWith(polylines: state.polylines));
    });

    _getRouteByImei();
  }

  void _getRouteByImei() async {
    RoutePojo pojo = RoutePojo();
    pojo.imei = '867730050816697';
    pojo.from = '2022-08-10 13:39:13';
    pojo.to = '2022-08-11 13:39:13';
    List<RouteInfo> routes = await api.getRoute(pojo);
    if (routes.isNotEmpty) {
      double originLatitude = (routes[0] as RouteTravel).data![0].latitud!;
      double originLongitude = (routes[0] as RouteTravel).data![0].longitud!;
      double destinationLatitude = (routes[1] as RouteStop).latitud!;
      double destinationLongitude = (routes[1] as RouteStop).longitud!;
      _drawMarkers(originLatitude, originLongitude, destinationLatitude, destinationLongitude);
      _drawRoute((routes[0] as RouteTravel).data!);
    }
  }

  void _drawMarkers(double originLatitude, double originLongitude, double destinationLatitude, double destinationLongitude) {
    final Map<MarkerId, Marker> markers = {};
    MarkerId markerId = const MarkerId("origin");
    markers[markerId] = Marker(markerId: markerId, icon: BitmapDescriptor.defaultMarker, position: LatLng(originLatitude, originLongitude));
    markerId = const MarkerId("destination");
    markers[markerId] =
        Marker(markerId: markerId, icon: BitmapDescriptor.defaultMarkerWithHue(90), position: LatLng(destinationLatitude, destinationLongitude));
    add(DrawMarkersEvent(markers: markers));
    add(UpdateCameraPositionEvent(latitude: originLatitude, longitude: originLongitude));
  }

  void _drawRoute(List<Point> points) {
    if (points.isNotEmpty) {
      Map<PolylineId, Polyline> polylines = {};
      List<LatLng> polyLinePoints = [];
      double speed = 0;
      Color color;
      Color? previousColor;
      for (int i = 0; i < points.length; i++) {
        speed = points[i].speed!;
        color = _speedToColor(speed);

        polyLinePoints.add(LatLng(points[i].latitud!, points[i].longitud!));

        if (i > 0 && (color != previousColor || i + 1 >= points.length)) {
          PolylineId id = PolylineId(i.toString());
          polylines[id] = Polyline(
            polylineId: id,
            points: polyLinePoints,
            jointType: JointType.round,
            endCap: Cap.roundCap,
          );

          if (i + 1 >= points.length) {
            polylines[id] = polylines[id]!.copyWith(colorParam: color);
          } else {
            polylines[id] = polylines[id]!.copyWith(colorParam: previousColor);
          }

          polyLinePoints = [];
          polyLinePoints.add(LatLng(points[i].latitud!, points[i].longitud!));
        }
        previousColor = color;
      }
      add(DrawRouteEvent(polylines: polylines));
    }
  }

  Color _speedToColor(double speed) {
    if (speed < 20) {
      return Colors.green[500]!;
    } else if (speed < 30) {
      return Colors.green[600]!;
    } else if (speed < 40) {
      return Colors.green[700]!;
    } else if (speed < 50) {
      return Colors.green[800]!;
    } else if (speed < 60) {
      return Colors.green[900]!;
    } else if (speed < 70) {
      return Colors.orange[500]!;
    } else if (speed < 80) {
      return Colors.orange[600]!;
    } else if (speed < 90) {
      return Colors.orange[700]!;
    } else if (speed < 100) {
      return Colors.orange[800]!;
    } else if (speed < 110) {
      return Colors.orange[900]!;
    } else if (speed < 120) {
      return Colors.red[600]!;
    } else if (speed < 130) {
      return Colors.red[700]!;
    } else {
      return Colors.red[800]!;
    }
  }
}
