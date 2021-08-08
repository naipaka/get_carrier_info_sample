import 'package:carrier_info/carrier_info.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkUtil {
  // 現在の回線
  static Future<String?> currentConnection() async {
    final result = await Connectivity().checkConnectivity();
    final connection = () {
      switch (result) {
        case ConnectivityResult.mobile:
          return 'モバイル回線';
        case ConnectivityResult.wifi:
          return 'Wifi回線';
        case ConnectivityResult.none:
          return '回線なし';
      }
    }();
    return connection;
  }

  // モバイル回線に接続しているか
  static Future<bool> isMobileConnection() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult == ConnectivityResult.mobile;
  }

  // Wifi回線に接続しているか
  static Future<bool> isWifiConnection() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult == ConnectivityResult.wifi;
  }

  /// 携帯サービスプロバイダーを取得する
  static Future<String?> getCarrierName() async {
    return await CarrierInfo.carrierName;
  }

  /// ネットワーク番号を取得する
  static Future<String> getMobileNetworkOperator() async {
    // 運用地域を示す3桁の番号
    final mobileContryCode = await CarrierInfo.mobileCountryCode;
    // 通信キャリアを識別する2桁の番号
    final mobileNetworkCode = await CarrierInfo.mobileNetworkCode;
    // 公衆陸上移動体ネットワーク番号（PLMN）
    return '$mobileContryCode$mobileNetworkCode';
  }
}
