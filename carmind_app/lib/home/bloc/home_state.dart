part of 'home_bloc.dart';

class HomeState extends Equatable {
  final int selectedIndex;
  
  const HomeState(this.selectedIndex);

  HomeState copyWith(int selectedIndex){
    return HomeState(
      selectedIndex
    );
  }
  
  @override
  List<Object> get props => [selectedIndex];
}

class HomeInitial extends HomeState {
  const HomeInitial() : super(0);
}
