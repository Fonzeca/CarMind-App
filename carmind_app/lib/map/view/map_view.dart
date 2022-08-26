import 'package:carmind_app/map/map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MapBloc mapBloc = BlocProvider.of<MapBloc>(context);
    const CameraPosition initialPoint = CameraPosition(
      target: LatLng(0, 0),
      zoom: 14.4746,
    );
    return BlocBuilder<MapBloc, MapState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Map'),
          actions: [
            IconButton(
                onPressed: () async {
                  final GoogleMapController _controller = await mapBloc.controller.future;
                  _controller.animateCamera(CameraUpdate.newCameraPosition(initialPoint));
                },
                icon: const Icon(Icons.location_on))
          ],
        ),
        body: GoogleMap(
          polylines: Set<Polyline>.of(state.polylines.values),
          markers: Set<Marker>.of(state.markers.values),
          mapType: state.mapType,
          initialCameraPosition: initialPoint,
          onMapCreated: (GoogleMapController controller) {
            mapBloc.controller.complete(controller);
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (state.mapType == MapType.normal) {
              mapBloc.add(const ChangeMapTypeEvent(mapType: MapType.satellite));
              return;
            }
            mapBloc.add(const ChangeMapTypeEvent(mapType: MapType.normal));
          },
          child: const Icon(Icons.layers),
        ),
      );
    });
  }
}
