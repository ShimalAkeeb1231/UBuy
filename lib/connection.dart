import 'package:connectivity_plus/connectivity_plus.dart';

enum ConnectivityStatus { WiFi, Mobile, Ethernet, Bluetooth, None, Unknown }

Future<ConnectivityStatus> checkConnectivity() async {
  var connectivityResult = await Connectivity().checkConnectivity();
  switch (connectivityResult) {
    case ConnectivityResult.mobile:
      return ConnectivityStatus.Mobile;
    case ConnectivityResult.wifi:
      return ConnectivityStatus.WiFi;
    case ConnectivityResult.ethernet:
      return ConnectivityStatus.Ethernet;
    case ConnectivityResult.bluetooth:
      return ConnectivityStatus.Bluetooth;
    case ConnectivityResult.none:
      return ConnectivityStatus.None;
    default:
      return ConnectivityStatus.Unknown;
  }
}

Stream<ConnectivityStatus> listenToConnectivityChanges() async* {
  await for (var result in Connectivity().onConnectivityChanged) {
    switch (result) {
      case ConnectivityResult.mobile:
        yield ConnectivityStatus.Mobile;
        break;
      case ConnectivityResult.wifi:
        yield ConnectivityStatus.WiFi;
        break;
      case ConnectivityResult.ethernet:
        yield ConnectivityStatus.Ethernet;
        break;
      case ConnectivityResult.bluetooth:
        yield ConnectivityStatus.Bluetooth;
        break;
      case ConnectivityResult.none:
        yield ConnectivityStatus.None;
        break;
      default:
        yield ConnectivityStatus.Unknown;
        break;
    }
  }
}
