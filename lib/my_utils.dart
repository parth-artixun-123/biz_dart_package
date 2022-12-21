library plugin_demo;

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:plugin_demo/biz_date_time.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
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
    tz.initializeTimeZones();
    final DateTime now = DateTime.now();

    final pacificTimeZone = tz.getLocation('America/Los_Angeles');

    tz.TZDateTime.from(now, pacificTimeZone);

    List<BizCountryTime> list = [];
    list.add(BizCountryTime(null, "India", "+5:30", null, null));
    list.add(BizCountryTime(
        null, "USA - Washington", "GMT-8", "13-03 02:00", "06-11 02:00"));
    list.add(BizCountryTime(
        null, "UK - London", "GMT", "13-03 02:00", "06-11 02:00"));
    list.add(BizCountryTime(null, "AUS - Canberra / Sydney", "GMT+11",
        "13-03 02:00", "06-11 02:00"));
    list.add(BizCountryTime(
        null, "Germany - Berlin", "GMT+1", "13-03 02:00", "06-11 02:00"));

    for (var element in list) {
      BizCountryTime countryTime = element;
      DateTime now = DateTime.now();
      Duration timeZone = now.timeZoneOffset;

      String s = "Jinali";
    }
    return list;
  }
}
