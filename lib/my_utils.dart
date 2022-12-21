library plugin_demo;

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:plugin_demo/biz_date_time.dart';

import 'biz_country_time.dart';

class MyUtils {
  var dateFormats = [
    "MM-dd-yyyy",
    "dd-MM-yyyy",
    "dd-MM-yy",
    "yyyy-MM-dd",
    "MM/dd/yyyy",
    "dd/MM/yyyy",
    "dd/MM/yy",
    "yyyy/MM/dd",
    "MMM dd, yyyy",
    "MMMM dd, yyyy",
    "MM-dd-yyyy HH:mm:ss",
    "dd-MM-yyyy HH:mm:ss",
    "MM-dd-yyyy hh:mm:ss a",
    "dd-MM-yyyy hh:mm:ss a",
    "yyyy-MM-dd HH:mm:ss",
    "yyyy-MM-dd hh:mm:ss a",
    "HH:mm:ss",
    "hh:mm:ss a",
  ];

  void printMessage(String message) {
    if (kDebugMode) {
      print(message);
    }
  }

  BizDateTime? formatMyDate(String date, String outputFormat) {
    BizDateTime? dateTime;

    for (var format in dateFormats) {
      try {
        var outputDate = DateFormat(outputFormat)
            .format(DateFormat(format).parseStrict(date));
        printMessage(outputDate);

        dateTime = BizDateTime(outputDate, format, null);
        break;
      } catch (e) {
        printMessage("Exception: $e");
        dateTime = BizDateTime(null, null, e.toString());
      }
    }
    return dateTime;
  }

  List<BizCountryTime> getCountryList() {
    List<BizCountryTime> list = [];
    List<BizCountryTime> finalList = [];
    list.add(BizCountryTime(
        null, "India - New Delhi", "GMT+5:30", null, null, null));
    list.add(BizCountryTime(null, "USA - Washington", "GMT-8:00", "13-03 02:00",
        "06-11 02:00", null));
    list.add(BizCountryTime(
        null, "UK - London", "GMT", "13-03 02:00", "06-11 02:00", null));
    list.add(BizCountryTime(null, "AUS - Canberra / Sydney", "GMT+11:00",
        "13-03 02:00", "06-11 02:00", null));
    list.add(BizCountryTime(null, "Germany - Berlin", "GMT+1:00", "13-03 02:00",
        "06-11 02:00", null));

    for (var element in list) {
      DateTime now = DateTime.now().toUtc();

      String gmt = element.gmt!;
      if (gmt.contains("+") || gmt.contains("-")) {
        List<String> offset = gmt.substring(4).split(":");

        if (gmt.contains("+")) {
          now.add(Duration(
              hours: int.parse(offset[0]), minutes: int.parse(offset[1])));
        } else {
          now.subtract(Duration(
              hours: int.parse(offset[0]), minutes: int.parse(offset[1])));
        }
      }
      // Duration timeZone = now.timeZoneOffset;

      element.time = DateFormat("dd MMM, yyyy hh:mm:ss a").format(now);
      finalList.add(element);
    }
    return finalList;
  }
}
