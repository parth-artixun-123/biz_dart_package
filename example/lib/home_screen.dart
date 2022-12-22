import 'package:example/date_formatter_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'meeting_time_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Plugin Demo"),
        ),
        body: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (c) => DateFormatterScreen()));
                        },
                        child: Text("Date Formatter")),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (c) => CountryTimeScreen()));
                        },
                        child: Text("DayLight Time Saving")),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (c) => CountryTimeScreen()));
                        },
                        child: Text("Meeting Time")),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
