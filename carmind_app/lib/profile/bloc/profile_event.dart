part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class GetLoggedEvent extends ProfileEvent {
  final BuildContext context;

  const GetLoggedEvent(this.context);
}
