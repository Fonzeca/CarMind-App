part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  final LoggedUser? logged;
  final bool loading;

  const ProfileState({this.logged, required this.loading});

  @override
  List<Object?> get props => [logged, loading];

  ProfileState copyWith({bool? loading, LoggedUser? logged}) {
    return ProfileState(
      loading: loading ?? this.loading,
      logged: logged ?? this.logged,
    );
  }
}
