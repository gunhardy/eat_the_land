import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core/utils/marker_utils.dart';

class MapView extends ConsumerStatefulWidget {
  const MapView({super.key});

  @override
  ConsumerState<MapView> createState() => _MapViewState();
}

class _MapViewState extends ConsumerState<MapView> {
  GoogleMapController? mapController;
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
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _addMarker();
  }

  Future<void> _addMarker() async {
    BitmapDescriptor customMarker = await MarkerUtils.createCustomMarkerFromNetworkImage(
        'https://lh3.googleusercontent.com/a/ACg8ocJ3BG_hU5cjETU5ybAU4FpBSNKHenbFzzliXiYsCQuHRX1luHU=s576-c-no');

    setState(() {
      _markers.addAll(
        [
          Marker(
            markerId: MarkerId('center'),
            position: LatLng(37.3948, 127.1112),
            anchor: Offset(0.5, 0.5),
            icon: customMarker,
          ),
          Marker(
            markerId: MarkerId('left'),
            position: LatLng(37.3948, 127.1092),
            anchor: Offset(0.5, 0.5),
            icon: customMarker,
          ),
          Marker(
            markerId: MarkerId('right'),
            position: LatLng(37.3948, 127.1132),
            anchor: Offset(0.5, 0.5),
            icon: customMarker,
          ),
          Marker(
            markerId: MarkerId('up'),
            position: LatLng(37.3968, 127.1112),
            anchor: Offset(0.5, 0.5),
            icon: customMarker,
          ),
          Marker(
            markerId: MarkerId('down'),
            position: LatLng(37.3928, 127.1112),
            anchor: Offset(0.5, 0.5),
            icon: customMarker,
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {

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
          zoom: 17,
        ),
        circles: _circles,
        markers: _markers,
      ),
    );
  }
}
