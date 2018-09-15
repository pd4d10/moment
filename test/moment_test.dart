import 'package:moment/moment.dart';
import 'package:test/test.dart';

void main() {
  group('moment', () {
    Moment m;

    setUp(() {
      m = Moment('2018-09-15 16:28:58Z');
    });

    test('getter', () {
      expect(m.year, 2018);
      expect(m.quarter, 3);
      expect(m.month, 9);
      expect(m.day, 15);
      expect(m.weekday, 6);
      expect(m.hour, 16);
      expect(m.minute, 28);
      expect(m.second, 58);
    });

    test('add', () {
      expect(m.add(years: 1).year, 2019);
      expect(m.add(years: 1).month, 9);

      expect(m.add(quarters: 1).quarter, 4);
      expect(m.add(quarters: 1).month, 12);
      expect(m.add(quarters: 1).day, 15);

      expect(m.add(months: 1).month, 10);
      expect(m.add(months: 1).day, 15);

      expect(m.add(weeks: 1).day, 22);
      expect(m.add(weeks: 1).weekday, 6);

      expect(m.add(days: 1).day, 16);
      expect(m.add(days: 1).hour, 16);

      expect(m.add(hours: 1).hour, 17);
      expect(m.add(minutes: 1).minute, 29);
      expect(m.add(seconds: 1).second, 59);
    });

    test('subtract', () {
      expect(m.subtract(years: 1).year, 2017);
      expect(m.subtract(years: 1).month, 9);

      expect(m.subtract(quarters: 1).quarter, 2);
      expect(m.subtract(quarters: 1).month, 6);
      expect(m.subtract(quarters: 1).day, 15);

      expect(m.subtract(months: 1).month, 8);
      expect(m.subtract(months: 1).day, 15);

      expect(m.subtract(weeks: 1).day, 8);
      expect(m.subtract(weeks: 1).weekday, 6);

      expect(m.subtract(days: 1).day, 14);
      expect(m.subtract(days: 1).hour, 16);

      expect(m.subtract(hours: 1).hour, 15);
      expect(m.subtract(minutes: 1).minute, 27);
      expect(m.subtract(seconds: 1).second, 57);
    });

    test('format', () {
      expect(m.format('yyyy-MM-dd'), '2018-09-15');
    });
  });
}
