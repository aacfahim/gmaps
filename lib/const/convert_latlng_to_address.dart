import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class ConvertLatLongToAddress extends StatefulWidget {
  const ConvertLatLongToAddress({super.key});

  @override
  State<ConvertLatLongToAddress> createState() =>
      _ConvertLatLongToAddressState();
}

class _ConvertLatLongToAddressState extends State<ConvertLatLongToAddress> {
  String fullAddress = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Convert LatLong to Address")),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () async {
                  List<Placemark> placemarks =
                      await placemarkFromCoordinates(23.7759703, 90.3991939);
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
                  decoration: BoxDecoration(color: Colors.blueAccent),
                  child: Center(child: Text("Convert")),
                ),
              ),
            ),
            Text(fullAddress),
          ]),
    );
  }
}
