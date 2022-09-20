import 'dart:convert';

import 'package:carmind_app/api/api.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List<int> pageHistorial = [0];

  HomeBloc() : super(HomeInitial()) {
    on<HomeNavigationEvent>((event, emit) {
      int indexPageView = event.buttonId;
      int indexNavButton = resolveNavButton(event.buttonId);

      if (pageHistorial.isNotEmpty && pageHistorial.last != indexPageView) {
        pageHistorial.add(indexPageView);
      }

      emit(state.copyWith(
          selectedPageView: pageHistorial.last,
          selectedNavButton: indexNavButton,
          vehiculo: event.vehiculo,
          evaluacion: event.evaluacion,
          routeInfoToDraw: event.routeDraw));
    });

    on<PopEvent>((event, emit) {
      int currentPage = 0;
      if (pageHistorial.length > 1) {
        pageHistorial.removeLast();
      }
      if (pageHistorial.isNotEmpty) {
        currentPage = pageHistorial.last;
      }

      add(HomeNavigationEvent(currentPage));
    });

    on<HideFab>((event, emit) {
      emit(state.copyWith(showFab: false));
    });

    on<ShowFab>((event, emit) {
      emit(state.copyWith(showFab: true));
    });

    on<ShowDejarDeUsarVehiculoEvent>((event, emit) {
      emit(state.copyWith(showDejarDeUsarVehiculo: event.showDejarDeUsarVehiculo));
    });

    on<LogOutEvent>((event, emit) async {
      var shr = await SharedPreferences.getInstance();
      shr.remove("token");
      shr.remove("on_boarding_finish");
      emit(HomeLogoutState());
    });
  }

  int resolveNavButton(int buttonId) {
    var indexNavButton = 0;
    switch (buttonId) {
      case 0:
        indexNavButton = 0;
        break;
      case 1:
        indexNavButton = 1;
        break;
      case 2:
        indexNavButton = 2;
        break;
      case 3:
        indexNavButton = 3;
        break;
      case 4:
        indexNavButton = 1;
        break;
      case 5:
        indexNavButton = 3;
        break;
    }
    return indexNavButton;
  }

  @override
  HomeState? fromJson(Map<String, dynamic> json) => HomeState.fromMap(json);

  @override
  Map<String, dynamic>? toJson(HomeState state) => state.toMap();
}
