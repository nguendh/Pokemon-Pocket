import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';

class DeviceHelper {
  static Future<bool> onIPad() async {
    var deviceInfo = DeviceInfoPlugin();
    var info = await deviceInfo.iosInfo;
    return info.model.toLowerCase().contains("ipad") &&
        info.systemName.toLowerCase().contains("ios");
  }

  static int crossAxisCount(Orientation orientation, bool isIPad) => isIPad
      ? (orientation == Orientation.portrait ? 4 : 6)
      : (orientation == Orientation.portrait ? 2 : 4);
}
