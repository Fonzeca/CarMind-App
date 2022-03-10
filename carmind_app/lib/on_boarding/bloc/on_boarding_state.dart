part of 'on_boarding_bloc.dart';

class OnBoardingState extends Equatable {
  final int currentIndex;
  final bool finish;

  const OnBoardingState({required this.currentIndex, this.finish = false});

  OnBoardingState copyWith({bool? finish, int? currentIndex}) {
    return OnBoardingState(
      currentIndex: currentIndex ?? this.currentIndex,
      finish: finish ?? this.finish,
    );
  }

  @override
  List<Object> get props => [currentIndex, finish];
}
