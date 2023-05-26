import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';

const apiKey = 'c672bd1a234c427255af727c3375e9bc';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            getLocation();
          },
          child: const Text('Get Location')
        ),
      ),
    );
  }
}

// double temp = jsonDecode(data)['main']['temp'];
// int id = jsonDecode(data)['weather'][0]['id'];
// String name = jsonDecode(data)['name'];