import 'package:geolocator/geolocator.dart';

class Location {
  double latitude = 0.0;
  double longitude= 0.0;


  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy
              .low); //Location Accuracy is low inorder to consume battery life

      latitude = position.latitude;
      longitude = position.longitude;
    } catch (err) {
      print(err);
    }
  }
}
