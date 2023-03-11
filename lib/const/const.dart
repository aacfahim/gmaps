import 'package:geolocator/geolocator.dart';

String GMAP_API_KEY = 'AIzaSyAwgr9H8Eed-HdTV5wQZvNIDUOq6DUVLpk';

Future<Position> getUserCurrentLocation() async {
  await Geolocator.requestPermission()
      .then((value) {})
      .onError((error, stackTrace) {
    print(error.toString());
  });

  return await Geolocator.getCurrentPosition();
}
