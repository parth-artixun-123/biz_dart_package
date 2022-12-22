import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plugin_demo/biz_date_time.dart';
import 'package:plugin_demo/biz_date_time_utils.dart';

class DateFormatterScreen extends StatefulWidget {
  const DateFormatterScreen({Key? key}) : super(key: key);

  @override
  State<DateFormatterScreen> createState() => _DateFormatterScreenState();
}
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
  "E, dd MMM yyyy"
];

class _DateFormatterScreenState extends State<DateFormatterScreen> {
  TextEditingController dateController = TextEditingController();
  TextEditingController formatController = TextEditingController();
  String selectedFormat = dateFormats.first;
  BizDateTimeUtils utils = BizDateTimeUtils();
  BizDateTime? bizDateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Date Formatter"),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: dateController,
                decoration: const InputDecoration(hintText: "Enter raw date"),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  const Text("Output format: "),
                  DropdownButton(
                      value: selectedFormat,
                      items: dateFormats
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (item) {
                        setState(() {
                          selectedFormat = item.toString();
                        });
                      }),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              bizDateTime != null
                  ? bizDateTime!.exception != null
                  ? Text("Exception: ${bizDateTime!.exception}")
                  : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "Input date: ${dateController.value.text.toString()}"),
                  Text(
                      "Input date format: ${bizDateTime!.inputFormat!}"),
                  Text("Output date: ${bizDateTime!.date!}"),
                  Text("Output format: $selectedFormat"),
                ],
              )
                  : Container(),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () {
                    String date = dateController.value.text.toString();
                    bizDateTime = utils.formatMyDate(date, selectedFormat);
                    setState(() {});
                  },
                  child: const Text("Format"))
            ],
          ),
        ),
      ),
    );
  }
}
