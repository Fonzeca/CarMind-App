import 'dart:async';
import 'dart:math';

import 'package:flutter/services.dart' show rootBundle;
import 'dart:ui' as ui;
import 'dart:typed_data';

import 'package:carmind_app/api/api.dart';
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

  bool isMapNotLoaded = true;
  Timer? timer;
  Animation<double>? _animation;

  Marker? startTrip;
  Marker? endTrip;

  late BitmapDescriptor stopIcon;
  late BitmapDescriptor stopIconRed;
  late BitmapDescriptor startTripIcon;
  late BitmapDescriptor endTripIcon;

  int totalKms = 0;
  int totalStops = 0;
  int id = 0;

  List<RouteInfo> routesInfo = [];

  List<Marker> vehiclesMarkers = [];
  List<Marker> routeMarkers = [];

  StreamController<List<Marker>> mapMarkerSC = StreamController<List<Marker>>();
  StreamSink<List<Marker>> get mapMarkerSink => mapMarkerSC.sink;
  Stream<List<Marker>> get mapMarkerStream => mapMarkerSC.stream;

  StreamController<List<Polyline>> mapPolylineSC = StreamController<List<Polyline>>();
  StreamSink<List<Polyline>> get mapPolylineSink => mapPolylineSC.sink;
  Stream<List<Polyline>> get mapPolylineStream => mapPolylineSC.stream;

  RoutesBloc() : super(MapStateInitial()) {
    api = ApiClient(staticDio!);

    _seticons();

    on<OpenPanelEvent>((event, emit) async {
      emit(state.copyWith(showPanelHeader: event.showPanelHeader));
    });

    on<GetAllVehicles>((event, emit) async {
      vehicles = await api.getAllVehiculos();
      vehicles.removeWhere((v) => v.imei == null);

      vehicleNames = vehicles.map((v) => v.nombre).toList();

      _imeis = {"imeis": vehicles.map((v) => v.imei).toList()};
    });

    on<GetVehiclesPositions>((event, emit) async {
      await _getVehiclePosition();
      _drawVehicleMarkers(null);
    });

    on<UpdateVehiclesPositions>((event, emit) async {
      timer = Timer.periodic(const Duration(seconds: 3), (_) async {
        await _getVehiclePosition();
        _drawVehicleMarkers(event.ticker);
      });
    });

    on<GetVehicleRoutes>((event, emit) async {
      emit(state.copyWith(areRoutesLoading: true, dateFrom: event.from, dateTo: event.to));
      totalKms = 0;
      totalStops = 0;

      final RoutePojo routePojo = RoutePojo();
      routePojo.imei = event.imei;
      routePojo.from = event.from;
      routePojo.to = event.to;

      routesInfo = await api.getRoute(routePojo);
      bool isRouteDrown = await _drawRoute(routesInfo, event.mapController);

      emit(state.copyWith(areRoutesLoading: false, showPanelHeader: isRouteDrown ? true : false, selectedStopIndex: -1));
    });

    on<SelectVehicleEvent>((event, emit) async {
      emit(state.copyWith(vehicle: event.vehicle, showPanelHeader: true));
    });

    on<UnSelectVehicle>((event, emit) async {
      routesInfo = [];
      totalKms = 0;
      totalStops = 0;
      emit(state.copyWith(vehicle: VehicleInfoMap(), dateFrom: '', dateTo: '', showPanelHeader: false, selectedStopIndex: -1));
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

      if (points.isEmpty) {
        final CameraPosition originPosition = CameraPosition(target: LatLng(event.latitude!, event.longitude!), zoom: 25);
        controller.animateCamera(CameraUpdate.newCameraPosition(originPosition));
      } else {
        controller.animateCamera(CameraUpdate.newLatLngBounds(boundsFromLatLngList(points), 90));
      }

      emit(state.copyWith(showPanelHeader: true));
    });

    on<SelectStopEvent>((event, emit) async {
      for (int i = 0; i < routeMarkers.length; i++) {
        if (routeMarkers[i].markerId == const MarkerId("startMarker") || routeMarkers[i].markerId == const MarkerId("endMarker")) continue;

        if (routeMarkers[i].position.latitude == event.lat &&
            routeMarkers[i].position.longitude == event.lng &&
            routeMarkers[i].icon != stopIconRed) {
          routeMarkers[i] = routeMarkers[i].copyWith(iconParam: stopIconRed);
        } else {
          routeMarkers[i] = routeMarkers[i].copyWith(iconParam: stopIcon);
        }
      }

      mapMarkerSink.add(routeMarkers);

      int selectedStopIndex = event.selectedStopIndex;

      if (event.selectedStopIndex == state.selectedStopIndex) selectedStopIndex = -1;

      emit(state.copyWith(showPanelHeader: true, selectedStopIndex: selectedStopIndex));
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

  void _drawVehicleMarkers(TickerProvider? provider) {
    for (VehicleInfoMap vehicle in vehicles) {
      MarkerId markerId = MarkerId(vehicle.imei!);
      int markerIndex = vehiclesMarkers.indexWhere((marker) => marker.markerId == markerId);
      if (markerIndex != -1) {
        final double bearing = getBearing(LatLng(vehiclesMarkers[markerIndex].position.latitude, vehiclesMarkers[markerIndex].position.longitude),
            LatLng(vehicle.latitud!, vehicle.longitud!));

        if (bearing.isNaN) continue;

        final animationController = AnimationController(duration: const Duration(seconds: 2), vsync: provider!);

        Tween<double> tween = Tween(begin: 0, end: 1);

        _animation = tween.animate(animationController)
          ..addListener(() async {
            final v = _animation!.value;

            double lat = v * vehicle.latitud! + (1 - v) * vehiclesMarkers[markerIndex].position.latitude;
            double lng = v * vehicle.longitud! + (1 - v) * vehiclesMarkers[markerIndex].position.longitude;

            LatLng newPos = LatLng(lat, lng);
            vehiclesMarkers[markerIndex] = vehiclesMarkers[markerIndex].copyWith(positionParam: newPos, rotationParam: bearing);

            mapMarkerSink.add(vehiclesMarkers);
          });

        animationController.forward();
      } else {
        Marker newVehicleMarker = Marker(
            markerId: markerId,
            icon: BitmapDescriptor.defaultMarker,
            position: LatLng(vehicle.latitud!, vehicle.longitud!),
            onTap: () => add(SelectVehicleEvent(vehicle)));
        vehiclesMarkers.add(newVehicleMarker);
        mapMarkerSink.add(vehiclesMarkers);
      }
    }
  }

  Future<bool> _drawRoute(List<RouteInfo> routesInfo, Completer<GoogleMapController> mapController) async {
    if (routesInfo.isEmpty) return false;

    List<Polyline> polylines = [];
    routeMarkers = [];

    for (int i = 0; i < routesInfo.length; i++) {
      final RouteDraw routeDraw = RouteDraw();

      if (routesInfo[i] is RouteStop) {
        final RouteStop route = routesInfo[i] as RouteStop;
        routeDraw
          ..originLatitude = route.latitud!
          ..originLongitude = route.longitud!;

        totalStops += 1;

        List<LatLng> polyLinePoints = [];

        if (i >= 1) {
          final previousRoute = routesInfo[i - 1] as RouteTravel;
          polyLinePoints.add(LatLng(previousRoute.data!.last.latitud!, previousRoute.data!.last.longitud!));
        }

        polyLinePoints.add(LatLng(route.latitud!, route.longitud!));

        if (i + 1 < routesInfo.length) {
          final nextRoute = routesInfo[i + 1] as RouteTravel;
          polyLinePoints.add(LatLng(nextRoute.data!.first.latitud!, nextRoute.data!.first.longitud!));
        }

        if (i != 0) {
          //Se agrega el marker que despúes es dibujado cuando se renderiza la pantalla con el mapMarkerSink
          MarkerId markerId = MarkerId('$id');
          routeMarkers.add(Marker(
              markerId: markerId,
              icon: stopIcon,
              position: LatLng(routeDraw.originLatitude!, routeDraw.originLongitude!),
              onTap: (() => add(SelectStopEvent(lat: routeDraw.originLatitude!, lng: routeDraw.originLongitude!, selectedStopIndex: i)))));
          id += 1;
        }

        //Se agrega el polyline que despúes es dibujado cuando se renderiza la pantalla con el mapPolylineSink
        Polyline singlePolyline = Polyline(polylineId: PolylineId('$id'), points: polyLinePoints, color: Colors.green, width: 3);
        polylines.add(singlePolyline);
        id += 1;
      } else {
        final RouteTravel route = routesInfo[i] as RouteTravel;
        routeDraw
          ..originLatitude = route.data!.first.latitud!
          ..originLongitude = route.data!.first.longitud!
          ..destinationLatitude = route.data![route.data!.length - 1].latitud!
          ..destinationLongitude = route.data![route.data!.length - 1].longitud!
          ..points = route.data!;

        totalKms += route.km!;

        _addRoutePolylines(polylines, routeDraw.points!);
      }
    }

    //Centrar la camara en la ruta
    List<LatLng> points = [];
    polylines.forEach((line) => {
          line.points.forEach((point) => {points.add(point)})
        });
    final GoogleMapController controller = await mapController.future;
    controller.animateCamera(CameraUpdate.newLatLngBounds(boundsFromLatLngList(points), 90));

    //Se dibuja las banderas de inicio y fin
    drawStartAndEndOfTrip(polylines, routeMarkers);

    mapMarkerSink.add(routeMarkers);
    mapPolylineSink.add(polylines);

    id = 0;

    return points.isNotEmpty;
  }

  void _addRoutePolylines(List<Polyline> polylines, List<Point> points) {
    if (points.isNotEmpty) {
      List<LatLng> polyLinePoints = [];
      double speed = 0;
      Color color = Colors.black;
      Color previousColor = Colors.black;
      double previousLat = 0;
      double previousLng = 0;
      for (int i = 0; i < points.length; i++) {
        if (previousLat == points[i].latitud && previousLng == points[i].longitud && i + 1 != points.length) continue;

        speed = points[i].speed!;
        color = _speedToColor(speed);

        polyLinePoints.add(LatLng(points[i].latitud!, points[i].longitud!));

        if (color != previousColor || i + 1 == points.length) {
          late Polyline singlePolyline;
          if (i + 1 == points.length) {
            singlePolyline = Polyline(polylineId: PolylineId('$id'), points: polyLinePoints, color: color, width: 3);
          } else {
            singlePolyline = Polyline(polylineId: PolylineId('$id'), points: polyLinePoints, color: previousColor, width: 3);
          }

          polylines.add(singlePolyline);
          id += 1;

          polyLinePoints = [];
          polyLinePoints.add(LatLng(points[i].latitud!, points[i].longitud!));
        }
        previousColor = color;
        previousLat = points[i].latitud!;
        previousLng = points[i].longitud!;
      }
    }
  }

  drawStartAndEndOfTrip(List<Polyline> polylines, mapMarkerSink) {
    LatLng? startPosition;
    LatLng? endPosition;

    if (startTrip != null) {
      startTrip = null;
    }
    if (endTrip != null) {
      endTrip = null;
    }

    if (polylines.length >= 2) {
      var length = polylines.length;
      startPosition = polylines[0].points[0];

      var lengthOfLast = polylines[length - 1].points.length;
      endPosition = polylines[length - 1].points[lengthOfLast - 1];
    }

    if (startPosition != null && endPosition != null) {
      List<Marker> startAndEndMarkers = [];

      Marker startMarker = Marker(
        markerId: const MarkerId('startMarker'),
        position: LatLng(startPosition.latitude, startPosition.longitude),
        icon: startTripIcon,
      );
      startTrip = startMarker;
      startAndEndMarkers.add(startMarker);

      Marker endMarker =
          Marker(markerId: const MarkerId("endMarker"), position: LatLng(endPosition.latitude, endPosition.longitude), icon: endTripIcon);
      endTrip = endMarker;
      startAndEndMarkers.add(endMarker);

      routeMarkers.addAll(startAndEndMarkers);
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

  _seticons() async {
    stopIcon = BitmapDescriptor.fromBytes(await getBytesFromAsset(
      path: "assets/gps/stop.png",
      width: 50,
    ));
    stopIconRed = BitmapDescriptor.fromBytes(await getBytesFromAsset(
      path: "assets/gps/stop-red.png",
      width: 80,
    ));
    startTripIcon = BitmapDescriptor.fromBytes(await getBytesFromAsset(
      path: "assets/gps/start.png",
      width: 140,
    ));
    endTripIcon = BitmapDescriptor.fromBytes(await getBytesFromAsset(
      path: "assets/gps/end.png",
      width: 120,
    ));
  }

  Future<Uint8List> getBytesFromAsset({required String path, required int width}) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }
}
