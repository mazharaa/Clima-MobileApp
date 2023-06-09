import 'package:clima/screens/city_screen.dart';
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
    setState(() {
      cityName = weatherData['name'];
      temp = weatherData['main']['temp'].toInt();
      weather = weatherData['weather'][0]['main'];
      icon = weatherData['weather'][0]['icon'];
      weatherDescription = weatherData['weather'][0]['description'];
      weatherMessage = weatherModel.getMessage(temp);
    });
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
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () async {
                          var weatherData = await weatherModel.getWeatherData();
                          updateUI(weatherData);
                        },
                        child: const Icon(
                          Icons.near_me,
                          size: 25,
                          color: Colors.white,
                        )
                      ),
                      TextButton(
                        onPressed: () async {
                          var typedName = await Navigator
                            .push(context, MaterialPageRoute(builder: (context) {
                              return const CityScreen();
                            }
                          ));

                          if(typedName != null) {
                            var data = await weatherModel
                              .getCityWeather(typedName);
                            updateUI(data);
                          }
                        },
                        child: const Icon(
                          Icons.location_city,
                          size: 25,
                          color: Colors.white,
                        )
                      )
                    ]
                  ),
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
                        'images/weather_icons/$icon@2x.png',
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
                      '$weatherMessage in $cityName',
                      style: const TextStyle(
                        fontSize: 20
                      ),
                    ),
                  )
                ],
              )
            ],
          )
        ),
      ),
    );
  }
}
