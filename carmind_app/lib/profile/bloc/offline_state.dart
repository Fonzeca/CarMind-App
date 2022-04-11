part of 'offline_bloc.dart';

class OfflineState extends Equatable {
  final bool offline;
  final bool loading;

  const OfflineState({required this.offline, required this.loading});

  @override
  List<Object?> get props => [offline, loading];

  OfflineState copyWith({bool? offline, bool? loading}) {
    return OfflineState(offline: offline ?? this.offline, loading: loading ?? this.loading);
  }
}
