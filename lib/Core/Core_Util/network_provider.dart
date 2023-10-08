import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';

class NetworkProvider {
  StreamSubscription<ConnectivityResult>? _subscription;
  final StreamController<ConnectivityResult> _networkStatusController =
      StreamController<ConnectivityResult>();

  StreamSubscription<ConnectivityResult>? get subscription => _subscription;
  StreamController<ConnectivityResult> get networkStatusController =>
      _networkStatusController;

  NetworkProvider() {
    checkNetworkStatus();
  }

  void checkNetworkStatus() async {
    _networkStatusController.sink.add(await Connectivity().checkConnectivity());

    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      debugPrint("My Connection >>>>>>>>> $result");
      _networkStatusController.sink.add(result);
    });
  }

  void disposeStreams() {
    _subscription?.cancel();
    _networkStatusController.close();
  }
}
