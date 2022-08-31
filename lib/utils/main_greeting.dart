import 'times_of_day.dart';

String getMainGreeting() {
  String afternoonGreeting = 'Добрый день!';

  var mapperTimesOfDay = <String, String>{
    morning: 'Доброе утро!',
    afternoon: afternoonGreeting,
    evening: 'Добрый вечер!',
    night: 'Доброй ночи'
  };

  return mapperTimesOfDay[getCurrentTimesOfDay()] ?? afternoonGreeting;
}
