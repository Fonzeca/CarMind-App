import 'dart:async';
import 'dart:math';

import 'package:carmind_app/api/api.dart';
import 'package:carmind_app/home/home.dart';
import 'package:carmind_app/main.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math' as math;

part 'routes_event.dart';
part 'routes_state.dart';

class RoutesBloc extends Bloc<RoutesEvent, RoutesState> {
  late ApiClient api;

  List<VehicleInfoMap> vehicles = [];
  List<dynamic> vehicleNames = [];
  Map<String, dynamic> _imeis = {};

  List<RouteInfo> routesInfo = [];
  bool isMapNotLoaded = true;
  Timer? timer;
  Animation<double>? _animation;

  RoutesBloc() : super(MapStateInitial()) {
    api = ApiClient(staticDio!);

    on<OpenPanelEvent>((event, emit) async {
      emit(state.copyWith(showPanelHeader: false));
    });

    on<GetAllVehicles>((event, emit) async {
      vehicles = await api.getAllVehiculos();
      vehicles.removeWhere((v) => v.imei == null);

      vehicleNames = vehicles.map((v) => v.nombre).toList();

      _imeis = {"imeis": vehicles.map((v) => v.imei).toList()};
    });

    on<GetVehiclesPositions>((event, emit) async {
      await _getVehiclePosition();
      _drawVehicleMarkers(event.markers, null, event.mapMarkerSink);
    });

    on<UpdateVehiclesPositions>((event, emit) async {
      timer = Timer.periodic(const Duration(seconds: 3), (_) async {
        await _getVehiclePosition();
        _drawVehicleMarkers(event.markers, event.ticker, event.mapMarkerSink);
      });
    });

    on<GetVehicleRoutes>((event, emit) async {
      emit(state.copyWith(areRoutesLoading: true, dateFrom: event.from, dateTo: event.to));

      final RoutePojo routePojo = RoutePojo();
      routePojo.imei = event.imei;
      routePojo.from = event.from;
      routePojo.to = event.to;

      routesInfo = await api.getRoute(routePojo);
      _drawRoute(routesInfo, event.mapController);

      emit(state.copyWith(areRoutesLoading: false));
    });

    on<DrawMarkersEvent>((event, emit) async {
      emit(state.copyWith(vehicleMarkers: event.vehicleMarkers, routeMarkers: event.routeMarkers));
    });

    on<DrawRouteEvent>((event, emit) async {
      emit(state.copyWith(polylines: event.polylines, showPanelHeader: true));
      final double? firstMarkerLatitude = event.firstMarkerPosition != null ? event.firstMarkerPosition!.latitude : null;
      final double? firstMarkerLongitude = event.firstMarkerPosition != null ? event.firstMarkerPosition!.longitude : null;
      add(MoveCameraToRouteEvent(mapController: event.mapController, latitude: firstMarkerLatitude, longitude: firstMarkerLongitude));
    });

    on<SelectVehicleEvent>((event, emit) async {
      emit(state.copyWith(vehicle: event.vehicle, showPanelHeader: true));
    });

    on<UnSelectVehicle>((event, emit) async {
      BlocProvider.of<HomeBloc>(event.context).add(ShowFab());
      routesInfo = [];
      emit(state.copyWith(vehicle: VehicleInfoMap(), dateFrom: '', dateTo: '', polylines: {}, routeMarkers: {}, showPanelHeader: false));
    });

    on<MoveCameraToPointEvent>((event, emit) async {
      final CameraPosition originPosition = CameraPosition(target: LatLng(event.latitude, event.longitude), zoom: 25);

      final GoogleMapController controller = await event.mapController.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(originPosition));

      emit(state.copyWith(showPanelHeader: true));
    });

    on<MoveCameraToRouteEvent>((event, emit) async {
      final GoogleMapController controller = await event.mapController.future;

      List<LatLng> points = event.points ?? [];
      if (points.isEmpty) state.polylines.forEach((_, polyline) => points.addAll(polyline.points));

      //Si no se encuentran resultados en la búsqueda de la ruta, entonces dejamos el panel donde está y NO movemos la cámara
      if ((event.latitude == null || event.longitude == null) && points.isEmpty) {
        emit(state.copyWith(showPanelHeader: false));
        return;
      }

      if (points.isEmpty) {
        final CameraPosition originPosition = CameraPosition(target: LatLng(event.latitude!, event.longitude!), zoom: 25);
        controller.animateCamera(CameraUpdate.newCameraPosition(originPosition));
      } else {
        controller.animateCamera(CameraUpdate.newLatLngBounds(boundsFromLatLngList(points), 90));
      }

      emit(state.copyWith(showPanelHeader: true));
    });

