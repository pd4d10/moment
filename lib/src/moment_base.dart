import 'package:intl/intl.dart';

enum Unit {
  second,
  minute,
  hour,
  day,
}

class Moment {
  int timestamp;
  Moment([dynamic input]) {
    if (input == null) {
      timestamp = DateTime.now().millisecondsSinceEpoch;
    } else if (input is int) {
      timestamp = input;
    } else if (input is String) {}
  }

  var mapper = {
    Unit.second: 1,
    Unit.minute: 60,
    Unit.hour: 3600,
    Unit.day: 86400,
  };

  Moment add(int count, Unit unit) {
    return Moment(timestamp + count * mapper[unit]);
  }

  Moment subtract(int count, Unit unit) {
    return Moment(timestamp - count * mapper[unit]);
  }

  Moment startOf(Unit unit) {
    return Moment(timestamp);
  }

  format(String pattern) {
    return DateFormat(pattern)
        .format(DateTime.fromMillisecondsSinceEpoch(timestamp));
  }
}
