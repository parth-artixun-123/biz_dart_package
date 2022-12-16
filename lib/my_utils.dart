library plugin_demo;

import 'package:flutter/foundation.dart';

class MyUtils {
  void printMessage(String message) {
    if (kDebugMode) {
      print(message);
    }
  }
}
