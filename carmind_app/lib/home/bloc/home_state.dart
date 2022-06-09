part of 'home_bloc.dart';

class HomeState extends Equatable {
  final int selectedPageView;
  final int selectedNavButton;
  final List<dynamic> data;
  final bool showFab;
  final bool showDejarDeUsarVehiculo;

  const HomeState(this.selectedPageView, this.selectedNavButton, this.data, this.showFab, this.showDejarDeUsarVehiculo);

  HomeState copyWith({int? selectedPageView, int? selectedNavButton, List<dynamic>? data, bool? showFab, bool? showDejarDeUsarVehiculo}) {
    return HomeState(
      selectedPageView ?? this.selectedPageView,
      selectedNavButton ?? this.selectedNavButton,
      data ?? this.data,
      showFab ?? this.showFab,
      showDejarDeUsarVehiculo ?? this.showDejarDeUsarVehiculo
    );
  }

  @override
  List<Object> get props => [selectedPageView, selectedNavButton, showFab, data, showDejarDeUsarVehiculo];
}

class HomeInitial extends HomeState {
  HomeInitial() : super(0, 0, [], true, false);
}

class HomeLogoutState extends HomeState {
  HomeLogoutState() : super(0, 0, [], true, false);
}
