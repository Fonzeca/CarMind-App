part of 'home_bloc.dart';

class HomeState extends Equatable {
  final int selectedPageView;
  final int selectedNavButton;
  final dynamic data;

  const HomeState(
    this.selectedPageView,
    this.selectedNavButton, this.data,
  );

  HomeState copyWith(int selectedIndex, int selectedNavButton, dynamic data) {
    return HomeState(selectedIndex, selectedNavButton, data);
  }

  @override
  List<Object> get props => [selectedPageView, selectedNavButton];
}

class HomeInitial extends HomeState {
  const HomeInitial() : super(0, 0, null);
}
