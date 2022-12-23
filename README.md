<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

This package is useful for easily date formatting and DayLight saving time.
## Features

Provides a current time of different countries based on the user's phone locale with "Daylight saving time".
Calculation of the meeting date and time based on the local meeting time chosen by the user.

## Getting started


## Usage

Integrate plugin in pubspec.yaml

```yaml
biz_date_time:
git:
url: https://github.com/ms-biztech/biz_dart_package
```

Format Date
```dart
BizDateTimeUtils myUtils = BizDateTimeUtils();
BizDateTime bizDateTime = utils.formatMyDate("22-12-2022", "dd MMM, yyyy");

```

Get current time of different countries
```dart
List<BizCountryTime> list = myUtils.getCountryTimeList();
```

Calculation of the meeting date and time
```dart
List<BizCountryTime> list = myUtils.getCountryTimeList(selectedDateTime);
```

## Additional information

This plugin is developed for the easy date formatting purpose.
