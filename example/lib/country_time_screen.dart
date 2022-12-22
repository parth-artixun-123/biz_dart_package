import 'dart:async';

import 'package:biz_date_time/biz_country_time.dart';
import 'package:biz_date_time/biz_date_time_utils.dart';
import 'package:flutter/material.dart';

class MeetingTimeScreen extends StatefulWidget {
  const MeetingTimeScreen({Key? key}) : super(key: key);

  @override
  State<MeetingTimeScreen> createState() => _MeetingTimeScreen();
}

class _MeetingTimeScreen extends State<MeetingTimeScreen> {
  List<BizCountryTime> list = [];
  BizDateTimeUtils myUtils = BizDateTimeUtils();

  @override
  void initState() {
    list = myUtils.getCountryTimeList();
    setState(() {});
    getCountryList();
  }

  void getCountryList()async{
    var duration = const Duration(seconds: 1);
    Timer(duration, () async {
      list = myUtils.getCountryTimeList();
      setState(() {});
      getCountryList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("DayLight Time Saving"),
        ),
        body: Container(
          margin: const EdgeInsets.all(16),
          child: list.isEmpty
              ? const Center(child: Text("No records!"))
              : ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, i) {
                    BizCountryTime item = list[i];
                    return Column(
                      children: [
                        ListTile(
                          title: Text(item.country.toString()),
                          subtitle: Text(item.time!),
                        ),
                        const Divider(), //
                      ],
                    );
                  }),
        ));
  }
}
