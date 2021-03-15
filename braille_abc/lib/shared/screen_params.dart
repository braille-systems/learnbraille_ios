import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Class converts the percentage size to pixels based on the current screen size
class ScreenParams {
  static width(double percent, BuildContext context) {
    return MediaQuery.of(context).size.width * (percent / 100);
  }

  static height(double percent, BuildContext context) {
    return MediaQuery.of(context).size.height * (percent / 100);
  }

  // Height (without SafeArea)
  static heightIOS14(double percent, BuildContext context) {
    var padding = MediaQuery.of(context).padding;
    double height = MediaQuery.of(context).size.height;
    return (height - padding.top - padding.bottom) * (percent / 100);
  }

  // Height (without status bar)
  static heightWithoutSB(double percent, BuildContext context) {
    var padding = MediaQuery.of(context).padding;
    double height = MediaQuery.of(context).size.height;
    return (height - padding.top) * (percent / 100);
  }

  // Height (without status and toolbar)
  static heightWithoutSBandTB(double percent, BuildContext context) {
    var padding = MediaQuery.of(context).padding;
    double height = MediaQuery.of(context).size.height;
    return (height - padding.top - kToolbarHeight) * (percent / 100);
  }
}
