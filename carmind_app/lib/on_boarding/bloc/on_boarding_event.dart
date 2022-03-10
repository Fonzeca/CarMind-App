part of 'on_boarding_bloc.dart';

abstract class OnBoardingEvent extends Equatable {
  const OnBoardingEvent();

  @override
  List<Object> get props => [];
}

class OnBoardingNextStep extends OnBoardingEvent {}

class OnBoardingPreviousStep extends OnBoardingEvent {}

class OnBoardingCancel extends OnBoardingEvent {}
