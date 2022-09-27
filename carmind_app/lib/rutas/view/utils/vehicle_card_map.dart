import 'dart:async';

import 'package:carmind_app/api/api.dart';
import 'package:carmind_app/constants.dart';
import 'package:carmind_app/rutas/rutas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:omni_date_time_picker_edited/omni_datetime_picker.dart';
import 'package:skeletons/skeletons.dart';

class VehicleCardMap extends StatelessWidget {
  final Completer<GoogleMapController> mapController;
  final StreamSink<List<Marker>> mapMarkerSink;
  final StreamSink<List<Polyline>> mapPolylineSink;
  final VehicleInfoMap vehicleInfo;
  final String? dateFrom;
  final String? dateTo;
  final bool isLoading;

  const VehicleCardMap(
      {Key? key,
      required this.vehicleInfo,
      this.dateFrom,
      this.dateTo,
      required this.isLoading,
      required this.mapController,
      required this.mapMarkerSink,
      required this.mapPolylineSink})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 550,
      duration: const Duration(seconds: 2),
      child: Column(children: [
        _Header(type: vehicleInfo.tipo!, name: vehicleInfo.nombre!),
        _Body(
            mapController: mapController,
            mapMarkerSink: mapMarkerSink,
            mapPolylineSink: mapPolylineSink,
            imei: vehicleInfo.imei!,
            patente: vehicleInfo.patente,
            engineStatus: vehicleInfo.engine_status!,
            choferActual: vehicleInfo.usuario_en_uso,
            dateFrom: dateFrom,
            dateTo: dateTo,
            isLoading: isLoading),
      ]),
    );
  }
}

class _Header extends StatelessWidget {
  final String type;
  final String name;

  const _Header({
    Key? key,
    required this.type,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 120,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: _buildBoxDecoration(),
      child: Column(
        children: [
          Container(
            width: size.width / 1.8,
            decoration: BoxDecoration(color: const Color(0xffBBB8B7), borderRadius: BorderRadius.circular(10)),
            height: 5,
            margin: const EdgeInsets.only(bottom: 18),
          ),
          Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            if (type == 'Auto')
              SvgPicture.asset(
                "assets/vehiculo.svg",
                color: Colors.white,
                height: 50,
                width: 50,
              )
            else
              SvgPicture.asset("assets/iconos_vehiculos/camion.svg", color: Colors.white),
            const SizedBox(width: 80),
            Expanded(
                child: Text(
              name,
              style: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
              maxLines: 2,
              textAlign: TextAlign.center,
            ))
          ]),
        ],
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return const BoxDecoration(color: carMindTopBar, borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)));
  }
}

class _Body extends StatelessWidget {
  final Completer<GoogleMapController> mapController;
  final StreamSink<List<Marker>> mapMarkerSink;
  final StreamSink<List<Polyline>> mapPolylineSink;
  final String? patente;
  final String? choferActual;
  final bool engineStatus;
  final String imei;
  final String? dateFrom;
  final String? dateTo;
  final bool isLoading;

  _Body({
    Key? key,
    required this.mapController,
    required this.mapMarkerSink,
    required this.mapPolylineSink,
    required this.patente,
    required this.choferActual,
    required this.engineStatus,
    required this.imei,
    this.dateFrom,
    this.dateTo,
    required this.isLoading,
  }) : super(key: key);

  final TextStyle textStyle = const TextStyle(fontSize: 18);
  final String buscarEntreFechas = "Buscar entre fechas...";

