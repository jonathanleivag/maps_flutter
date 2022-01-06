import 'package:flutter/material.dart' show ChangeNotifier, FlutterLogo;
import 'package:flutter_map/plugin_api.dart' show Marker;
import 'package:latlong2/latlong.dart' show LatLng;

class MarkerProvider extends ChangeNotifier {
  List<Marker> markers = [];

  void addMarker(LatLng latLng) {
    markers.add(
      Marker(
        width: 80.0,
        height: 80.0,
        point: latLng,
        builder: (ctx) => const FlutterLogo(),
      ),
    );
    notifyListeners();
  }

  void removeMarkers() {
    markers.clear();
    notifyListeners();
  }
}
