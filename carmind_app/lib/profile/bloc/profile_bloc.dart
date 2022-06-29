import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:carmind_app/api/api.dart';
import 'package:carmind_app/main.dart';
import '../../constants.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  late ApiClient api;

  ProfileBloc() : super(const ProfileState(loading: true)) {
    api = ApiClient(staticDio!);
    on<GetLoggedEvent>((event, emit) async {
      emit(state.copyWith(loading: true));

      LoggedUser user = await api.loggedUser();


      if(user.username != null) {
        FirebaseCrashlytics.instance.setUserIdentifier(user.username!);
        FirebaseMessaging.instance.onTokenRefresh
          .listen((fcmToken) {
            // TODO: If necessary send token to application server.

            // Note: This callback is fired at each app startup and whenever a new
            // token is generated.
          })
          .onError((err) {
            FirebaseCrashlytics.instance.recordError(
              'Mensaje: ${err.toString()}',
              StackTrace.current,
              reason: noFMTokenError
            );
        });
      }

      emit(state.copyWith(loading: false, logged: user));
    });
  }
}
