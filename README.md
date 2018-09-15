# Moment for Dart

Parse, validate, manipulate, and display dates in Dart, with similar API to [momentjs](https://github.com/moment/moment)

## Usage

```dart
import 'package:moment/moment.dart';

main() {
  Moment.now();

  var m = Moment('2018-09-15 16:28:58Z');
  // Get
  m.year; // 2018
  m.quarter; // 3
  m.month; // 9
  m.day; // 15
  m.weekday; // 6 (Saturday)
  m.hour; // 16
  m.minute; // 28
  m.second; // 58

  // Manipulate
  m.add(years: 1, quarters: 2, months: 3);
  m.subtract(weeks: 1, days: 2, hours: 3);

  m.startOf(MomentUnit.year); // Start of the year
  m.startOf(MomentUnit.week); // Start of the week

  // Display
  m.format('yyyy-MM-dd');
}
```

## License

MIT
