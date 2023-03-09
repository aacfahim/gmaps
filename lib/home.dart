import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _ghit =
      CameraPosition(target: LatLng(23.7759703, 90.3991939), zoom: 18);

  List<Marker> _marker = [];
  List<Marker> _list = [];

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print(error.toString());
    });

    return await Geolocator.getCurrentPosition();
  }

  void onLoad() async {
    getUserCurrentLocation().then((value) async {
      _marker.add(Marker(
        markerId: MarkerId('02'),
        position: LatLng(value.latitude, value.longitude),
      ));

      CameraPosition cameraPosition = CameraPosition(
          target: LatLng(value.latitude, value.longitude), zoom: 19);

      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    });
  }

  @override
  void initState() {
    _marker.addAll(_list);
    onLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _ghit,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        //markers: Set<Marker>.of(_marker),
        mapType: MapType.normal,
        compassEnabled: true,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.my_location),
        onPressed: () {
          onLoad();
        },
      ),
    );
  }
}
