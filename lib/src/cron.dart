import 'dart:developer' as dev;

class Cron {
  List<int> second;
  List<int> minute;
  List<int> hour;
  List<int> dayOfMonth;
  List<int> month;
  List<int> dayOfWeek;

  Cron.parse(String cronExpression) {
    List<String> timeExpressions = cronExpression.split(' ');

    second = _expandTimeExpression(timeExpressions[0], CronField.second);
    minute = _expandTimeExpression(timeExpressions[1], CronField.minute);
    hour = _expandTimeExpression(timeExpressions[2], CronField.hour);
    dayOfMonth = _expandTimeExpression(timeExpressions[3], CronField.dayOfMonth);
    month = _expandTimeExpression(timeExpressions[4], CronField.month);
    dayOfWeek = _expandTimeExpression(timeExpressions[5], CronField.dayOfWeek);
  }

  DateTime calculateNextTimeFromDate(DateTime dateTime) {

  }
}

_getRange(start, stop, [step = 1]) {
  List<int> range = [];
  
  for (int i = 0; i < stop; i += step) {
    
    if (i >= start) {
      range.add(i);
    }
  }
  return range;
}

List<int> _expandTimeExpression(String timeExp, CronField cronField) {
  List<int> ticks = [];
  List<String> segments = timeExp.split(',');

  for (String segment in segments) {
    Match segmentMatch = new RegExp(r'(\*|\d+-\d+)(/\d+)?')
    .firstMatch(segment);

    if (segmentMatch != null && segmentMatch.groupCount > 0) {
      // If segment is a range
      String rangeExp = segmentMatch.group(1);
      String stepExp = segmentMatch.group(2)?.replaceFirst('/', '');
      
      int step = (stepExp != null ? int.parse(stepExp) : 1);
      
      // Default to full length
      int start = cronField.start;
      int stop = cronField.stop;
      
      if (rangeExp != '*') {
        List<String> stops = rangeExp.split('-');
        
        start = int.parse(stops[0]);
        stop = int.parse(stops[1]);
      }
      ticks.addAll(_getRange(start, stop, step));
    }
    else if (new RegExp(r'\d+').hasMatch(segment)) {
      // If segment is just an int
      ticks.add(int.parse(segment));
    }
    else {
      throw new Exception('Invalid ${cronField.name} expression: ${timeExp}');
    }
  }

  ticks.removeWhere((int tick) => ticks.contains(tick));
  ticks.sort();
  
  return ticks;
}

class CronField {
  final Field field;
  final int start;
  final int stop;

  const CronField(Field this.field, int this.start, int this.stop);

  static const CronField second = const CronField('SECOND', 0, 59);
  static const CronField minute = const CronField('MINUTE', 0, 59);
  static const CronField hour = const CronField('HOUR', 0, 23);
  static const CronField dayOfMonth = const CronField('DAY OF MONTH', 1, 31);
  static const CronField month = const CronField('MONTH', 0, 11);
  static const CronField dayOfWeek = const CronField('DAY OF WEEK', 1, 7);
}

enum Field {
  second,
  minute,
  hour,
  dayOfMonth,
  month,
  dayOfWeek
}
