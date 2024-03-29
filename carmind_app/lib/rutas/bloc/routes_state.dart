part of 'routes_bloc.dart';

class RoutesState extends Equatable {
  final VehicleInfoMap vehicle;
  final String? dateFrom;
  final String? dateTo;
  final bool showPanelHeader;
  final bool areRoutesLoading;
  final int selectedStopIndex;

  const RoutesState(
      {required this.vehicle,
      required this.dateFrom,
      required this.dateTo,
      required this.showPanelHeader,
      required this.areRoutesLoading,
      required this.selectedStopIndex});

  RoutesState copyWith(
      {VehicleInfoMap? vehicle, String? dateFrom, String? dateTo, bool? showPanelHeader, bool? areRoutesLoading, int? selectedStopIndex}) {
    return RoutesState(
        vehicle: vehicle ?? this.vehicle,
        dateFrom: (dateFrom != null && dateFrom.isEmpty) ? null : (dateFrom ?? this.dateFrom),
        dateTo: (dateTo != null && dateTo.isEmpty) ? null : (dateTo ?? this.dateTo),
        showPanelHeader: showPanelHeader ?? this.showPanelHeader,
        areRoutesLoading: areRoutesLoading ?? this.areRoutesLoading,
        selectedStopIndex: selectedStopIndex ?? this.selectedStopIndex);
  }

  @override
  List<Object?> get props => [vehicle, dateFrom, dateTo, showPanelHeader, areRoutesLoading, selectedStopIndex];
}

class MapStateInitial extends RoutesState {
  MapStateInitial()
      : super(vehicle: VehicleInfoMap(), dateFrom: null, dateTo: null, showPanelHeader: false, areRoutesLoading: false, selectedStopIndex: -1);
}
