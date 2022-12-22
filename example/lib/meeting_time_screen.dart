import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:plugin_demo/biz_country_time.dart';
import 'package:plugin_demo/biz_date_time_utils.dart';

class CountryTimeScreen extends StatefulWidget {
  const CountryTimeScreen({Key? key}) : super(key: key);

  @override
  State<CountryTimeScreen> createState() => _CountryTimeScreenState();
}

class _CountryTimeScreenState extends State<CountryTimeScreen> {
  List<BizCountryTime> list = [];
  BizDateTimeUtils myUtils = BizDateTimeUtils();

  @override
  void initState() {
    list = myUtils.getCountryTimeList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Meeting Time"),
          actions: [
            IconButton(
                onPressed: () {
                  DatePicker.showDateTimePicker(
                    context,
                    showTitleActions: true,
                    onChanged: (date) {},
                    onConfirm: (date) {
                      list = myUtils.getCountryTimeList(dateAndTime: date);
                      setState(() {});

                      print('confirm $date');
                    },
                    currentTime: DateTime.now(),
                  );
                },
                icon: const Icon(Icons.calendar_month))
          ],
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
