import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weatherapp/screens/location_screen.dart';
import 'package:weatherapp/services/location.dart';
import 'package:weatherapp/services/networking.dart';
import 'package:weatherapp/services/weather.dart';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  getLocation()async{
    var weatherData = await WeatherModel().getLocation();
    Navigator.push(context, MaterialPageRoute(builder: (context) => LocationScreen(
      weatherData: weatherData,
    )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
