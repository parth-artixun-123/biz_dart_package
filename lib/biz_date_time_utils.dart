library plugin_demo;

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:plugin_demo/biz_date_time.dart';

import 'biz_country_time.dart';

class BizDateTimeUtils {
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

  //

  List<BizCountryTime> getCountryTimeList({DateTime? dateAndTime}) {
    List<BizCountryTime> list = [];
    List<BizCountryTime> finalList = [];
    list.add(BizCountryTime("India - New Delhi", "GMT+5:30", null, null, null));
    list.add(BizCountryTime(
        "USA - Washington", "GMT-8:00", "12-03 02:00", "05-11 02:00", null));
    list.add(BizCountryTime(
        "UK - London", "GMT", "26-03 02:00", "29-10 02:00", null));
    list.add(BizCountryTime("AUS - Canberra / Sydney", "GMT+11:00",
        "01-10 02:00", "02-04 02:00", null));
    list.add(BizCountryTime(
        "Germany - Berlin", "GMT+1:00", "27-03 02:00", "30-10 02:00", null));
    list.add(BizCountryTime(
        "New Mexico", "GMT-7:00", "27-03 02:00", "30-10 02:00", null));

    for (var element in list) {
      DateTime now = DateTime.now().toUtc();
      if (dateAndTime != null) {
        now = dateAndTime.toUtc();
      }

      String gmt = element.gmt!;
      if (gmt.contains("+") || gmt.contains("-")) {
        List<String> offset = gmt.substring(4).split(":");

        if (gmt.contains("+")) {
          now = now.add(Duration(
              hours: int.parse(offset[0]), minutes: int.parse(offset[1])));
        } else {
          now = now.subtract(Duration(
              hours: int.parse(offset[0]), minutes: int.parse(offset[1])));
        }

        if (element.dstStart != null) {
          DateTime today = DateTime.now();
          String tempDstStart = "${element.dstStart} ${today.year}";
          String tempDstEnd = "${element.dstEnd} ${today.year}";

          DateTime dstStart =
              DateFormat("dd-MM HH:mm yyyy").parse(tempDstStart);

          DateTime dstEnd = DateFormat("dd-MM HH:mm yyyy").parse(tempDstEnd);

          if (today.isAfter(dstStart) && today.isBefore(dstEnd)) {
            now = now.add(const Duration(hours: 1));
          }
        }
      }

      element.time = DateFormat("dd MMM, yyyy hh:mm:ss a").format(now);
      finalList.add(element);
    }
    return finalList;
  }
}