  @override
  Widget build(BuildContext context) {
    final DateTime firstDate = DateTime(2000, 1, 1, 0, 0);
    final DateTime dateTimeNow = DateTime.now();

    final RoutesBloc routesBloc = BlocProvider.of<RoutesBloc>(context);

    return Container(
      padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
      color: Colors.white,
      height: 430,
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(patente != null ? "Patente: $patente" : "Patente: N/A", style: textStyle),
              const SizedBox(height: 4),
              Row(children: [
                Text("Motor:", style: textStyle),
                const SizedBox(width: 4),
                Icon(Icons.circle, color: engineStatus ? const Color(0xFF36A900) : const Color(0xFFDC0404), size: 14)
              ]),
              const SizedBox(height: 4),
              if (choferActual != null) Text("Chofer: $choferActual", style: textStyle),
              const SizedBox(height: 8),
            ],
          ),
          Expanded(
              child: Column(
            children: [
              const Divider(
                color: Colors.black26,
              ),
              const Text("Rutas", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
              Row(children: [
                const SizedBox(width: 10),
                SvgPicture.asset(
                  "assets/routes_gps.svg",
                  color: Colors.black,
                  height: 25,
                  width: 25,
                ),
                Text('${routesBloc.totalKms} km'),
                const Spacer(),
                const Icon(
                  Icons.location_on_outlined,
                  size: 30,
                ),
                Text('${routesBloc.totalStops} paradas'),
                const SizedBox(width: 10)
              ]),
              CustomButton(
                  onPressed: () async {
                    final RoutesBloc routesBloc = BlocProvider.of<RoutesBloc>(context);

                    List<DateTime>? dateTimeFromTo = await showOmniDateTimeRangePicker(
                        type: OmniDateTimePickerType.dateAndTime,
                        context: context,
                        startInitialDate: dateTimeNow,
                        startFirstDate: firstDate,
                        startLastDate: dateTimeNow,
                        endInitialDate: dateTimeNow,
                        endFirstDate: firstDate,
                        endLastDate: dateTimeNow,
                        primaryColor: carMindPrimaryButton,
                        backgroundColor: Colors.white,
                        tabTextColor: carMindTopBar,
                        buttonTextColor: carMindTopBar,
                        calendarTextColor: Colors.black,
                        timeSpinnerTextStyle: const TextStyle(fontSize: 12, color: Colors.black),
                        timeSpinnerHighlightedTextStyle: const TextStyle(fontSize: 20, color: carMindTopBar),
                        is24HourMode: true);

                    if (dateTimeFromTo == null) return;

                    final String dateFromPicked = '${DateFormat('yyyy-MM-dd HH:mm').format(dateTimeFromTo[0])}:00';
                    final String dateToPicked = '${DateFormat('yyyy-MM-dd HH:mm').format(dateTimeFromTo[1])}:00';

                    routesBloc.add(GetVehicleRoutes(
                        imei: imei,
                        from: dateFromPicked,
                        to: dateToPicked,
                        mapController: mapController,
                        mapMarkerSink: mapMarkerSink,
                        mapPolylineSink: mapPolylineSink));
                  },
                  height: 30,
                  foreGroundColor: (dateFrom == null && dateTo == null) ? const Color(0xff989898) : const Color(0xff303030),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Text((dateFrom == null && dateTo == null)
                        ? buscarEntreFechas
                        : "${DateFormat('yyyy-MM-dd HH:mm').format(DateFormat('yyyy-MM-dd HH:mm:ss').parse(dateFrom!))} - ${DateFormat('yyyy-MM-dd HH:mm').format(DateFormat('yyyy-MM-dd HH:mm:ss').parse(dateTo!))}"),
                    const Icon(Icons.search_rounded)
                  ])),
              const SizedBox(height: 10),
              (!isLoading && routesBloc.routesInfo.isEmpty && (dateFrom != null && dateTo != null))
                  ? const _NoResultsFound()
                  : Expanded(child: isLoading ? const _RoutesListLoading() : _RoutesList(mapController: mapController, routes: routesBloc.routesInfo))
            ],
          ))
        ],
      ),
    );
  }
}

class _NoResultsFound extends StatelessWidget {
  const _NoResultsFound({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () {},
      height: 50,
      foreGroundColor: const Color(0xff989898),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        Text('No se encontraron resultados', style: TextStyle(fontSize: 16)),
      ]),
    );
  }
}

