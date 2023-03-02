import 'package:timezone/standalone.dart' as tz;

final _localTimeZone = tz.getLocation('America/Sao_Paulo');

DateTime convertTz(DateTime date) {
  final tZDateTime = tz.TZDateTime.from(date, _localTimeZone);

  return tZDateTime;
}
