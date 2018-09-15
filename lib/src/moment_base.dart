import 'package:intl/intl.dart';

enum MomentUnit {
  second,
  minute,
  hour,
  day,
}

class Moment {
  DateTime _dateTime;

  Moment([dynamic input]) {
    if (input == null) {
      Moment.fromDateTime(DateTime.now());
    } else if (input is int) {
      Moment.fromMilliseconds(input);
    } else if (input is String) {
      Moment.fromDateTime(DateTime.parse(input));
    }
  }

  Moment.fromDateTime(this._dateTime);

  Moment.fromMicroseconds(int microseconds) {
    _dateTime = DateTime.fromMillisecondsSinceEpoch(microseconds);
  }

  Moment.fromMilliseconds(int milliseconds) {
    _dateTime = DateTime.fromMillisecondsSinceEpoch(milliseconds);
  }

  // var mapper = {
  //   MomentUnit.second: Duration.millisecondsPerSecond,
  //   MomentUnit.minute: Duration.millisecondsPerMinute,
  //   MomentUnit.hour: Duration.millisecondsPerHour,
  //   MomentUnit.day: Duration.millisecondsPerDay
  // };

  Moment add(
      {int years: 0,
      int quarters: 0,
      int months: 0,
      int weeks: 0,
      int days: 0,
      int hours: 0,
      int minutes: 0,
      int seconds: 0,
      int milliseconds: 0,
      int microseconds: 0}) {
    var dateTime = DateTime(
        _dateTime.year + years,
        _dateTime.month + months,
        _dateTime.day + days,
        _dateTime.hour + hours,
        _dateTime.minute + minutes,
        _dateTime.second + seconds,
        _dateTime.millisecond + milliseconds,
        _dateTime.microsecond + microseconds);
    return Moment.fromDateTime(dateTime);
  }

  Moment subtract(
      {int years: 0,
      int quarters: 0,
      int months: 0,
      int weeks: 0,
      int days: 0,
      int hours: 0,
      int minutes: 0,
      int seconds: 0,
      int milliseconds: 0,
      int microseconds: 0}) {
    var dateTime = DateTime(
        _dateTime.year - years,
        _dateTime.month - months,
        _dateTime.day - days,
        _dateTime.hour - hours,
        _dateTime.minute - minutes,
        _dateTime.second - seconds,
        _dateTime.millisecond - milliseconds,
        _dateTime.microsecond - microseconds);
    return Moment.fromDateTime(dateTime);
  }

  String format(String pattern) {
    return DateFormat(pattern).format(_dateTime);
  }
}
