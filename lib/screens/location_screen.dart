import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({
    Key? key,
    required this.data
  }) : super(key: key);

  final dynamic data;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  late String cityName;
  late int temp;
  late String weather;
  late String icon;
  late String weatherDescription;
  late String weatherMessage;

  @override
  void initState() {
    super.initState();
    updateUI(widget.data);
  }

  void updateUI(dynamic weatherData) {
    cityName = weatherData['name'];
    temp = weatherData['main']['temp'].toInt() - 273;
    weather = weatherData['weather'][0]['main'];
    icon = weatherData['weather'][0]['icon'];
    weatherDescription = weatherData['weather'][0]['description'];
    weatherMessage = weatherModel.getMessage(temp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage(
              'images/background_images/location_background.jpg'
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.8), BlendMode.dstATop
            )
          )
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsetsDirectional.only(top: 100),
                child: Text(
                  cityName,
                  style: const TextStyle(
                    fontSize: 30
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  '$temp\u2103',
                  style: const TextStyle(
                    fontSize: 70
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$weather ',
                    style: const TextStyle(
                      fontSize: 20
                    ),
                  ),
                  Image.asset(
                    'images/weather_icons/'
                      '$icon@2x.png',
                    scale: 3,
                  )
                ]
              ),
              Text(
                weatherDescription,
                style: const TextStyle(
                  fontSize: 13
                ),
              ),
              Container(
                margin: const EdgeInsetsDirectional.only(top: 200),
                child: Text(
                  weatherMessage,
                  style: const TextStyle(
                    fontSize: 20
                  ),
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}
