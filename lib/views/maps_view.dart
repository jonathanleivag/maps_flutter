import 'package:flutter/material.dart'
    show BuildContext, Key, StatelessWidget, Text, Widget;
import "package:flutter_map/flutter_map.dart"
    show FlutterMap, MapOptions, MarkerLayerOptions, TileLayerOptions;
import 'package:latlong2/latlong.dart' show LatLng;
import 'package:maps_flutter/providers/providers.dart' show MarkerProvider;
import 'package:maps_flutter/utils/utils.dart' show EnvUtils;
import 'package:provider/provider.dart' show Provider;

class MapsView extends StatelessWidget {
  const MapsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MarkerProvider markerProvider = Provider.of<MarkerProvider>(context);

    return FlutterMap(
      options: MapOptions(
        center: LatLng(51.5, -0.09),
        zoom: 13.0,
        onTap: (tapPosition, point) => markerProvider.addMarker(point),
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: EnvUtils.uriMapboxStyleUrl,
          additionalOptions: {
            'accessToken': EnvUtils.mapboxAccessToken,
            'id': 'mapbox.mapbox.streets-v8',
          },
          attributionBuilder: (_) {
            return const Text("© OpenStreetMap contributors");
          },
        ),
        MarkerLayerOptions(markers: markerProvider.markers),
      ],
    );
  }
}
