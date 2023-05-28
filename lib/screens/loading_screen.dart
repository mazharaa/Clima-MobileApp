import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    var weatherData = await WeatherModel().getWeatherData();

    double temp = weatherData['main']['temp'];
    int id = weatherData['weather'][0]['id'];
    String city = weatherData['name'];

    print('temp = $temp');
    print('id = $id');
    print('city = $city');
    print(weatherData);
    
    if(mounted) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LocationScreen(data: weatherData,);
        }
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
