part of 'offline_bloc.dart';

class OfflineState extends Equatable {
  final bool offline;
  final bool loading;
  final bool failAuth;

  const OfflineState({required this.offline, required this.loading, required this.failAuth});

  @override
  List<Object?> get props => [offline, loading, failAuth];

  OfflineState copyWith({bool? offline, bool? loading, bool? failAuth}) {
    return OfflineState(
      offline: offline ?? this.offline,
      loading: loading ?? this.loading,
      failAuth: failAuth ?? false,
    );
  }
}