class _RoutesListLoading extends StatelessWidget {
  const _RoutesListLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SkeletonItem(
      child: ListView(
        children: const [
          SkeletonAvatar(
            style: SkeletonAvatarStyle(height: 50, width: double.infinity, padding: EdgeInsets.symmetric(horizontal: 12)),
          ),
          SkeletonAvatar(
            style: SkeletonAvatarStyle(height: 50, width: double.infinity, padding: EdgeInsets.symmetric(horizontal: 12)),
          ),
          SkeletonAvatar(
            style: SkeletonAvatarStyle(height: 50, width: double.infinity, padding: EdgeInsets.symmetric(horizontal: 12)),
          ),
          SkeletonAvatar(
            style: SkeletonAvatarStyle(height: 50, width: double.infinity, padding: EdgeInsets.symmetric(horizontal: 12)),
          ),
          SkeletonAvatar(
            style: SkeletonAvatarStyle(height: 50, width: double.infinity, padding: EdgeInsets.symmetric(horizontal: 12)),
          ),
        ],
      ),
    );
  }
}

class _RoutesList extends StatelessWidget {
  final Completer<GoogleMapController> mapController;
  final List<RouteInfo> routes;

  const _RoutesList({
    Key? key,
    required this.routes,
    required this.mapController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        itemCount: routes.length,
        itemBuilder: ((context, index) {
          Widget leading;
          final RouteDraw routeDraw = RouteDraw();
          DateFormat inputFormat = DateFormat('HH:mm');
          final String fromattedHourfrom = _formatHour(inputFormat, routes[index].fromHour!);
          final String fromattedHourTo = _formatHour(inputFormat, routes[index].toHour!);
          DateTime inputDateA = inputFormat.parse(routes[index].fromHour!);
          DateTime inputDateB = inputFormat.parse(routes[index].toHour!);
          final int differenceInHour = inputDateA.difference(inputDateB).inHours.abs();
          final int differenceInMin = (differenceInHour * 60 - inputDateA.difference(inputDateB).inMinutes.abs()).abs();
          String timeDifference = differenceInHour != 0 ? "(${differenceInHour}hr ${differenceInMin}m)" : "(${differenceInMin}m)";

          if (routes[index] is RouteStop) {
            leading = const Icon(
              Icons.location_on_outlined,
              size: 40,
            );

            final RouteStop route = routes[index] as RouteStop;
            routeDraw
              ..originLatitude = route.latitud!
              ..originLongitude = route.longitud!;
          } else {
            leading = SvgPicture.asset(
              "assets/routes_gps.svg",
              color: Colors.black,
              height: 35,
              width: 35,
            );

            final RouteTravel route = routes[index] as RouteTravel;
            routeDraw
              ..originLatitude = route.data!.first.latitud!
              ..originLongitude = route.data!.first.longitud!;
          }

          return CustomButton(
            onPressed: () {
              if (routes[index] is RouteStop) {
                BlocProvider.of<RoutesBloc>(context).add(
                    MoveCameraToPointEvent(mapController: mapController, latitude: routeDraw.originLatitude!, longitude: routeDraw.originLongitude!));
              } else {
                BlocProvider.of<RoutesBloc>(context).add(MoveCameraToRouteEvent(
                    mapController: mapController, points: (routes[index] as RouteTravel).data!.map((e) => LatLng(e.latitud!, e.longitud!)).toList()));
              }
            },
            height: 50,
            foreGroundColor: const Color(0xff303030),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              leading,
              const SizedBox(width: 8),
              Text(' ${routes[index].fromDate!}', style: const TextStyle(fontSize: 15)),
              Expanded(
                  child: Text(
                '$fromattedHourfrom - $fromattedHourTo $timeDifference',
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.right,
              ))
            ]),
          );
        }));
  }

  String _formatHour(DateFormat inputFormat, String time) {
    DateFormat outputFormat = DateFormat('HH:mm');
    DateTime inputDate = inputFormat.parse(time);
    return outputFormat.format(inputDate);
  }
}
