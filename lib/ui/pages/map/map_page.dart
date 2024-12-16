import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(-33.86, 151.20);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    print("지도 빌드됨");
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
        markers: {
          const Marker(
            markerId: const MarkerId("Sydney"),
            position: LatLng(-33.86, 151.20),
            infoWindow: InfoWindow(
              title: "Sydney",
              snippet: "Capital of New South Wales",
            ),
          ),
        },
      ),
    );
  }
}
