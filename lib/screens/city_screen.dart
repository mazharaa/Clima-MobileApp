import 'package:clima/utilities/conatant.dart';
import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'images/background_images/city_background.jpg'
            ),
            fit: BoxFit.cover,
          )
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: FractionalOffset.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )
                ),
              ),
              const SizedBox(
                width: 370,
                child: TextField(
                  decoration: kTextFieldInputDecoration,
                  style: TextStyle(
                    color: Colors.black
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {

                },
                child: const Text('Get Weather')
              )
            ],
          )
        ),
      ),
    );
  }
}
