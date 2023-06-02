import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/utilities/config.dart';

const apiKey = weatherApiKey;
const urlMap = 'https://api.openweathermap.org/data/2.5/weather?';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networking = NetworkHelper(
      '${urlMap}q=$cityName&appid=$apiKey&units=metric'
    );

    var weatherData = await networking.getData();

    return weatherData;
  }

  Future<dynamic> getWeatherData() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networking = NetworkHelper(
      '${urlMap}lat=${location.latitude}'
        '&lon=${location.longitude}&appid=$apiKey&units=metric'
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