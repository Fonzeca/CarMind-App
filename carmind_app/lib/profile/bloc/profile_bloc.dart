import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:carmind_app/api/api.dart';
import 'package:carmind_app/main.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  late ApiClient api;

  ProfileBloc() : super(const ProfileState(loading: true)) {
    api = ApiClient(staticDio!);
    on<GetLoggedEvent>((event, emit) async {
      emit(state.copyWith(loading: true));

      LoggedUser user = await api.loggedUser();

      emit(state.copyWith(loading: false, logged: user));
    });
  }
}
