class WeatherModel {
  String getMessage (int temp) {
    if (temp > 25) {
      return 'It\'s ice cream time!';
    } else if (temp > 20) {
      return 'Time for short and t-shirt';
    } else if (temp < 10) {
      return 'You\'l need jacket and gloves';
    } else {
      return 'Bring a coat just in case';
    }
  }
}