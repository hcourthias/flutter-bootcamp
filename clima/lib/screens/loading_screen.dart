import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../services/location.dart';
import '../services/networking.dart';
import '../services/weather.dart';
import '../services/weather.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    var data =  await WeatherModel().getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: data);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpinKitPulse(
        color: Colors.white,
        size: 50,
      ),
    );
  }
}
