import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  HomeBloc() : super(HomeInitial()) {

    on<HomeNavigationEvent>((event, emit) {
      int indexPageView = 0;
      int indexNavButton = 0;
      switch (event.buttonId) {
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
      }
      indexPageView = event.buttonId;


      emit(state.copyWith(indexPageView, indexNavButton));
    });
  }

}
