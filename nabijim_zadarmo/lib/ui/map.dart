import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nabijim_zadarmo/data/mapotic.dart';

class Map extends StatefulWidget {
  const Map();

  @override
  State createState() => MapState();
}

class MapState extends State<Map> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = Set();

  void _loadChargers() async {
    var chargers = await Mapotic.getChargers();
    var markers = chargers
        .map((e) => Marker(
            markerId: MarkerId("${e.latitude} ${e.longitude}"), position: LatLng(e.latitude, e.longitude)))
        .toSet();
    setState(() {
      _markers = markers;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadChargers();
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(children: [
      GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: CameraPosition(
            target: LatLng(49.74466489584751, 15.535501365084432), zoom: 5),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: _markers,
        myLocationButtonEnabled: true,
      )
    ]);
  }
}
