import 'package:flutter/services.dart';
import 'package:only_pets/config/colors_constant.dart';

class Statusbar {
  void trasparentStatusbar() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: transparent,
      statusBarBrightness: Brightness.light,
    ));
  }

  void trasparentStatusbarProfile(bool isLightStatusBar) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness:
          isLightStatusBar ? Brightness.light : Brightness.dark,
      statusBarColor: transparent,
      statusBarBrightness: Brightness.light,
    ));
  }

  void trasparentStatusbarIsNormalScreen() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: transparent,
      statusBarBrightness: Brightness.light,
    ));
  }

  void trasparentBottomsheetStatusbar() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: transparent,
    ));
  }

  void trasparentStatusbarScreen() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: black,
        statusBarBrightness: Brightness.dark));
  }
}
