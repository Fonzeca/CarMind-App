part of 'home_bloc.dart';

class HomeState extends Equatable {
  final int selectedPageView;
  final int selectedNavButton;
  final List<dynamic> data;
  final bool showFab;

  const HomeState(this.selectedPageView, this.selectedNavButton, this.data, this.showFab);

  HomeState copyWith({int? selectedPageView, int? selectedNavButton, List<dynamic>? data, bool? showFab}) {
    return HomeState(
      selectedPageView ?? this.selectedPageView,
      selectedNavButton ?? this.selectedNavButton,
      data ?? this.data,
      showFab ?? this.showFab,
    );
  }

  @override
  List<Object> get props => [selectedPageView, selectedNavButton, showFab, data];
}

class HomeInitial extends HomeState {
  HomeInitial() : super(0, 0, [], true);
}

class HomeLogoutState extends HomeState {
  HomeLogoutState() : super(0, 0, [], true);
}
