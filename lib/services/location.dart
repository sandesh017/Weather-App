import 'package:geolocator/geolocator.dart';

class Location {
  int latitude = 0;
  int longitude= 0;


  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy
              .low); //Location Accuracy is low inorder to consume battery life

      latitude = (position.latitude).toInt();
      longitude = (position.longitude).toInt();
    } catch (error) {
      print(error);
    }
  }
}
