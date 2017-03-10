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

  List<int> _expandTimeExpression(String timeExp, CronField cronField) {
    List<int> ticks = [];

    List<String> segments = timeExp.split(',');

    for (String segment in segments) {

      if (timeExp == '*') {

        switch (cronField) {
          case CronField.second:
            second = new List().fillRange(0, 60);
            break;
        }
      }
      else if (match -) {

      }
      else {
        //TODO throw error if now an int
        ticks.add(segment);
      }
    }

    //TODO normalize
    return ticks;
  }

  getRange(start, stop, step) {
    
  }

  DateTime calculateNextTimeFromDate(DateTime dateTime) {

  }
}

// enum CronField {
//   second, minute, hour, dayOfMonth, month, dayOfWeek
// }

class CronField {
  final int fieldLength;
  final bool isOrdinal;

  const CronField(int this.fieldLength, [ bool this.isOrdinal = true ]);

  static const CronField second = const CronField(60);
  static const CronField minute = const CronField(60);
  static const CronField hour = const CronField(24);
  static const CronField dayOfMonth = const CronField(31, false);
  static const CronField month = const CronField(12);
  static const CronField dayOfWeek = const CronField(7, false);
}
