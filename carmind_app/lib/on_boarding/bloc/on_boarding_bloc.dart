import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'on_boarding_event.dart';
part 'on_boarding_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  final int steps = 3;

  OnBoardingBloc() : super(const OnBoardingState(currentIndex: 0)) {
    on<OnBoardingCancel>((event, emit) {
      emit(state.copyWith(finish: true));
    });

    on<OnBoardingNextStep>((event, emit) {
      if (state.currentIndex + 1 == steps) {
        emit(state.copyWith(finish: true));
      } else {
        emit(state.copyWith(currentIndex: state.currentIndex + 1));
      }
    });

    on<OnBoardingPreviousStep>((event, emit) {
      if (state.currentIndex == 0) return;
      emit(state.copyWith(currentIndex: state.currentIndex - 1));
    });
  }
}
