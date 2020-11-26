import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:nabijim_zadarmo/data/mapotic.dart';

class Map extends StatefulWidget {
  const Map();

  @override
  State createState() => MapState();
}

class MapState extends State<Map> {
  MapboxMapController mapController;

  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
  }

  void _loadChargers() async {
    var chargers = await Mapotic.getChargers();
    var symbols = chargers
        .map((e) => SymbolOptions(
            iconImage: "charging-station-15", geometry: LatLng(e.latitude, e.longitude)))
        .toList();
    mapController.addSymbols(symbols);
  }

  @override
  void initState() {
    super.initState();
    _loadChargers();
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(children: [
      MapboxMap(
        accessToken:
            "pk.eyJ1IjoiZGF2aWR2YXZyYSIsImEiOiJja2h6YXh1ZnQwOHgyMnJxa2g5OWhmY3NzIn0.yT7YzRhOtCS8cBcBB2AOUQ",
        onMapCreated: _onMapCreated,
        initialCameraPosition: const CameraPosition(
            zoom: 5, target: LatLng(49.74466489584751, 15.535501365084432)),
        attributionButtonMargins: Point(-50, -50),
        myLocationEnabled: true,
        myLocationTrackingMode: MyLocationTrackingMode.Tracking,
        myLocationRenderMode: MyLocationRenderMode.COMPASS,
        styleString: MapboxStyles.MAPBOX_STREETS
      )
    ]);
  }
}
