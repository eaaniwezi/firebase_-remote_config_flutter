import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_sport_news_app/services/device_details_service.dart';
import 'package:flutter_sport_news_app/services/remote_config_service.dart';
import 'package:flutter_sport_news_app/bloc/remote_config/remote_config_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  var remoteConfigService = await RemoteConfigService.getInstance();
  var prefs = await SharedPreferences.getInstance();

  sl.registerSingleton(remoteConfigService);
  sl.registerSingleton(prefs);

  await sl.get<RemoteConfigService>().initialise();

  sl.registerLazySingleton<RemoteConfigBloc>(() => RemoteConfigBloc(
      initialState: sl<RemoteConfigInitial>(),
      remoteConfig: remoteConfigService.remoteConfig,
      prefs: prefs,
      deviceDetailsService: sl<DeviceDetailsService>()));

  sl.registerLazySingleton<RemoteConfigInitial>(() => RemoteConfigInitial());

  sl.registerLazySingleton<DeviceDetailsService>(() => DeviceDetailsService());
}
