import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core/utils/marker_utils.dart';
import '../../core/router/page.dart';
import '../../core/router/route.dart';

class MapView extends ConsumerStatefulWidget {
  const MapView({super.key});

  @override
  ConsumerState<MapView> createState() => _MapViewState();
}

class _MapViewState extends ConsumerState<MapView> {
  bool isFixMode = true;
  Completer<GoogleMapController> _controller = Completer();
  Set<Circle> _circles = {
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
    ),
    Circle(
      circleId: CircleId('down'),
      center: LatLng(37.3928, 127.1112),
      radius: 50,
      fillColor: Colors.orange.withOpacity(0.2),
      strokeColor: Colors.orange,
      strokeWidth: 2,
    ),
  };
  Set<Marker> _markers = {};
  Location _location = Location();
  StreamSubscription<LocationData>? _locationSubscription;
  bool _serviceEnabled = false;
  late PermissionStatus _permissionGranted;

  @override
  void initState() {
    super.initState();
    _checkLocation();
    _addMarker();
  }

  Future<void> _checkLocation() async {
    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _location.onLocationChanged.listen((LocationData? locationData) async {
      if (locationData == null) return;

      final GoogleMapController controller = await _controller.future;
      final newLatLng = LatLng(locationData.latitude!, locationData.longitude!);

      controller.animateCamera(
        CameraUpdate.newLatLng(newLatLng),
      );
    });
  }

  Future<void> _addMarker() async {
    BitmapDescriptor customMarker = await MarkerUtils.createCustomMarkerFromNetworkImage(
        'https://lh3.googleusercontent.com/a/ACg8ocJ3BG_hU5cjETU5ybAU4FpBSNKHenbFzzliXiYsCQuHRX1luHU=s576-c-no');

    setState(() {
      _markers.addAll(
        [
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
  void dispose() {
    _locationSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final LatLng _center = const LatLng(37.3948, 127.1112);

    void _onMapCreated(GoogleMapController controller) {
      _controller.complete(controller);
    }

    return Material(
      color: context.colors.primary,
      child: Stack(
        children: [
          IgnorePointer(
            ignoring: isFixMode,
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              zoomControlsEnabled: false,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 17.0,
              ),
              circles: _circles,
              markers: _markers,
            ),
          ),
          if (isFixMode) ...[
            SafeArea(
              child: GestureDetector(
                onHorizontalDragEnd: (details) {
                  if (details.primaryVelocity == null) return;
                  if (details.primaryVelocity! > 0) ref.read(routerProvider).pushReplacementNamed(PAGE.RANK.name);
                  if (details.primaryVelocity! < 0) ref.read(routerProvider).pushReplacementNamed(PAGE.SETTING.name);
                },
                child: Container(
                  color: Colors.transparent,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
            SafeArea(
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  color: Colors.black,
                  child: '현재 위치 : 성남시 분당구\n보유한 땅 : 7 (54971.9㎡)'.text.color(Colors.white).make().p(10),
                ),
              ),
            ),
            SafeArea(
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () async =>
                      _controller.future.then((controller) => controller.animateCamera(CameraUpdate.zoomOut())),
                  icon: Icon(Icons.account_box_sharp, size: 40, color: Colors.black),
                ),
              ),
            ),
            SafeArea(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () => ref.read(routerProvider).pushReplacementNamed(PAGE.PLAY.name),
                  child: Container(
                    color: Colors.black,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        'EAT IT'.text.color(Colors.white).size(16).make().pOnly(right: 10),
                        Icon(Icons.restaurant_menu, color: Colors.white)
                      ],
                    ).p(10),
                  ).pOnly(bottom: 30),
                ),
              ),
            ),
          ],
          SafeArea(
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () => setState(() {
                  isFixMode = !isFixMode;

                  debugPrint('isFixMode => $isFixMode');
                }),
                icon: Icon(Icons.map_outlined, size: 40, color: Colors.black),
              ),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () async =>
                        _controller.future.then((controller) => controller.animateCamera(CameraUpdate.zoomIn())),
                    icon: Icon(Icons.add_box, size: 30, color: Colors.black),
                  ),
                  IconButton(
                    onPressed: () async =>
                        _controller.future.then((controller) => controller.animateCamera(CameraUpdate.zoomOut())),
                    icon: Icon(Icons.indeterminate_check_box, size: 30, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
