part of 'home_bloc.dart';

class HomeState extends Equatable {
  final int selectedPageView;
  final int selectedNavButton;
  final dynamic data;
  final bool showFab;

  const HomeState(this.selectedPageView, this.selectedNavButton, this.data, this.showFab);

  HomeState copyWith({int? selectedPageView, int? selectedNavButton, dynamic? data, bool? showFab}) {
    return HomeState(
      selectedPageView ?? this.selectedPageView,
      selectedNavButton ?? this.selectedNavButton,
      data ?? this.data,
      showFab ?? this.showFab,
    );
  }

  @override
  List<Object> get props => [selectedPageView, selectedNavButton, showFab];
}

class HomeInitial extends HomeState {
  const HomeInitial() : super(0, 0, null, true);
}

class HomeLogoutState extends HomeState {
  const HomeLogoutState() : super(0, 0, null, true);
}
