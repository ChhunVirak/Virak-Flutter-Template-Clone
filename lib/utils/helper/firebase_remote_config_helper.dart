import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;

class FirebaseRemoteConfigHelper {
  static Future<dynamic> initial() async {
    final Map<String, dynamic> defaults = <String, dynamic>{
      'is_developement': false
    };
    await remoteConfig.setDefaults(defaults);

    try {
      remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: Duration.zero,
        minimumFetchInterval: const Duration(hours: 1),
      ));
      remoteConfig.activate();
      remoteConfig.fetchAndActivate().then((value) {
        debugPrint('Is Color: $value');
      });
    } on PlatformException catch (ex) {
      debugPrint(ex.toString());
    } catch (ex) {
      debugPrint(ex.toString());
    }
  }
}
