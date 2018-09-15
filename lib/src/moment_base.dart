import 'package:intl/intl.dart';

enum MomentUnit {
  year,
  quarter,
  month,
  week,
  day,
  hour,
  minute,
  second,
  millisecond,
  microsecond,
}

class Moment {
  static int monthPerQuarter = 3;

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

  int get startMonthOfQuarter => _dateTime.month - ((_dateTime.month - 1) % 3);
  int get startDayOfWeek => _dateTime.day - _dateTime.weekday + 1;

  Moment startOf(MomentUnit unit) {
    DateTime dateTime;
    switch (unit) {
      case MomentUnit.year:
        dateTime = DateTime(_dateTime.year);
        break;
      case MomentUnit.quarter:
        dateTime = DateTime(_dateTime.year, startMonthOfQuarter);
        break;
      case MomentUnit.month:
        dateTime = DateTime(_dateTime.year, _dateTime.month);
        break;
      case MomentUnit.week:
        dateTime =
            DateTime(_dateTime.year, startDayOfWeek + DateTime.daysPerWeek);
        break;
      case MomentUnit.day:
        dateTime = DateTime(_dateTime.year, _dateTime.month, _dateTime.day);
        break;
      case MomentUnit.hour:
        dateTime = DateTime(
            _dateTime.year, _dateTime.month, _dateTime.day, _dateTime.hour);
        break;
      case MomentUnit.minute:
        dateTime = DateTime(_dateTime.year, _dateTime.month, _dateTime.day,
            _dateTime.hour, _dateTime.minute);
        break;
      case MomentUnit.second:
        dateTime = DateTime(_dateTime.year, _dateTime.month, _dateTime.day,
            _dateTime.hour, _dateTime.minute, _dateTime.second);
        break;
      case MomentUnit.millisecond:
        dateTime = DateTime(
            _dateTime.year,
            _dateTime.month,
            _dateTime.day,
            _dateTime.hour,
            _dateTime.minute,
            _dateTime.second,
            _dateTime.millisecond);
        break;
      default:
        return this;
    }
    return Moment(dateTime);
  }

  Moment endOf(MomentUnit unit) {
    DateTime dateTime;
    switch (unit) {
      case MomentUnit.year:
        dateTime = DateTime(_dateTime.year + 1);
        break;
      case MomentUnit.quarter:
        dateTime =
            DateTime(_dateTime.year, startMonthOfQuarter + monthPerQuarter);
        break;
      case MomentUnit.month:
        dateTime = DateTime(_dateTime.year, _dateTime.month + 1);
        break;
      case MomentUnit.week:
        dateTime =
            DateTime(_dateTime.year, startDayOfWeek + DateTime.daysPerWeek);
        break;
      case MomentUnit.day:
        dateTime = DateTime(_dateTime.year, _dateTime.month, _dateTime.day + 1);
        break;
      case MomentUnit.hour:
        dateTime = DateTime(
            _dateTime.year, _dateTime.month, _dateTime.day, _dateTime.hour + 1);
        break;
      case MomentUnit.minute:
        dateTime = DateTime(_dateTime.year, _dateTime.month, _dateTime.day,
            _dateTime.hour, _dateTime.minute + 1);
        break;
      case MomentUnit.second:
        dateTime = DateTime(_dateTime.year, _dateTime.month, _dateTime.day,
            _dateTime.hour, _dateTime.minute, _dateTime.second + 1);
        break;
      case MomentUnit.millisecond:
        dateTime = DateTime(
            _dateTime.year,
            _dateTime.month,
            _dateTime.day,
            _dateTime.hour,
            _dateTime.minute,
            _dateTime.second,
            _dateTime.millisecond + 1);
        break;
      default:
        return this;
    }
    return Moment(dateTime).subtract(microseconds: 1);
  }

  String format(String pattern) {
    return DateFormat(pattern).format(_dateTime);
  }
}
