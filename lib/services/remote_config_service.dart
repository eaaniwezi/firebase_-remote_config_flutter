// ignore_for_file: unused_field, prefer_conditional_assignment, avoid_print

import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

const String _path = "web_view_url";

class RemoteConfigService {
  final FirebaseRemoteConfig remoteConfig;
  final defaults = <String, dynamic>{_path: ""};

  static RemoteConfigService? _instance;
  // static SharedPreferences? prefs;
  static Future<RemoteConfigService> getInstance() async {
    if (_instance == null) {
      _instance = RemoteConfigService(
        remoteConfig: FirebaseRemoteConfig.instance,
      );
    }
    return _instance!;
  }

  RemoteConfigService({FirebaseRemoteConfig? remoteConfig})
      : remoteConfig = remoteConfig!;

  String get firebaseConfigPath 
    => remoteConfig.getString(_path);
  

  

  Future initialise({required SharedPreferences prefs}) async {
    // print("firebaseConfigPath");
    // print(firebaseConfigPath);
    try {
      await remoteConfig.setDefaults(defaults);
      await _fetchAndActivate();
    } on FirebaseException catch (e) {
      print('Remote config fetch throttled: $e');
    } catch (e) {
      print(
          'Unable to fetch remote config. Cached or default values will be used');
    }
  }

  Future _fetchAndActivate() async {
    await remoteConfig.fetch();
    await remoteConfig.fetchAndActivate();
  }
}
