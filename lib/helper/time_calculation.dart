void main(List<String> args) {
  print(
      TimeCalculationHelper.getTime(DateTime.parse('2018-12-20 19:32:44.364'), 1));
  // print(
  //     TimeCalculationHelper.getTime(DateTime.parse('2019-12-31 19:32:44.364')));
  // print(
  //     TimeCalculationHelper.getTime(DateTime.parse('2019-12-20 19:32:44.364')));
  // print(
  //     TimeCalculationHelper.getTime(DateTime.parse('2020-03-31 23:32:44.364')));
  // print(
  //     TimeCalculationHelper.getTime(DateTime.now()));
}

class TimeCalculationHelper {
  static int _getLastDayOfMonth(int month, int year) {
    if (month == 2) {
      if (year % 4 == 0) {
        return 29;
      } else {
        return 28;
      }
    } else if ([1, 3, 5, 7, 8, 10, 12].indexOf(month) >= 0) {
      return 31;
    } else {
      return 30;
    }
  }

  static String getTime(DateTime time, int depth) {
    String returnTime = '';
    DateTime now = DateTime.now();
    Map<TimeProperty, int> map = Map();
    int cnt = 0;
    print(TimeProperty.values.length);
    print(map.entries.length);
    while (map.entries.length != TimeProperty.values.length) {
      DateTime calc =
          _addTime(time, 1, TimeProperty.values.elementAt(map.entries.length));
      print('--------------- Calculated Time ---------------------');
      print(calc);
      if (calc.compareTo(now) <= 0) {
        cnt = cnt + 1;
        time = calc;
      } else {
        map[TimeProperty.values.elementAt(map.entries.length)] = cnt;
        cnt = 0;
      }
    }
    cnt = 0;
    for (int i = 0; i < TimeProperty.values.length; i++) {
      int value = map[TimeProperty.values.elementAt(i)];
      if (value > 0) {
        returnTime += value.toString() +
            ' ' +
            nameMap[TimeProperty.values.elementAt(i)] +
            (value > 1 ? 's' : '') +
            ' ';
        cnt++;
      }
      if (cnt == depth) {
        break;
      }
    }
    if (cnt == 0) {
      returnTime = 'now';
    }
    return returnTime;
  }

  static DateTime _addTime(DateTime time, int count, TimeProperty property) {
    DateTime returnTime;
    switch (property) {
      case TimeProperty.minute:
        {
          if (time.minute == 59) {
            returnTime = _addTime(
              DateTime(
                time.year,
                time.month,
                time.day,
                time.hour,
                0,
                time.second,
                time.millisecond,
                time.microsecond,
              ),
              1,
              TimeProperty.hour,
            );
          } else {
            returnTime = DateTime(
              time.year,
              time.month,
              time.day,
              time.hour,
              time.minute + 1,
              time.second,
              time.millisecond,
              time.microsecond,
            );
          }
          break;
        }
      case TimeProperty.hour:
        {
          if (time.hour == 23) {
            returnTime = _addTime(
              DateTime(
                time.year,
                time.month,
                time.day,
                0,
                time.minute,
                time.second,
                time.millisecond,
                time.microsecond,
              ),
              1,
              TimeProperty.day,
            );
          } else {
            returnTime = DateTime(
              time.year,
              time.month,
              time.day,
              time.hour + 1,
              time.minute,
              time.second,
              time.millisecond,
              time.microsecond,
            );
          }
          break;
        }
      case TimeProperty.day:
        {
          if (time.day == _getLastDayOfMonth(time.month, time.year)) {
            returnTime = _addTime(
              DateTime(
                time.year,
                time.month,
                1,
                time.hour,
                time.minute,
                time.second,
                time.millisecond,
                time.microsecond,
              ),
              1,
              TimeProperty.month,
            );
          } else {
            returnTime = DateTime(
              time.year,
              time.month,
              time.day + 1,
              time.hour,
              time.minute,
              time.second,
              time.millisecond,
              time.microsecond,
            );
          }
          break;
        }
      case TimeProperty.week:
        {
          returnTime = time;
          for (int i = 0; i < 7; i++) {
            returnTime = _addTime(returnTime, 1, TimeProperty.day);
          }
          break;
        }
      case TimeProperty.month:
        {
          bool isLast = _getLastDayOfMonth(time.month, time.year) == time.day;
          if (time.month == 12) {
            int lastDay = _getLastDayOfMonth(1, time.year);
            returnTime = _addTime(
              DateTime(
                time.year,
                1,
                isLast ? lastDay : (time.day > lastDay ? lastDay : time.day),
                time.hour,
                time.minute,
                time.second,
                time.millisecond,
                time.microsecond,
              ),
              1,
              TimeProperty.year,
            );
          } else {
            int lastDay = _getLastDayOfMonth(time.month + 1, time.year);
            returnTime = DateTime(
              time.year,
              time.month + 1,
              isLast ? lastDay : (time.day > lastDay ? lastDay : time.day),
              time.hour,
              time.minute,
              time.second,
              time.millisecond,
              time.microsecond,
            );
          }
          break;
        }
      case TimeProperty.year:
        {
          bool isLast = _getLastDayOfMonth(time.month, time.year) == time.day;
          int lastDay = _getLastDayOfMonth(time.month, time.year + 1);
          returnTime = DateTime(
            time.year + 1,
            time.month,
            isLast ? lastDay : (time.day > lastDay ? lastDay : time.day),
            time.hour,
            time.minute,
            time.second,
            time.millisecond,
            time.microsecond,
          );
          break;
        }
    }
    return returnTime;
  }
}

enum TimeProperty { year, month, week, day, hour, minute }
Map<TimeProperty, String> nameMap = {
  TimeProperty.year: 'year',
  TimeProperty.month: 'month',
  TimeProperty.week: 'week',
  TimeProperty.day: 'day',
  TimeProperty.hour: 'hour',
  TimeProperty.minute: 'minute',
};
