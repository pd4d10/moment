import 'package:moment/moment.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    // Awesome awesome;

    setUp(() {
      // awesome = new Awesome();
    });

    test('First Test', () {
      expect(Moment().format('yyyy-MM-dd'), '2018-09-08');
    });
  });
}
