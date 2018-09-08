import 'package:moment/moment.dart';

main() {
  // Parsing
  Moment().add(1, Unit.day);
  Moment().subtract(2, Unit.day);

  // Formatting
  Moment().format('yyyy-MM-dd');
}
