import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_sport_news_app/services/remote_config_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'remote_config_event.dart';
part 'remote_config_state.dart';

class RemoteConfigBloc extends Bloc<RemoteConfigEvent, RemoteConfigState> {
  final RemoteConfigService remoteConfigService;
  final FirebaseRemoteConfig? remoteConfig;
  final SharedPreferences? prefs;
  RemoteConfigBloc({
    this.prefs,
    this.remoteConfig,
    required this.remoteConfigService,
    required RemoteConfigState initialState,
  })  : assert(remoteConfigService != null),
        super(initialState) {
    add(InitialEvent());
  }
  @override
  Stream<RemoteConfigState> mapEventToState(RemoteConfigEvent event) async* {
    if (event is InitialEvent) {
      try {
        yield GettingRemoteConfig();
        var configPath = remoteConfig!.getString("web_view_url");
        final savedPath = prefs!.getString("web_view_url");

        if (savedPath == null) {
          await prefs!.setString("web_view_url", configPath);

          if (configPath.isEmpty) {
            yield EmptyPathState();
          } else {
            yield SuccessLoadingConfig();
          }
        } else {
          if (savedPath.isEmpty) {
            yield EmptyPathState();
          } else {
            yield SuccessLoadingConfig();
          }
        }
      } catch (e) {
        yield ErrorGettingRemoteConfig();
      }
    }
  }
}
