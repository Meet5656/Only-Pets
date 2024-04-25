import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:only_pets/util/log.dart';

class InternetController extends GetxController {
  Rx<ConnectivityResult> connectivity = ConnectivityResult.none.obs;

  void updateConnectivity(ConnectivityResult result) {
    connectivity.value = result;
    update();
    refresh();
  }

  void getNetworkData() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
    } else if (connectivityResult == ConnectivityResult.wifi) {
    } else if (connectivityResult == ConnectivityResult.ethernet) {
    } else if (connectivityResult == ConnectivityResult.vpn) {
    } else if (connectivityResult == ConnectivityResult.bluetooth) {
    } else if (connectivityResult == ConnectivityResult.other) {
    } else if (connectivityResult == ConnectivityResult.none) {}
  }

  //this variable 0 = No Internet, 1 = connected to WIFI ,2 = connected to Mobile Data.
  int connectionType = 0;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription _streamSubscription;
  Function? statusChange;
  void setStatusCallback(Function? fun) {
    statusChange = fun;
    update();
    update();
    update();
    refresh();
  }

  String roomId = "";

  @override
  void onInit() {
    getConnectionType();
    _streamSubscription =
        _connectivity.onConnectivityChanged.listen(_updateState);
    getNetworkData();
    super.onInit();
  }

  late ConnectivityResult connectivityResult;

  Future<void> getConnectionType() async {
    try {
      connectivityResult = await (_connectivity.checkConnectivity());
      logcat("Result", connectivityResult.toString());
    } on PlatformException catch (e) {
      logcat("EXCEPTION:", e);
    }
    update();
    return _updateState(connectivityResult);
  }

  _updateState(ConnectivityResult result) {
    connectivityResult = result;
    switch (result) {
      case ConnectivityResult.wifi:
        connectionType = 1;
        update();
        logcat("ConnectivityResult.wifi", "WIFI");
        break;
      case ConnectivityResult.mobile:
        connectionType = 2;
        update();
        logcat("ConnectivityResult.mobile", "mobile");
        break;
      case ConnectivityResult.ethernet:
        connectionType = 3;
        update();
        logcat("ConnectivityResult.ethernet", "ethernet");
        break;
      case ConnectivityResult.none:
        connectionType = 0;
        update();
        logcat("ConnectivityResult.none", "none");
        break;
      default:
        Get.snackbar('Network Error', 'Failed to get Network Status');
        break;
    }
    if (statusChange != null) {
      statusChange!();
    }
    update();
    refresh();
  }

  @override
  void onClose() {
    _streamSubscription.cancel();
  }
}
