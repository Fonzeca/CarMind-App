part of 'home_bloc.dart';

class HomeState extends Equatable {
  final int selectedPageView;
  final int selectedNavButton;

  const HomeState(
    this.selectedPageView,
    this.selectedNavButton,
  );

  HomeState copyWith(int selectedIndex, int selectedNavButton) {
    return HomeState(selectedIndex, selectedNavButton);
  }

  @override
  List<Object> get props => [selectedPageView, selectedNavButton];
}

class HomeInitial extends HomeState {
  const HomeInitial() : super(0, 0);
}
