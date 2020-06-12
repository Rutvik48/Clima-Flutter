import 'dart:math';

import 'package:clima/screens/loading_screen.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;
  int counter = 0;

  Future<void> getLocation() async {
    try{
      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.lowest);
      latitude = position.latitude;
      longitude = position.longitude;
      print(position);
    }catch (e) {
      print(e);
      counter < 3 ? getLocation() : counter++;

    }
  }
}