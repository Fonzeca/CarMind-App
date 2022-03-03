import 'package:bloc/bloc.dart';
import 'package:carmind_app/api/api_client.dart';
import 'package:carmind_app/api/pojo/profile/logged_user.dart';
import 'package:carmind_app/main.dart';
import 'package:equatable/equatable.dart';

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
