import 'package:geolocator/geolocator.dart';

Future<Position> getUserCurrentLocation() async {
  await Geolocator.requestPermission()
      .then((value) {})
      .onError((error, stackTrace) {
    print(error.toString());
  });

  return await Geolocator.getCurrentPosition();
}
