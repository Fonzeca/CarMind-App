part of 'offline_bloc.dart';

abstract class OfflineEvent extends Equatable {
  const OfflineEvent();

  @override
  List<Object> get props => [];
}

class SetOffline extends OfflineEvent {}

class SetOnline extends OfflineEvent {}

class SyncEvent extends OfflineEvent {}
