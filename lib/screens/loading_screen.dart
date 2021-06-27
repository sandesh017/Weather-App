import 'package:flutter/material.dart';
import 'package:weather/services/location.dart';
import 'package:weather/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/screens/location_screen.dart';

const apiKey = '14da22e0adab29cbf88c2609c539a770';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper locationData = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await locationData.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(weatherData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.amberAccent,
        ),
      ),
    );
  }
}
