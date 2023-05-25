//this function is for determine the date from the json file and categorize it either
//weekday or weekend

class WeekCategory {
  bool isWeekend(DateTime date) {
    return date.weekday == DateTime.saturday || date.weekday == DateTime.sunday;
  }

  bool isWeekday(DateTime date) {
    return !isWeekend(date);
  }
}
