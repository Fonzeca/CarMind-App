import 'package:carmind_app/api/api.dart';
import 'package:carmind_app/main.dart';
import 'package:carmind_app/profile/profile.dart';
import 'package:carmind_app/services/services.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  late ApiClient api;

  ProfileBloc() : super(const ProfileState(loading: true)) {
    api = ApiClient(staticDio!);
    on<GetLoggedEvent>((event, emit) async {
      emit(state.copyWith(loading: true));

      LoggedUser? user;

      if (OfflineModeService.isOffline(context: event.context)) {
        user = BlocProvider.of<OfflineBloc>(event.context).state.loggedUser;
      } else {
        user = await api.loggedUser();
      }

      if (user != null && user.username != null) FirebaseCrashlytics.instance.setUserIdentifier(user.username!);

      EasyLoading.dismiss();
      emit(state.copyWith(loading: false, logged: user));
    });
  }
}
