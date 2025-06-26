import 'package:firebase_remote_config/firebase_remote_config.dart';

mixin RemoteConfigGetters {
  FirebaseRemoteConfig get remoteConfig;

  Future<bool> getBool(String key) async {
    return remoteConfig.getBool(key);
  }

  Future<double> getDouble(String key) async {
    return remoteConfig.getDouble(key);
  }

  Future<int> getInt(String key) async {
    return remoteConfig.getInt(key);
  }

  Future<String> getString(String key) async {
    return remoteConfig.getString(key);
  }
}
