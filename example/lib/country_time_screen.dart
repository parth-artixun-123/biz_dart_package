import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plugin_demo/biz_country_time.dart';
import 'package:plugin_demo/my_utils.dart';

class CountryTimeScreen extends StatefulWidget {
  const CountryTimeScreen({Key? key}) : super(key: key);

  @override
  State<CountryTimeScreen> createState() => _CountryTimeScreenState();
}

class _CountryTimeScreenState extends State<CountryTimeScreen> {
  List<BizCountryTime> list = [];
  MyUtils myUtils = MyUtils();

  @override
  void initState() {
    list = myUtils.getCountryList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("DayLight Time Saving"),
        ),
        body: Container(
          margin: EdgeInsets.all(16),
          child: list.isEmpty
              ? Center(child: Text("No records!"))
              : ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, i) {
                    BizCountryTime item = list[i];
                    return Column(
                      children: [
                        ListTile(
                          title: Text(item.country.toString()),
                        ),
                        Divider(), //
                      ],
                    );
                  }),
        ));
  }
}
