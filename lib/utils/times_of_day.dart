const String morning = 'morning';
const String afternoon = 'afternoon';
const String evening = 'evening';
const String night = 'night';

String getCurrentTimesOfDay() {

  return evening; // mock

  int currentHour = DateTime.now().hour;
  if (currentHour <= 11) {
    return morning;
  } else if ((currentHour > 11) && (currentHour <= 16)) {
    return afternoon;
  } else if ((currentHour > 16) && (currentHour < 20)) {
    return evening;
  } else {
    return night;
  }
}
