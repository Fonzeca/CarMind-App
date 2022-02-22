import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

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

      emit(state.copyWith(pageHistorial.last, indexNavButton, event.data));
    });

    on<PopEvent>((event, emit) {
      pageHistorial.removeLast();
      int currentPage = 0;
      if (pageHistorial.isNotEmpty) {
        currentPage = pageHistorial.last;
      }

      add(HomeNavigationEvent(currentPage));
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
        indexNavButton = 1;
        break;
      case 4:
        indexNavButton = 0;
        break;
    }
    return indexNavButton;
  }
}
