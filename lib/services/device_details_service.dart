import 'package:carrier_info/carrier_info.dart';
import 'package:device_info_plus/device_info_plus.dart';

class DeviceDetailsService {
  final deviceInfo = DeviceInfoPlugin();

  Future<String> getBrandName() async {
    try {
      var deviceDetails = await deviceInfo.androidInfo;
      return deviceDetails.brand!;
    } catch (e) {
      return "";
    }
  }

  Future<String> checkSimCard() async {
    try {
      var simDevice = await CarrierInfo.carrierName;
      return simDevice!;
    } catch (e) {
      return "";
    }
  }
}
