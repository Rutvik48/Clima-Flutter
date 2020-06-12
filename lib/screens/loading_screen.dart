import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location_screen.dart';

const apiOpenWeatherKey = 'ddbb2d50e0ddf43adfb4307430f32fe8';

class LoadingScreen extends StatefulWidget {

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double latitude;
  double longitude;

  void getLocation() async {

    Location location = Location();
    await location.getLocation();

    latitude = location.latitude;
    longitude = location.longitude;

    Networking networking = Networking(url: 'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiOpenWeatherKey&units=metric');
    var weatherData = await networking.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: weatherData,);
    }));

    print('call completed');
  }

  //initStat gets called only one time and first one to being called when StatefulWidget is created.
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  //build is called second, and every time widget re-build in StatefulWidget lifecycle
  @override
  Widget build(BuildContext context) {
    //getData();
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );

  }

  //deactivate is the last method to being called in StatefulWidget lifecycle
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();

  }
}
