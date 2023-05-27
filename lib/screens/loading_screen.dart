import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/utilities/config.dart';

const apiKey = weatherApiKey;

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  var lat;
  var lon;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    lat = location.latitude;
    lon = location.longitude;
    print(lat);
    print(lon);

    NetworkHelper networking = NetworkHelper(
      'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&'
          'appid=$apiKey'
    );

    var weatherData = await networking.getData();

    double temp = weatherData['main']['temp'];
    int id = weatherData['weather'][0]['id'];
    String city = weatherData['name'];

    print('temp = $temp');
    print('id = $id');
    print('city = $city');
    
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen();
    }));
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

// double temp = jsonDecode(data)['main']['temp'];
// int id = jsonDecode(data)['weather'][0]['id'];
// String name = jsonDecode(data)['name'];