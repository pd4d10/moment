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

  Moment.fromDateTime(this._dateTime);

  Moment(String pattern) {
    _dateTime = DateTime.parse(pattern);
  }

  Moment.now() {
    _dateTime = DateTime.now();
  }

  Moment.fromSeconds(int seconds) {
    _dateTime = DateTime.fromMillisecondsSinceEpoch(
        seconds * Duration.millisecondsPerSecond);
  }

  Moment.fromMilliseconds(int milliseconds) {
    _dateTime = DateTime.fromMillisecondsSinceEpoch(milliseconds);
  }

  Moment.fromMicroseconds(int microseconds) {
    _dateTime = DateTime.fromMicrosecondsSinceEpoch(microseconds);
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
        _dateTime.month + months + quarters * monthPerQuarter,
        _dateTime.day + days + weeks * DateTime.daysPerWeek,
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
        _dateTime.month - months - quarters * monthPerQuarter,
        _dateTime.day - days - weeks * DateTime.daysPerWeek,
        _dateTime.hour - hours,
        _dateTime.minute - minutes,
        _dateTime.second - seconds,
        _dateTime.millisecond - milliseconds,
        _dateTime.microsecond - microseconds);
    return Moment.fromDateTime(dateTime);
  }

  int get startMonthOfQuarter => _dateTime.month - ((_dateTime.month - 1) % 3);
  DateTime get firstDayOfTheweek =>
      _dateTime.subtract(new Duration(days: _dateTime.weekday));

  DateTime startOfAsDateTime(MomentUnit unit) {
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
        dateTime = DateTime(firstDayOfTheweek.year, firstDayOfTheweek.month,
            firstDayOfTheweek.day + 1);
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
        return dateTime;
    }
    return dateTime;
  }

  DateTime endOfAsDateTime(MomentUnit unit) {
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
        dateTime = DateTime(firstDayOfTheweek.year, firstDayOfTheweek.month,
                firstDayOfTheweek.day + 1)
            .add(Duration(days: 7));
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
        return dateTime;
    }
    return dateTime;
  }

  Moment startOf(MomentUnit unit) {
    DateTime dateTime = startOfAsDateTime(unit);
    return Moment.fromDateTime(dateTime);
  }

  Moment endOf(MomentUnit unit) {
    DateTime dateTime = endOfAsDateTime(unit);
    return Moment.fromDateTime(dateTime).subtract(microseconds: 1);
  }

  String format(String pattern) {
    return DateFormat(pattern).format(_dateTime);
  }

  /// The year
  int get year => _dateTime.year;

  /// The quarter
  int get quarter => (_dateTime.month - 1) ~/ 3 + 1;

  /// The month
  int get month => _dateTime.month;

  /// The day of the month
  int get day => _dateTime.day;

  /// The day of the week
  int get weekday => _dateTime.weekday;

  /// TODO: The day of the year
  // int get dayOfYear {
  //   return 0;
  // }

  /// The hour of the day
  int get hour => _dateTime.hour;

  /// The minute
  int get minute => _dateTime.minute;

  /// The second
  int get second => _dateTime.second;

  /// The millisecond
  int get millisecond => _dateTime.millisecond;

  /// The microsecond
  int get microsecond => _dateTime.microsecond;
}
