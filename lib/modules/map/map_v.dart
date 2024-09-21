import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core/router/route.dart';
import '../../core/router/page.dart';

class MapView extends ConsumerStatefulWidget {
  const MapView({super.key});

  @override
  ConsumerState<MapView> createState() => _MapViewState();
}

class _MapViewState extends ConsumerState<MapView> {

  @override
  Widget build(BuildContext context) {
    late GoogleMapController mapController;
    Set<Circle> _circles = {
      Circle(
        circleId: CircleId('center'),
        center: LatLng(37.3948, 127.1112),
        radius: 50,
        fillColor: Colors.orange.withOpacity(0.2),
        strokeColor: Colors.orange,
        strokeWidth: 2,
      ),
      Circle(
        circleId: CircleId('left'),
        center: LatLng(37.3948, 127.1092),
        radius: 50,
        fillColor: Colors.orange.withOpacity(0.2),
        strokeColor: Colors.orange,
        strokeWidth: 2,
      ),
      Circle(
        circleId: CircleId('right'),
        center: LatLng(37.3948, 127.1132),
        radius: 50,
        fillColor: Colors.orange.withOpacity(0.2),
        strokeColor: Colors.orange,
        strokeWidth: 2,
      ),
      Circle(
        circleId: CircleId('up'),
        center: LatLng(37.3968, 127.1112),
        radius: 50,
        fillColor: Colors.orange.withOpacity(0.2),
        strokeColor: Colors.orange,
        strokeWidth: 2,
      ),Circle(
        circleId: CircleId('down'),
        center: LatLng(37.3928, 127.1112),
        radius: 50,
        fillColor: Colors.orange.withOpacity(0.2),
        strokeColor: Colors.orange,
        strokeWidth: 2,
      ),
    };

    final LatLng _center = const LatLng(37.3948, 127.1112);

    void _onMapCreated(GoogleMapController controller) {
      mapController = controller;
    }

    return Material(
      color: context.colors.primary,
      child: GoogleMap(
        onMapCreated: _onMapCreated,
        zoomGesturesEnabled: true,
        zoomControlsEnabled: true,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 17.5,
        ),
        circles: _circles,
        markers: {
          const Marker(
            markerId: const MarkerId("Center"),
            position: LatLng(37.3948, 127.1112),
            infoWindow: InfoWindow(
              title: "Center",
              snippet: "판교역",
            ),
          ), // Marker
        },
      ),
    );
  }
}
