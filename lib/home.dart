import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Completer<GoogleMapController> _controller = Completer();

  List<Marker> _marker = [];
  List<Marker> _list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GoogleMap(
      mapType: MapType.normal,
      myLocationButtonEnabled: true,
      compassEnabled: true,
      initialCameraPosition: CameraPosition(target: LatLng(0, 0)),
    ));
  }
}