    add(GetAllVehicles());
  }

  Future<void> _getVehiclePosition() async {
    List<VehicleInfoMap> vehiclesTrackinInfo = await api.getVehiclesTrackinInfo(_imeis);
    List<VehicleInfoMap> vehicles = [];
    for (var vehicle in this.vehicles) {
      final int vehicleIndex = vehiclesTrackinInfo.indexWhere((v) => v.imei == vehicle.imei);
      if (vehicleIndex != -1) {
        VehicleInfoMap vehicleTrackinInfo = vehiclesTrackinInfo[vehicleIndex];
        vehicle.latitud = vehicleTrackinInfo.latitud;
        vehicle.longitud = vehicleTrackinInfo.longitud;
        vehicle.engine_status = vehicleTrackinInfo.engine_status;
        vehicles.add(vehicle);
      }
    }
    vehicleNames = vehicles.map((v) => v.nombre).toList();
    this.vehicles = vehicles;
  }

  void _drawVehicleMarkers(List<Marker> markers, TickerProvider? provider, StreamSink<List<Marker>> mapMarkerSink) {
    for (VehicleInfoMap vehicle in vehicles) {
      MarkerId markerId = MarkerId(vehicle.imei!);
      int markerIndex = markers.indexWhere((marker) => marker.markerId == markerId);
      if (markerIndex != -1) {
        final double bearing = getBearing(
            LatLng(markers[markerIndex].position.latitude, markers[markerIndex].position.longitude), LatLng(vehicle.latitud!, vehicle.longitud!));

        if (bearing.isNaN) continue;

        final animationController = AnimationController(duration: const Duration(seconds: 2), vsync: provider!);

        Tween<double> tween = Tween(begin: 0, end: 1);

        _animation = tween.animate(animationController)
          ..addListener(() async {
            final v = _animation!.value;

            double lat = v * vehicle.latitud! + (1 - v) * markers[markerIndex].position.latitude;
            double lng = v * vehicle.longitud! + (1 - v) * markers[markerIndex].position.longitude;

            LatLng newPos = LatLng(lat, lng);
            markers[markerIndex] = markers[markerIndex].copyWith(positionParam: newPos, rotationParam: bearing);
            mapMarkerSink.add(markers);
          });

        animationController.forward();
      } else {
        Marker newVehicleMarker = Marker(
            markerId: markerId,
            icon: BitmapDescriptor.defaultMarker,
            position: LatLng(vehicle.latitud!, vehicle.longitud!),
            onTap: () => add(SelectVehicleEvent(vehicle)));
        markers.add(newVehicleMarker);
        mapMarkerSink.add(markers);
      }
    }
  }

  double getBearing(LatLng begin, LatLng end) {
    double lat = (begin.latitude - end.latitude).abs();
    double lng = (begin.longitude - end.longitude).abs();

    if (begin.latitude < end.latitude && begin.longitude < end.longitude) {
      return (atan(lng / lat)) * (180 / math.pi);
    } else if (begin.latitude >= end.latitude && begin.longitude < end.longitude) {
      return (90 - (atan(lng / lat))) * (180 / math.pi) + 90;
    } else if (begin.latitude >= end.latitude && begin.longitude >= end.longitude) {
      return (atan(lng / lat)) * (180 / math.pi) + 180;
    } else if (begin.latitude < end.latitude && begin.longitude >= end.longitude) {
      return (90 - (atan(lng / lat))) * (180 / math.pi) + 270;
    }

    return -1;
  }

  void _drawRoute(List<RouteInfo> routesInfo, Completer<GoogleMapController> mapController) {
    final Map<MarkerId, Marker> markers = {};
    final Map<PolylineId, Polyline> polylines = {};

    for (int i = 0; i < routesInfo.length; i++) {
      bool isRouteTravel = false;

      final RouteDraw routeDraw = RouteDraw();

      if (routesInfo[i] is RouteStop) {
        final RouteStop route = routesInfo[i] as RouteStop;
        routeDraw
          ..originLatitude = route.latitud!
          ..originLongitude = route.longitud!;

        List<LatLng> polyLinePoints = [];

        if (i - 1 >= 0) {
          final previousRoute = routesInfo[i - 1] as RouteTravel;
          polyLinePoints.add(LatLng(previousRoute.data!.last.latitud!, previousRoute.data!.last.longitud!));
        }

        polyLinePoints.add(LatLng(route.latitud!, route.longitud!));

        if (i + 1 < routesInfo.length) {
          final nextRoute = routesInfo[i + 1] as RouteTravel;
          polyLinePoints.add(LatLng(nextRoute.data!.first.latitud!, nextRoute.data!.first.longitud!));
        }

        PolylineId polyId = PolylineId('${i}StopUnionTravel');
        polylines[polyId] =
            Polyline(polylineId: polyId, points: polyLinePoints, jointType: JointType.round, endCap: Cap.roundCap, startCap: Cap.roundCap);
      } else {
        isRouteTravel = true;
        final RouteTravel route = routesInfo[i] as RouteTravel;
        routeDraw
          ..originLatitude = route.data!.first.latitud!
          ..originLongitude = route.data!.first.longitud!
          ..destinationLatitude = route.data![route.data!.length - 1].latitud!
          ..destinationLongitude = route.data![route.data!.length - 1].longitud!
          ..points = route.data!;
      }

      _drawRouteMarkers(routeDraw, markers, i);

      if (isRouteTravel) _drawRoutePolylines(polylines, routeDraw.points!, i);
    }

    add(DrawMarkersEvent(routeMarkers: markers));

    final LatLng? firstMarkerPosition = markers.containsKey(MarkerId('0')) ? markers[MarkerId('0')]!.position : null;
    add(DrawRouteEvent(polylines: polylines, mapController: mapController, firstMarkerPosition: firstMarkerPosition));
  }

  void _drawRouteMarkers(RouteDraw routeDraw, Map<MarkerId, Marker> markers, int id) {
    MarkerId markerId = MarkerId('$id');
    markers[markerId] = Marker(
        markerId: markerId,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        position: LatLng(routeDraw.originLatitude!, routeDraw.originLongitude!));
  }

  void _drawRoutePolylines(Map<PolylineId, Polyline> polylines, List<Point> points, int id) {
    if (points.isNotEmpty) {
      List<LatLng> polyLinePoints = [];
      double speed = 0;
      Color color;
      Color? previousColor;
      for (int i = 0; i < points.length; i++) {
        speed = points[i].speed!;
        color = _speedToColor(speed);

        polyLinePoints.add(LatLng(points[i].latitud!, points[i].longitud!));

        if (i > 0 && (color != previousColor || i + 1 >= points.length)) {
          PolylineId polyId = PolylineId('$id');
          polylines[polyId] =
              Polyline(polylineId: polyId, points: polyLinePoints, jointType: JointType.round, endCap: Cap.roundCap, startCap: Cap.roundCap);

          if (i + 1 >= points.length) {
            polylines[polyId] = polylines[polyId]!.copyWith(colorParam: color);
          } else {
            polylines[polyId] = polylines[polyId]!.copyWith(colorParam: previousColor);
          }

          polyLinePoints = [];
        }
        previousColor = color;
      }
    }
  }

  Color _speedToColor(double speed) {
    if (speed < 60) {
      return Colors.green[500]!;
    } else if (speed < 110) {
      return Colors.orange[500]!;
    }
    return Colors.red[500]!;
  }

  LatLngBounds boundsFromLatLngList(List<LatLng> list) {
    double? x0, x1, y0, y1;
    for (LatLng latLng in list) {
      if (x0 == null || x1 == null || y0 == null || y1 == null) {
        x0 = x1 = latLng.latitude;
        y0 = y1 = latLng.longitude;
      } else {
        if (latLng.latitude > x1) x1 = latLng.latitude;
        if (latLng.latitude < x0) x0 = latLng.latitude;
        if (latLng.longitude > y1) y1 = latLng.longitude;
        if (latLng.longitude < y0) y0 = latLng.longitude;
      }
    }

    return LatLngBounds(northeast: LatLng(x1!, y1!), southwest: LatLng(x0!, y0!));
  }
}
