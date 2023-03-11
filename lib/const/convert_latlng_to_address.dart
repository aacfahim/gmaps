import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:gmaps/const/const.dart';

class ConvertLatLongToAddress extends StatefulWidget {
  const ConvertLatLongToAddress({super.key});

  @override
  State<ConvertLatLongToAddress> createState() =>
      _ConvertLatLongToAddressState();
}

class _ConvertLatLongToAddressState extends State<ConvertLatLongToAddress> {
  late String fullAddress = "";
  double latitude = 0.0, longitude = 0.0;

  @override
  void initState() {
    getUserCurrentLocation().then((value) {
      setState(() {
        latitude = value.latitude;
        longitude = value.longitude;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Convert LatLong to Address")),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () async {
                  print("clicked");
                  getUserCurrentLocation().then((value) {
                    setState(() {
                      latitude = value.latitude;
                      longitude = value.longitude;
                    });
                  });
                  List<Placemark> placemarks =
                      await placemarkFromCoordinates(latitude, longitude);
                  setState(() {
                    fullAddress = placemarks.reversed.last.street.toString() +
                        " " +
                        placemarks.reversed.last.postalCode.toString() +
                        " " +
                        placemarks.reversed.last.locality.toString() +
                        " " +
                        placemarks.reversed.last.name.toString();
                  });

                  print(fullAddress);
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(color: Colors.blue),
                  child: Center(child: Text("Convert")),
                ),
              ),
            ),
            Text(fullAddress),
          ]),
    );
  }
}
