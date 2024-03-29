import 'dart:async';

import 'package:carmind_app/api/api.dart';
import 'package:carmind_app/constants.dart';
import 'package:carmind_app/home/home.dart';
import 'package:carmind_app/rutas/rutas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> with TickerProviderStateMixin {
  final CameraPosition initialPos = const CameraPosition(
    target: LatLng(-49.09720312121282, -70.03227476582823),
    zoom: 6.5,
  );

  final Completer<GoogleMapController> mapController = Completer();

  final PanelController panelController = PanelController();

  final RoutesBloc routeBloc = GetIt.I.get<RoutesBloc>();

  @override
  void initState() {
    routeBloc.add(const GetVehiclesPositions());
    routeBloc.add(UpdateVehiclesPositions(ticker: this));
    super.initState();
  }

  @override
  void dispose() {
    routeBloc.add(ResetStateEvent());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final RoutesBloc routesBloc = BlocProvider.of<RoutesBloc>(context);

    if (routesBloc.isMapNotLoaded) EasyLoading.show();

    return BlocBuilder<RoutesBloc, RoutesState>(builder: (context, state) {
      _movePanel(state.vehicle, state.showPanelHeader);

      final googleMap = StreamBuilder<List<Marker>>(
          stream: routeBloc.mapMarkerStream,
          builder: (context, markers) {
            return StreamBuilder<List<Polyline>>(
                stream: routeBloc.mapPolylineStream,
                builder: (context, polylines) {
                  return GoogleMap(
                    zoomControlsEnabled: false,
                    polylines: Set<Polyline>.of(polylines.data ?? []),
                    markers: Set<Marker>.of(markers.data ?? []),
                    initialCameraPosition: initialPos,
                    onMapCreated: (GoogleMapController mapController) {
                      this.mapController.complete(mapController);
                      EasyLoading.dismiss();
                      routesBloc.isMapNotLoaded = false;
                    },
                  );
                });
          });

      return SlidingUpPanel(
        controller: panelController,
        onPanelOpened: () => routesBloc.add(const OpenPanelEvent(showPanelHeader: false)),
        onPanelClosed: () {
          BlocProvider.of<HomeBloc>(context).add(ShowFab());
          routesBloc.add(const UnSelectVehicle());
          routeBloc.mapMarkerSink.add(routesBloc.vehiclesMarkers);
          routeBloc.mapPolylineSink.add([]);
        },
        maxHeight: 550,
        minHeight: 0,
        color: Colors.transparent,
        panel: (state.vehicle.imei != null)
            ? VehicleCardMap(
                mapController: mapController,
                vehicleInfo: state.vehicle,
                dateFrom: state.dateFrom,
                dateTo: state.dateTo,
                isLoading: state.areRoutesLoading,
                selectedStopIndex: state.selectedStopIndex)
            : Container(),
        body: Column(
          children: [
            Container(
                padding: const EdgeInsets.only(top: 20),
                color: carMindTopBar,
                height: 100,
                width: double.infinity,
                child: Align(
                  alignment: Alignment.center,
                  child: TextButton(
                      style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width * 0.95, 50)),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                          overlayColor: MaterialStateProperty.all(Colors.transparent)),
                      onPressed: () {
                        showSearch(
                            context: context,
                            delegate:
                                CustomSearchDelegate(vehicleNames: routesBloc.vehicleNames, routesBloc: routesBloc, mapController: mapController));
                      },
                      child: _SearchBar(vehicleNames: routesBloc.vehicleNames, routesBloc: routesBloc)),
                )),
            SizedBox(height: MediaQuery.of(context).size.height - 100, child: googleMap),
          ],
        ),
      );
    });
  }

  void _movePanel(VehicleInfoMap vehicle, bool showPanelHeader) {
    if (!showPanelHeader && (!panelController.isAttached || panelController.panelPosition > 0.06)) return;

    if (showPanelHeader) {
      double scrollPosition = 0.06;
      if (vehicle.usuario_en_uso == null) {
        BlocProvider.of<HomeBloc>(context).add(HideFab());
        scrollPosition = 0.06;
      }
      if (vehicle.imei != null && panelController.isAttached) panelController.animatePanelToPosition(scrollPosition);
    }
  }
}

class _SearchBar extends StatelessWidget {
  final List<dynamic> vehicleNames;
  final RoutesBloc routesBloc;

  const _SearchBar({
    Key? key,
    required this.vehicleNames,
    required this.routesBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      primary: false,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      title: const Text(
        "Buscar vehículos...",
        style: TextStyle(fontWeight: FontWeight.w300),
      ),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      shadowColor: Colors.transparent,
      actions: const [
        Icon(Icons.search_rounded),
        SizedBox(
          width: 15,
        )
      ],
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  final List<dynamic> vehicleNames;
  final RoutesBloc routesBloc;
  final Completer<GoogleMapController> mapController;

  CustomSearchDelegate({required this.vehicleNames, required this.routesBloc, required this.mapController});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var vehicleName in vehicleNames) {
      if (vehicleName.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(vehicleName);
      }
    }
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
          onTap: () {
            close(context, null);
            final VehicleInfoMap vehicle = routesBloc.vehicles.firstWhere((v) => v.nombre == result);
            BlocProvider.of<HomeBloc>(context).add(HideFab());
            routesBloc.add(SelectVehicleEvent(vehicle));
            routesBloc.add(MoveCameraToPointEvent(mapController: mapController, latitude: vehicle.latitud!, longitude: vehicle.longitud!));
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var vehicleName in vehicleNames) {
      if (vehicleName.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(vehicleName);
      }
    }
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          tileColor: Colors.transparent,
          title: Text(result),
          onTap: () {
            close(context, null);
            final VehicleInfoMap vehicle = routesBloc.vehicles.firstWhere((v) => v.nombre == result);
            BlocProvider.of<HomeBloc>(context).add(HideFab());
            routesBloc.add(SelectVehicleEvent(vehicle));
            routesBloc.add(MoveCameraToPointEvent(mapController: mapController, latitude: vehicle.latitud!, longitude: vehicle.longitud!));
          },
        );
      },
    );
  }

  @override
  String get searchFieldLabel => 'Buscar vehículos...';

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: carMindTopBar,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.white),
        textTheme: const TextTheme(headline6: TextStyle(color: Colors.white)),
        hintColor: Colors.white,
        inputDecorationTheme: const InputDecorationTheme(focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white))));
  }
}
