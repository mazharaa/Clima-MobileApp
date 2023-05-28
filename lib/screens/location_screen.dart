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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_background.jpg'),
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
                  widget.data['name'],
                  style: const TextStyle(
                      fontSize: 30
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  '${(widget.data['main']['temp'] - 273.15).floor()}\u2103',
                  style: const TextStyle(
                      fontSize: 70
                  ),
                ),
              ),
              Text(
                '${widget.data['weather'][0]['main']}',
                style: const TextStyle(
                    fontSize: 20
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}
