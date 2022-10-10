// ignore_for_file: unnecessary_null_comparison
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_sport_news_app/services/device_details_service.dart';

part 'remote_config_event.dart';
part 'remote_config_state.dart';

class RemoteConfigBloc extends Bloc<RemoteConfigEvent, RemoteConfigState> {

  final FirebaseRemoteConfig remoteConfig;
  final SharedPreferences? prefs;
  RemoteConfigBloc({
    this.prefs,
    required this.remoteConfig,
    required RemoteConfigState initialState,
  })  : assert(remoteConfig != null),
        super(initialState) {
    add(InitialEvent());
  }
  @override
  Stream<RemoteConfigState> mapEventToState(RemoteConfigEvent event) async* {
    if (event is InitialEvent) {
      try {
        yield GettingRemoteConfig();
        final brandName = await DeviceDetailsService().getBrandName();
        final checkSimCard = await DeviceDetailsService().checkSimCard();
        var configPath = remoteConfig.getString("web_view_url");
        final savedPath = prefs!.getString("web_view_url");

        if (savedPath == null) {
          await prefs!.setString("web_view_url", configPath);

          if ((configPath.isEmpty) ||
              (brandName.contains("google")) ||
              (checkSimCard.isEmpty)) {
            yield ShowStubState();
          } else {
            yield ShowWebViewState(configPath: configPath);
          }
        } else {
          if ((savedPath.isEmpty) ||
              (brandName.contains("google")) ||
              (checkSimCard.isEmpty)) {
            yield ShowStubState();
          } else {
            yield ShowWebViewState(configPath: configPath);
          }
        }
      } catch (e) {
        yield ErrorGettingRemoteConfig();
      }
    }
  }
}
