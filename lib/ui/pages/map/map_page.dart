import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  LatLng latLng;
  MapPage(this.latLng);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  List<Marker> _markers = [];

  @override
  void initState() {
    super.initState();
    _markers.add(
      Marker(
        markerId: MarkerId("1"),
        position: LatLng(widget.latLng.latitude, widget.latLng.longitude),
        infoWindow: InfoWindow(
          title: "1",
          snippet: "snippet",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print("지도 빌드됨");

    return Scaffold(
      appBar: AppBar(),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.latLng.latitude, widget.latLng.longitude),
          zoom: 16.0,
        ),
        markers: Set.from(_markers),
      ),
    );
  }
}
