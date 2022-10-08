import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_sport_news_app/services/remote_config_service.dart';

final sl = GetIt.instance;

Future<void> init() async {
  var remoteConfigService = await RemoteConfigService.getInstance();
  var prefs = await SharedPreferences.getInstance();

  sl.registerSingleton(remoteConfigService);
  sl.registerSingleton(prefs);

  await sl.get<RemoteConfigService>().initialise(prefs: prefs);
}
