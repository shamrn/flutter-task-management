import 'times_of_day.dart';

String getMainImage() {
  String pathToImages = 'assets/images';
  String afternoonImage = '$pathToImages/main-page-afternoon.webp';

  var mapperTimesOfDay = <String, String>{
    morning: '$pathToImages/main-page-morning.webp',
    afternoon: afternoonImage,
    evening: '$pathToImages/main-page-evening.webp',
    night: '$pathToImages/main-page-night.webp'
  };

  return mapperTimesOfDay[getCurrentTimesOfDay()] ?? afternoonImage;
}
