import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/utilities/config.dart';

const apiKey = weatherApiKey  ;

class WeatherModel {
  Future<dynamic> getWeatherData() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networking = NetworkHelper(
      'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}'
        '&lon=${location.longitude}&appid=$apiKey'
    );

    var weatherData = await networking.getData();

    return weatherData;
  }

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